local log = _G.log or print
log("EXP_ENGINE: Loading Experiment Generator Engine (v6.9 Final Protocol)...")

local experiment_rules = require("experiment_rules")
local engine_module = require("creature_generator_engine") 

-- [[ CRITICAL: Capture Vanilla Functions Safely ]]
if not _G.vanilla_experiment_functions then
    _G.vanilla_experiment_functions = {
        humanoid = creatures.experiment.humanoid.default,
        humanoid_giant = creatures.experiment.humanoid_giant.default,
        beast_small = creatures.experiment.beast_small.default,
        beast_large = creatures.experiment.beast_large.default,
        failed_small = creatures.experiment.failed_small.default,
        failed_large = creatures.experiment.failed_large.default,
    }
end

-- ============================================================================
-- STATIC DEFINITIONS (FALLBACKS & ALIASES)
-- ============================================================================

-- Maps dynamic name variations back to the config Key
local ARCHETYPE_ALIASES = {
    -- BIOMACHINE variants
    ["BIOROID"] = "BIOMACHINE",
    ["BIOFRAME"] = "BIOMACHINE",
    ["BIODRONE"] = "BIOMACHINE",
    ["BIODEITY"] = "BIOMACHINE",
    ["BIOCALAMITY"] = "BIOMACHINE",
    ["BIOMECH"] = "BIOMACHINE",
    
    -- NECROMACHINE variants
    ["NECROID"] = "NECROMACHINE",
    ["NECROFRAME"] = "NECROMACHINE",
    ["NECRODRONE"] = "NECROMACHINE",
    ["NECRODEITY"] = "NECROMACHINE",
    ["NECROCALAMITY"] = "NECROMACHINE",
    ["NECROMECH"] = "NECROMACHINE",

    -- CYBERMACHINE variants
    ["CYBEROID"] = "CYBERMACHINE",
    ["CYBERFRAME"] = "CYBERMACHINE",
    ["CYBERDRONE"] = "CYBERMACHINE",
    ["CYBERDEITY"] = "CYBERMACHINE",
    ["CYBERCALAMITY"] = "CYBERMACHINE",
    ["CYBERMECH"] = "CYBERMACHINE",

    -- NANOMACHINE variants
    ["NANOROID"] = "NANOMACHINE",
    ["NANOFRAME"] = "NANOMACHINE",
    ["NANODRONE"] = "NANOMACHINE",
    ["NANODEITY"] = "NANOMACHINE",
    ["NANOCALAMITY"] = "NANOMACHINE",
    ["NANOMECH"] = "NANOMACHINE",
    
    -- HOLOMACHINE variants
    ["HOLOROID"] = "HOLOMACHINE",
    ["HOLOFRAME"] = "HOLOMACHINE",
    ["HOLODRONE"] = "HOLOMACHINE",
    ["HOLODEITY"] = "HOLOMACHINE",
    ["HOLOCALAMITY"] = "HOLOMACHINE",
    ["HOLOMECH"] = "HOLOMACHINE",

    -- EXCASTE variants
    ["OUTCASTE"] = "EXCASTE",
    
    -- Standard Castes (Self-mapping for safety)
    ["LOCASTE"] = "LOCASTE",
    ["HICASTE"] = "HICASTE",
    ["NUCASTE"] = "NUCASTE",
    ["CYCASTE"] = "CYCASTE"
}

-- Fallback map for rating tags if config lookup fails
local COMMON_RATING_MAP = {
    ["SPNT"] = "SOPHONT",
    ["HSTL"] = "HOSTILE",
    ["VSSL"] = "VESSEL",
    ["DVNT"] = "DEVIANT",
    ["AVTR"] = "AVATAR",
    ["INCR"] = "INCURSION",
    ["NCUR"] = "INCURSION", -- Handle typo/variant
    ["DNGR"] = "DANGEROUS",
    ["BNGN"] = "BENIGN",
    ["HZRD"] = "HAZARDOUS",
    ["PRBM"] = "PROBLEMATIC",
    ["EXST"] = "EXISTENTIAL",
    ["VRMN"] = "VERMIN",
    ["AMBT"] = "AMBIENT",
    ["DMST"] = "DOMESTIC",
    ["VHCL"] = "VEHICLE",
    ["CRER"] = "CARRIER",
    ["NMAD"] = "NOMAD",
    ["WEPN"] = "WEAPON",
    ["LABR"] = "LABOR",
    ["SRVT"] = "SERVANT",
    ["HNTR"] = "HUNTER",
    ["SNTN"] = "SANITATION",
    ["PRDC"] = "PRODUCT",
    ["CMPN"] = "COMPANION",
    ["MLTR"] = "MILITARY"
}

-- ============================================================================
-- ENGINE LOGIC
-- ============================================================================

-- Helper: Get context for description generation
local function get_ropar_context()
    local ctx = { name = "Unknown", race = "Unknown", civ = "Unknown", year = tostring(world.year or 0) }
    local ropar = _G.random_object_parameters
    if ropar then
        if ropar.experimenter_hf and ropar.experimenter_hf.name then ctx.name = ropar.experimenter_hf.name.translated end
        if ropar.experimenter_race_name then ctx.race = ropar.experimenter_race_name end
        if ropar.experimenter_capital_st and ropar.experimenter_capital_st.name then ctx.civ = ropar.experimenter_capital_st.name.translated end
    end
    return ctx
end

-- Helper: Pick weighted outcome from table
local function pick_weighted_outcome(outcomes)
    local total = 0
    for _, out in ipairs(outcomes) do total = total + (out.weight or 1) end
    local roll = math.random(0, total - 1)
    local current = 0
    for _, out in ipairs(outcomes) do
        current = current + (out.weight or 1)
        if roll < current then return out end
    end
    return outcomes[1]
end

-- [[ NEW: Advanced ID Parser ]]
-- Parses strings like: "BIOMACHINE_ID_MDM_SPNT_1111_DEVIL" or "BIOROID ID-MDM-DVNT-1670"
-- Returns: archetype, sub_archetype, resolved_rating_tag
local function parse_experimenter_identity(lookup_config)
    local ropar = _G.random_object_parameters
    if not ropar then return nil, nil, nil end

    local raw_id = nil
    
    -- 1. Try Token (Best for accuracy - includes sub-archetype)
    if ropar.experimenter_creature and ropar.experimenter_creature.creature_id then
        raw_id = ropar.experimenter_creature.creature_id
    end

    -- 2. Fallback to Name (Common in experiments, often lacks sub-archetype)
    if not raw_id and ropar.experimenter_race_name then
        raw_id = string.upper(ropar.experimenter_race_name)
    end

    if not raw_id then return nil, nil, nil end

    log("EXP_ENGINE: Parsing Identity from [" .. raw_id .. "]")

    -- Normalize separators (replace spaces and hyphens with underscores for unified splitting)
    local normalized_id = raw_id:gsub("[ -]", "_")
    
    -- Split into parts
    local parts = {}
    for part in string.gmatch(normalized_id, "[^_]+") do
        table.insert(parts, part)
    end

    if #parts < 2 then return parts[1], nil, nil end

    -- A. EXTRACT ARCHETYPE (First Part)
    local raw_archetype = parts[1]
    
    -- Resolve Alias (BIOROID -> BIOMACHINE)
    local resolved_archetype = ARCHETYPE_ALIASES[raw_archetype] or raw_archetype

    -- B. EXTRACT SUB-ARCHETYPE (Last Part)
    local sub_archetype = parts[#parts]
    
    -- Sanity Check: If the last part is a number (the ID code), then there is NO sub-archetype in this string.
    -- (This happens when parsing Names instead of Tokens)
    if tonumber(sub_archetype) then
        sub_archetype = nil
    end
    
    -- C. DETECT RATING (Middle Parts)
    local found_rating = nil
    
    -- Method 1: Build map from config
    local reverse_map = {}
    if lookup_config and lookup_config.TRAIT_NAME_MODIFIERS then
        for full_tag, abbr in pairs(lookup_config.TRAIT_NAME_MODIFIERS) do
            reverse_map[abbr] = full_tag
        end
    end
    
    -- Scan parts for a known abbreviation
    for _, part in ipairs(parts) do
        -- Check Config Map
        if reverse_map[part] then
            found_rating = reverse_map[part]
            break
        -- Check Fallback Map
        elseif COMMON_RATING_MAP[part] then
            found_rating = COMMON_RATING_MAP[part]
            break
        end
    end
    
    if found_rating then
        log("EXP_ENGINE: >> Resolved Rating [" .. found_rating .. "]")
    end

    return resolved_archetype, sub_archetype, found_rating
end

-- [[ NEW: Victim Validator ]]
-- Checks if the target creature (victim) is in the rule's 'allowed_targets' list
local function check_allowed_targets(case, ropar)
    -- If the rule doesn't specify allowed_targets, everything is permitted.
    if not case.allowed_targets then return true end
    
    -- If ropar is missing (shouldn't happen in experiment hook), default to allow to avoid crash
    if not ropar then return true end
    
    -- If experimenter_source_race is -1, it means the creature is created from nothing (no victim).
    -- We treat this as valid/neutral.
    if ropar.experimenter_source_race == -1 then return true end

    local victim_id = nil
    
    -- Attempt 1: Check Creature Object ID (Best)
    if ropar.experiment_source_creature and ropar.experiment_source_creature.creature_id then
        victim_id = ropar.experiment_source_creature.creature_id
    end
    
    -- Attempt 2: Check Race Name (Fallback)
    if not victim_id and ropar.experiment_source_race_name then
        victim_id = string.upper(ropar.experiment_source_race_name)
    end

    if not victim_id then
        log("EXP_ENGINE: Warning - Could not identify victim ID. Assuming valid.")
        return true
    end

    -- Validation Loop
    for _, allowed in ipairs(case.allowed_targets) do
        -- We check if the Victim ID contains the Allowed Tag (e.g., "LOCASTE_ID_..." contains "LOCASTE")
        if string.find(victim_id, allowed) then
            return true
        end
    end

    log("EXP_ENGINE: >> REJECTED: Victim ["..victim_id.."] is not in allowed list for this case.")
    return false
end

local function run_experiment_hook(experiment_type, tok)
    
    -- PHASE 1: PRE-LOOKUP FOR CONFIG
    -- We grab the first available config from the rules to use as a decoder.
    local decoder_config = nil
    for _, rule in pairs(experiment_rules.outcomes_by_experimenter_tag) do
        if rule.cases and rule.cases[1] and rule.cases[1].outcomes[1] then
            decoder_config = rule.cases[1].outcomes[1].config
            break
        end
    end

    -- PHASE 2: PARSE IDENTITY
    local exp_archetype, exp_sub, exp_rating = parse_experimenter_identity(decoder_config)
    
    -- Fallback Fuzzy Match if Alias lookup failed (Safety Net)
    if exp_archetype and not experiment_rules.outcomes_by_experimenter_tag[exp_archetype] then
        for key, _ in pairs(experiment_rules.outcomes_by_experimenter_tag) do
            if string.find(key, exp_archetype) or string.find(exp_archetype, key) then
                log("EXP_ENGINE: >> Fuzzy Match: Mapped [" .. exp_archetype .. "] -> [" .. key .. "]")
                exp_archetype = key
                break
            end
        end
    end

    log("EXP_ENGINE: Request ["..experiment_type.."]. Final Context: Archetype=["..tostring(exp_archetype).."], Sub=["..tostring(exp_sub).."], Rating=["..tostring(exp_rating).."]")

    -- PHASE 3: RULE EXECUTION
    local rule_entry = experiment_rules.outcomes_by_experimenter_tag[exp_archetype]

    if rule_entry then
        -- A. Inheritance Logic
        local inherited_sub_archetypes = nil
        if exp_sub and rule_entry.sub_archetype_inheritance then
            inherited_sub_archetypes = rule_entry.sub_archetype_inheritance[exp_sub]
        end

        -- B. Case Selection Logic
        local valid_outcomes = nil
        local ropar = _G.random_object_parameters
        
        if rule_entry.cases then
            -- 1. Try to find a case matching the detected rating (e.g. "DEVIANT")
            if exp_rating then
                for _, case in ipairs(rule_entry.cases) do
                    -- [[ CHECK TARGETS ]]
                    if case.required_secondary_tag == exp_rating and check_allowed_targets(case, ropar) then
                        valid_outcomes = case.outcomes
                        log("EXP_ENGINE: >> Matched Case via Rating [" .. exp_rating .. "]")
                        break
                    end
                end
            end
            
            -- 2. Fallback: Find a default case (no required tag)
            if not valid_outcomes then
                for _, case in ipairs(rule_entry.cases) do
                    -- [[ CHECK TARGETS ]]
                    if not case.required_secondary_tag and check_allowed_targets(case, ropar) then
                        valid_outcomes = case.outcomes
                        log("EXP_ENGINE: >> Using Default Case.")
                        break
                    end
                end
            end
        end

        -- C. Outcome Generation
        if valid_outcomes then
            local chosen_outcome = pick_weighted_outcome(valid_outcomes)
            
            if chosen_outcome and chosen_outcome.config then
                local config = {}
                for k,v in pairs(chosen_outcome.config) do config[k] = v end
                
                config.forced_rating = chosen_outcome.forced_rating
                
                -- Apply Inheritance or Override
                if chosen_outcome.forced_sub_archetypes then
                    config.forced_sub_archetypes = chosen_outcome.forced_sub_archetypes
                else
                    config.forced_sub_archetypes = inherited_sub_archetypes
                end

                config.experiment_context = {
                    type = experiment_type,
                    token = tok,
                    experimenter_id = exp_archetype,
                    ropar_ctx = get_ropar_context(),
                    desc_func = chosen_outcome.description_generator
                }
                
                local result = engine_module.generate_data_only(config)
                
                if result and result[1] and result[1].creature then
                    local lines = result[1].creature

                    -- [[ START ROBUST POST-PROCESSING ]] --
                    
                    -- New Container for cleaned lines
                    local cleaned_lines = {}
                    
                    -- We inject [NIGHT_CREATURE] at the very top to ensure it applies
                    table.insert(cleaned_lines, "[NIGHT_CREATURE]")

                    -- Step 1: Build Experimenter Description
                    local extra_desc = ""
                    if config.experiment_context and config.experiment_context.desc_func and config.experiment_context.ropar_ctx then
                        extra_desc = config.experiment_context.desc_func(config.experiment_context.ropar_ctx)
                    end

                    -- Flags for Caste Flattening logic
                    local caste_section_found = false
                    local skip_remaining_lines = false

                    for _, line in ipairs(lines) do
                        -- CRITICAL FIX: Remove [CREATURE:...] entirely.
                        if line:match("^%[CREATURE:") then
                             -- Skip this line.
                        
                        -- OPTIONAL FLATTENING: 
                        -- If you want to preserve Male/Female difference, keep [CASTE:...] tags.
                        -- If you want to force it into the experiment "DEFAULT" caste, uncomment the logic below.
                        -- For now, we KEEP castes as vanilla experiments support multi-caste outcomes.
                        
                        else
                            -- DESCRIPTION INJECTION
                            if line:match("^%[DESCRIPTION:") and (string.find(line, "in mass", 1, true) or string.find(line, "APPROX_MASS", 1, true)) then
								if extra_desc ~= "" then
									local content = line:match("^%[DESCRIPTION:(.*)%]$") or ""
									if not string.find(content, extra_desc, 1, true) then
										local spacer = (content ~= "" and content:sub(-1) ~= " ") and " " or ""
										line = "[DESCRIPTION:" .. content .. spacer .. extra_desc .. "]"
										log("EXP_ENGINE: Appended description to main block.")
									end
								end
							end
							
                            
                            table.insert(cleaned_lines, line)
                        end
                    end
                    
                    -- [[ END POST-PROCESSING ]] --

                    -- [[ CRITICAL FIX: RETURN 'raws' FOR EXPERIMENTS ]]
                    return { raws = cleaned_lines, weight = 100 }
                end
            end
        else
            log("EXP_ENGINE: >> Error: No valid case found for this experimenter state (Target mismatch or Missing Config).")
            -- [[ CRITICAL: RETURN NIL TO ABORT ]] 
            -- If we matched an Archetype (Rule Entry exists) but found no valid case (Target Invalid),
            -- we return NIL to stop the game from falling back to a generic vanilla blob.
            return nil
        end
    else
         log("EXP_ENGINE: No rule found for [" .. tostring(exp_archetype) .. "]. Falling back to vanilla.")
    end

    -- Fallback (Only for unknown archetypes)
    if _G.vanilla_experiment_functions[experiment_type] then
        return _G.vanilla_experiment_functions[experiment_type](tok)
    else
        return { raws = {}, weight = 0 }
    end
end

creatures.experiment.humanoid.default = function(tok) return run_experiment_hook("humanoid", tok) end
creatures.experiment.humanoid_giant.default = function(tok) return run_experiment_hook("humanoid_giant", tok) end
creatures.experiment.beast_small.default = function(tok) return run_experiment_hook("beast_small", tok) end
creatures.experiment.beast_large.default = function(tok) return run_experiment_hook("beast_large", tok) end
creatures.experiment.failed_small.default = function(tok) return run_experiment_hook("failed_small", tok) end
creatures.experiment.failed_large.default = function(tok) return run_experiment_hook("failed_large", tok) end

return {}