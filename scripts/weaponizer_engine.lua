local M = {}

-- ============================================================================
-- CONFIGURATION
-- ============================================================================
local CREATURE_CONFIG_FILES = {
    "config_biomachine",
}

-- ============================================================================
-- HELPERS
-- ============================================================================

local function extract_caste_data(raw_lines)
    local data = {} -- Key: CasteID, Value: { description = string }
    if not raw_lines then return data end
    
    local current_caste_id = nil
    
    for _, line in ipairs(raw_lines) do
        local token = line:match("^%s*%[CASTE:([^:%]]+)%]")
        if token then
            current_caste_id = token
            if not data[current_caste_id] then
                data[current_caste_id] = { description = "" }
            end
        elseif current_caste_id then
            local desc = line:match("^%s*%[DESCRIPTION:(.+)%]")
            if desc then
                desc = desc:gsub("%]$", "")
                data[current_caste_id].description = desc
            end
        end
    end
    return data
end

-- Formats COILGUN_TURRET into Coilgun Turret
local function format_weapon_name(key)
    if not key then return "" end
    local text = key:gsub("_", " ")
    text = text:lower():gsub("(%l)(%w*)", function(a,b) return string.upper(a)..b end)
    return text
end

-- Determines if a creature meets the criteria for a single weapon definition
local function is_creature_eligible_for_weapon(creature_data, weapon_def)
    if not weapon_def then return false end

    -- 1. Check Archetype
    if weapon_def.eligible_archetypes then
        local arch_match = false
        local creature_archs = creature_data.archetypes or { creature_data.ARCHETYPE_CLASS } or {}
        for _, req_arch in ipairs(weapon_def.eligible_archetypes) do
            for _, creat_arch in ipairs(creature_archs) do
                if req_arch == creat_arch then
                    arch_match = true
                    break
                end
            end
            if arch_match then break end
        end
        if not arch_match then return false end
    end

    -- 2. Check Rating Tags
    if weapon_def.eligible_rating_tags and creature_data.rating_tags then
        local tag_match = false
        for _, req_tag in ipairs(weapon_def.eligible_rating_tags) do
            for _, creat_tag in ipairs(creature_data.rating_tags) do
                if req_tag == creat_tag then
                    tag_match = true
                    break
                end
            end
            if tag_match then break end
        end
        if not tag_match then return false end
    end

    -- 3. Check Size Tags
    if weapon_def.eligible_size_tags then
        local size_match = false
        local c_size = creature_data.size_tag or "MEDIUM"
        for _, req_size in ipairs(weapon_def.eligible_size_tags) do
            if req_size == c_size then
                size_match = true
                break
            end
        end
        if not size_match then return false end
    end

    -- 4. Check Sub-Archetypes
    if weapon_def.eligible_sub_archetypes and creature_data.sub_archetypes then
        local sub_match = false
        for _, req_sub in ipairs(weapon_def.eligible_sub_archetypes) do
            for _, creat_sub in ipairs(creature_data.sub_archetypes) do
                if req_sub == creat_sub then
                    sub_match = true
                    break
                end
            end
            if sub_match then break end
        end
        if not sub_match then return false end
    end

    return true
end

-- Apply specific weapon tokens (Body, Interactions, Name, Description)
-- 'weapon_objects' is a list of the actual weapon definition tables (not just keys)
local function apply_loadout_content(lines, weapon_objects, original_description)
    
    -- [[ 1. Description Injection ]]
    local weapon_names_list = {}
    local lowest_pop_mult = 1.0
    
    for _, w_def in ipairs(weapon_objects) do
        local d_name = w_def.description or "Weapon"
        if not w_def.description and w_def.key then
             d_name = format_weapon_name(w_def.key)
        end
        table.insert(weapon_names_list, d_name)
        
        if w_def.pop_ratio_multiplier and w_def.pop_ratio_multiplier < lowest_pop_mult then
            lowest_pop_mult = w_def.pop_ratio_multiplier
        end
    end
    
    local armaments_str = ""
    if #weapon_names_list > 0 then
        armaments_str = "ARMAMENTS= " .. table.concat(weapon_names_list, "|")
    end

    local final_desc_str = ""
    local base_desc = original_description or ""
    
    local pre_mass, post_mass = base_desc:match("^(.-)(APPROX_MASS=.*)$")
    
    if pre_mass and post_mass and armaments_str ~= "" then
        local clean_pre = pre_mass:gsub("%s+$", "") 
        if not clean_pre:match("/$") then
             clean_pre = clean_pre .. "/"
        end
        final_desc_str = clean_pre .. armaments_str .. "/" .. post_mass
    elseif armaments_str ~= "" then
        final_desc_str = base_desc .. " /" .. armaments_str
    else
        final_desc_str = base_desc
    end
    
    -- Insert updated description
    table.insert(lines, "[DESCRIPTION:" .. final_desc_str .. "]")

    -- [[ 2. Pop Ratio ]]
    if lowest_pop_mult < 1.0 then
        local base_ratio = 50 
        local new_ratio = math.max(1, math.floor(base_ratio * lowest_pop_mult))
        table.insert(lines, "[POP_RATIO:" .. new_ratio .. "]")
    end

    -- [[ 3. Components (Body & Interactions) ]]
    for _, w_def in ipairs(weapon_objects) do
        if w_def.body then table.insert(lines, w_def.body) end
        if w_def.interaction then table.insert(lines, w_def.interaction) end
    end
end

-- ============================================================================
-- PUBLIC API
-- ============================================================================

function M.generate_for_list(creature_list, weapon_configs)
    local generated_raws = {}
    local count = 0

    if not creature_list then return generated_raws, 0 end
    -- We now look for WEAPONS, not LOADOUTS
    if not weapon_configs or not weapon_configs.WEAPONS then 
        if _G.log then _G.log("WEAPONIZER_LOG: No valid WEAPONS table provided.") end
        return generated_raws, 0 
    end

    local all_weapons_db = weapon_configs.WEAPONS

    for key, creature in pairs(creature_list) do
        
        -- 1. Scan ALL weapons for eligibility
        local eligible_globals = {} -- Weapons with NO exclusion_group
        local eligible_groups = {}  -- Key: exclusion_group, Value: List of weapon_defs
        
        local has_any_weapon = false

        for w_key, w_def in pairs(all_weapons_db) do
            -- Inject key for helper usage
            w_def.key = w_key 
            
            if is_creature_eligible_for_weapon(creature, w_def) then
                has_any_weapon = true
                if w_def.exclusion_group then
                    if not eligible_groups[w_def.exclusion_group] then
                        eligible_groups[w_def.exclusion_group] = {}
                    end
                    table.insert(eligible_groups[w_def.exclusion_group], w_def)
                else
                    table.insert(eligible_globals, w_def)
                end
            end
        end

        if has_any_weapon then
            local target_id = creature.id
            if not target_id and type(key) == "string" and key:match("ID_") then target_id = key end

            if target_id then
                local caste_data = extract_caste_data(creature.raw_lines)
                local caste_ids = {}
                for id, _ in pairs(caste_data) do table.insert(caste_ids, id) end
                table.sort(caste_ids)

                if #caste_ids == 0 then 
                    if _G.log then _G.log("WEAPONIZER_LOG: WARNING - No castes found for " .. target_id) end
                else
                    table.insert(generated_raws, "[SELECT_CREATURE:" .. target_id .. "]")

                    -- 2. Build Permutations
                    -- If we have multiple exclusion groups, we technically need a cartesian product.
                    -- E.g. [Main: Cannon, Missile] AND [Side: Blade, Saw].
                    -- Result: Cannon+Blade, Cannon+Saw, Missile+Blade, Missile+Saw.
                    -- For now, let's assume we handle 1 layer of Main Weapons for duplication 
                    -- and treat other exclusive groups as simple additions (taking the first valid).
                    -- OR, we handle the recursive combination properly. Let's do a simple recursive combiner.

                    local groups_to_combine = {}
                    for g_name, list in pairs(eligible_groups) do
                        table.insert(groups_to_combine, list)
                    end

                    local permutations = {}
                    
                    local function recursive_combine(group_index, current_loadout)
                        if group_index > #groups_to_combine then
                            -- Base case: we've picked one from every group (or there were no groups)
                            -- Add globals
                            local final_loadout = {}
                            for _, w in ipairs(current_loadout) do table.insert(final_loadout, w) end
                            for _, w in ipairs(eligible_globals) do table.insert(final_loadout, w) end
                            table.insert(permutations, final_loadout)
                            return
                        end

                        local current_group_options = groups_to_combine[group_index]
                        for _, option in ipairs(current_group_options) do
                            local next_loadout = {}
                            for _, w in ipairs(current_loadout) do table.insert(next_loadout, w) end
                            table.insert(next_loadout, option)
                            
                            recursive_combine(group_index + 1, next_loadout)
                        end
                    end

                    recursive_combine(1, {})
                    
                    -- If no exclusive groups existed, we just have one permutation (Globals only)
                    if #groups_to_combine == 0 and #eligible_globals > 0 then
                        permutations = { eligible_globals }
                    end

                    -- 3. Apply Permutations
                    -- Index 1 = Integration (SELECT_CASTE)
                    -- Index 2+ = Duplication (USE_CASTE)
                    
                    -- To ensure stable RAW generation, sort permutations? 
                    -- Hard to sort tables of tables, but we trust the recursive order for now.

                    -- A. Process Duplicates First (2..N)
                    if #permutations > 1 then
                        for i = 2, #permutations do
                            local loadout = permutations[i]
                            
                            -- Generate a suffix for the caste ID based on the weapons
                            -- e.g. _CANNON_BLADE
                            local id_suffix = ""
                            local name_suffix = ""
                            for _, w in ipairs(loadout) do
                                -- Only use exclusive items for naming to keep it short
                                if w.exclusion_group then
                                    id_suffix = id_suffix .. "_" .. w.key
                                    name_suffix = name_suffix .. " " .. (w.description or w.key)
                                end
                            end
                            if id_suffix == "" then id_suffix = "_VAR" .. i end 
                            
                            for _, base_caste_id in ipairs(caste_ids) do
                                local new_caste_id = base_caste_id .. id_suffix
                                local original_desc = caste_data[base_caste_id].description
                                
                                table.insert(generated_raws, "[CASTE:" .. new_caste_id .. "]")
                                table.insert(generated_raws, "[USE_CASTE:" .. base_caste_id .. "]")
                                
                                -- Add flavor name suffix
                                local new_caste_name = "Assault" .. name_suffix
                                table.insert(generated_raws, "[CASTE_NAME:" .. new_caste_name .. ":" .. new_caste_name .. "s:" .. new_caste_name .. "]")

                                apply_loadout_content(generated_raws, loadout, original_desc)
                            end
                            count = count + 1
                        end
                    end

                    -- B. Process Integration (1)
                    if #permutations > 0 then
                        local primary_loadout = permutations[1]
                        
                        -- For the base caste, we might want to update the name too
                        local name_suffix = ""
                        for _, w in ipairs(primary_loadout) do
                            if w.exclusion_group then
                                name_suffix = name_suffix .. " " .. (w.description or w.key)
                            end
                        end
                        if name_suffix == "" then name_suffix = " armed" end

                        for _, base_caste_id in ipairs(caste_ids) do
                            local original_desc = caste_data[base_caste_id].description
                            table.insert(generated_raws, "[SELECT_CASTE:" .. base_caste_id .. "]")
                            
                            -- Optional: Update base caste name to reflect it is now armed
                            local new_caste_name = "Standard" .. name_suffix
                            table.insert(generated_raws, "[CASTE_NAME:" .. new_caste_name .. ":" .. new_caste_name .. "s:" .. new_caste_name .. "]")
                            
                            apply_loadout_content(generated_raws, primary_loadout, original_desc)
                        end
                        count = count + 1
                    end
                end
            end
        end
    end
    
    return generated_raws, count
end

return M