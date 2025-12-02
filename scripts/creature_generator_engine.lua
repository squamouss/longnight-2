-- #region Utility Functions
local difficulty_calculator = require("rules.difficulty_calculator")
local petvalue_calculator = require("rules.petvalue_calculator")
local maxage_calculator = require("rules.maxage_calculator")
local buildingdestroyer_calculator = require("rules.buildingdestroyer_calculator") 
local name_resolver = require("rules.name_resolver")
local rating_token_rules = require("rules.rating_token_rules")
local megabeast_calculator = require("rules.megabeast_calculator")
local avatar_sphere_rules = require("rules.avatar_sphere_rules") 
local existential_variant_rules = require("rules.existential_variant_rules")
local natural_skills_calculator = require("rules.natural_skill_calculator")
local population_calculator = require("rules.population_calculator") 
local frequency_calculator = require("rules.frequency_calculator")
local cluster_calculator = require("rules.cluster_calculator")


local function deep_copy(original)
    if not original then return nil end
    local copy = {}
    for k, v in pairs(original) do
        if type(v) == "table" then
            v = deep_copy(v)
        end
        copy[k] = v
    end
    return copy
end

local function split_to_lines(current_lines_table, raw_block)
    if not raw_block then return current_lines_table end
    
    local content_type = type(raw_block)
    if content_type == 'string' then
        for line in raw_block:gmatch("[^\r\n]+") do
            if line:match("%S") then 
                table.insert(current_lines_table, line)
            end
        end
    elseif content_type == 'table' then
        for _, line in ipairs(raw_block) do
            if type(line) == 'string' and line:match("%S") then
                 table.insert(current_lines_table, line)
            end
        end
    end
    return current_lines_table
end

local function table_contains(tbl, val)
    if not tbl then return false end
    for _, v in ipairs(tbl) do
        if v == val then return true end
    end
    return false
end

local function pick_random(tbl)
    if not tbl or #tbl == 0 then return nil end
    local total_weight = 0
    for _, item in ipairs(tbl) do
        total_weight = total_weight + (item.weight or 1)
    end
    if total_weight == 0 then return nil end
    
    local rand_func = _G.trandom or math.random
    local random_point = rand_func(total_weight)
    if not _G.trandom then random_point = random_point -1 end

    local current_weight = 0
    for _, item in ipairs(tbl) do
        current_weight = current_weight + (item.weight or 1)
        if random_point < current_weight then
            return item
        end
    end
    return nil
end

local function generate_numeric_code(num_digits)
    local code = ""
    local rand_func = _G.trandom or function(n) return math.random(0, n - 1) end
    for i = 1, num_digits do
        code = code .. rand_func(10)
    end
    return code
end

local function filter_components_by_tags(component_list, rating_tags, size_tags, valid_sub_archetypes)
    local filtered_list = {}

    for _, component in ipairs(component_list) do
        -- Sub-Archetype Filtering
        local archetype_ok = true
        if valid_sub_archetypes and #valid_sub_archetypes > 0 then
            if component.sub_archetype and #component.sub_archetype > 0 then
                local match_found = false
                for _, comp_arch in ipairs(component.sub_archetype) do
                    if table_contains(valid_sub_archetypes, comp_arch) then
                        match_found = true
                        break
                    end
                end
                if not match_found then
                    archetype_ok = false
                end
            end
        end

        if archetype_ok then
            local rating_ok = true
            if component.eligible_rating_tags and #component.eligible_rating_tags > 0 then
                rating_ok = false
                for _, req_tag in ipairs(component.eligible_rating_tags) do
                    if table_contains(rating_tags, req_tag) then
                        rating_ok = true
                        break
                    end
                end
            end

            if rating_ok then
                local size_ok = true
                if component.eligible_size_tags and #component.eligible_size_tags > 0 and size_tags and #size_tags > 0 then
                    size_ok = false
                    for _, req_tag in ipairs(component.eligible_size_tags) do
                        if table_contains(size_tags, req_tag) then
                            size_ok = true
                            break
                        end
                    end
                end

                if size_ok then
                    table.insert(filtered_list, component)
                end
            end
        end
    end

    return filtered_list
end

local function pick_weighted_random_multiplier(distribution_weights)
    local rand_func = _G.trandom or function(n) return math.random(0, n - 1) end
    if not distribution_weights then return rand_func(9) + 1 end
    local total_weight = 0
    for _, weight in pairs(distribution_weights) do total_weight = total_weight + weight end
    if total_weight == 0 then return rand_func(9) + 1 end
    local random_point = rand_func(total_weight)
    local current_weight_sum = 0
    for multiplier = 1, 9 do
        current_weight_sum = current_weight_sum + (distribution_weights[multiplier] or 0)
        if random_point < current_weight_sum then return multiplier end
    end
    return rand_func(9) + 1
end

local function assign_unique_ids(tbl, prefix)
    prefix = prefix or "id"
    for i, entry in ipairs(tbl) do entry.id = prefix .. "_" .. i end
end

local function assign_all_component_ids(config)
    if config._ids_assigned then return end
    
    assign_unique_ids(config.interaction_rating, "rating")
    assign_unique_ids(config.generic_body_size_variants, "size_variant")
    if config.non_sophont_caste_groups then
        assign_unique_ids(config.non_sophont_caste_groups, "caste_group")
    end
    for _, component_config in ipairs(config.COMPONENT_TABLES) do
        assign_unique_ids(config[component_config.table_key], component_config.name)
    end
    if config.flowchart_data then
        for key, flowchart_table in pairs(config.flowchart_data) do
            assign_unique_ids(flowchart_table, key)
        end
    end
    config._ids_assigned = true
end
-- #endregion

-- #region Core Generation Logic

local function get_caste_specific_value(component, base_key, caste_type)
    if not component then return nil end
    local primary_key = caste_type .. "_" .. base_key
    local fallback_key = "mundane_" .. base_key

    if caste_type == "core" then
        return component[primary_key] or component[fallback_key] or component[base_key]
    elseif caste_type == "mundane" then
        return component[primary_key] or component[base_key]
    elseif caste_type == "transcendent" then
        local transcendent_key = "transcendent_" .. base_key
        return component[transcendent_key] or component[base_key]
    else 
        return component[base_key]
    end
end

local function process_flowchart_tables(config, components, tables_to_process, parent_component)
    if not tables_to_process or #tables_to_process == 0 then
        return true
    end

    for _, table_name in ipairs(tables_to_process) do
        local flowchart_table = config.flowchart_data and config.flowchart_data[table_name]
        if flowchart_table then
            local compatible_options = filter_components_by_tags(flowchart_table, components.rating.tags, components.size_variant.size_tags or {}, components.sub_archetypes)
            local chosen_flowchart_entry = deep_copy(pick_random(compatible_options))

            if not chosen_flowchart_entry then
                return false
            end
            
            if not parent_component.flowchart_selections then
                parent_component.flowchart_selections = {}
            end
            table.insert(parent_component.flowchart_selections, chosen_flowchart_entry)

            if chosen_flowchart_entry.next_tables and #chosen_flowchart_entry.next_tables > 0 then
                local success = process_flowchart_tables(config, components, chosen_flowchart_entry.next_tables, chosen_flowchart_entry)
                if not success then return false end
            end
        else
            print("Error: Flowchart table not found in config.flowchart_data: " .. table_name)
            return false
        end
    end
    return true
end

local function generate_creature_fingerprint(config, components)
    local hash_parts = {}
    for _, component_config in ipairs(config.COMPONENT_TABLES) do
        if component_config.use_for_fingerprint == nil or component_config.use_for_fingerprint == true then
            local main_comp = components[component_config.name]
            if main_comp and main_comp.id then
                table.insert(hash_parts, main_comp.id)
            end
            local function add_flowchart_hashes(parent_comp)
                if parent_comp and parent_comp.flowchart_selections then
                    for _, selection in ipairs(parent_comp.flowchart_selections) do
                        table.insert(hash_parts, selection.id or ("fc_"..tostring(selection.desc_part)))
                        add_flowchart_hashes(selection)
                    end
                end
            end
            add_flowchart_hashes(main_comp)
        end
    end
    if components.rating and components.rating.id then
        table.insert(hash_parts, components.rating.id)
    end
    if components.size_variant and components.size_variant.id then
        table.insert(hash_parts, components.size_variant.id)
    end
    return table.concat(hash_parts, "::")
end

local function select_random_creature_components(config, preferred_ratings_pool, valid_sub_archetypes, forced_size_tag)
    local components = { creature_tags = {}, sub_archetypes = valid_sub_archetypes }
    
    local enabled_ratings = {}
    if not preferred_ratings_pool then
        for _, rating in ipairs(config.interaction_rating) do
            if rating.enabled then table.insert(enabled_ratings, rating) end
        end
        preferred_ratings_pool = enabled_ratings
    end

    components.rating = deep_copy(pick_random(preferred_ratings_pool))
    if not components.rating then return false, nil end
    for _, tag in ipairs(components.rating.tags) do table.insert(components.creature_tags, tag) end

    local compatible_sizes = filter_components_by_tags(config.generic_body_size_variants, components.rating.tags, {}, valid_sub_archetypes)
    
    if forced_size_tag then
        local specific_size_pool = {}
        for _, sz in ipairs(compatible_sizes) do
            if sz.size_tags and table_contains(sz.size_tags, forced_size_tag) then
                table.insert(specific_size_pool, sz)
            end
        end
        compatible_sizes = specific_size_pool
    end

    components.size_variant = deep_copy(pick_random(compatible_sizes))
    if not components.size_variant then 
        return false, nil 
    end
    
    components.size_variant.tags = components.size_variant.size_tags 

    local current_size_tags = components.size_variant.size_tags or {}
    for _, tag in ipairs(current_size_tags) do table.insert(components.creature_tags, tag) end

    for _, conf in ipairs(config.COMPONENT_TABLES) do
        local compatible_addons = filter_components_by_tags(config[conf.table_key], components.rating.tags, current_size_tags, valid_sub_archetypes)
        local chosen_component = deep_copy(pick_random(compatible_addons))
        if not chosen_component then return false, nil end
        
        components[conf.name] = chosen_component
        if chosen_component.tags then
            for _, tag in ipairs(chosen_component.tags) do table.insert(components.creature_tags, tag) end
        end

        if chosen_component.next_tables and #chosen_component.next_tables > 0 then
            local flowchart_success = process_flowchart_tables(config, components, chosen_component.next_tables, chosen_component)
            if not flowchart_success then
                return false, nil
            end
        end
    end
    
    components.lore = pick_random(config.generic_creature_lore_snippets)
    if not components.lore then return false, nil end

    return true, components
end

local function gather_caste_toks(config, components, caste_type)
    local all_toks = {}
    local all_components_for_tokens = { components.rating, components.size_variant }
    
    local function gather_toks_recursively(component)
        if component then
            table.insert(all_components_for_tokens, component)
            if component.flowchart_selections then
                for _, selection in ipairs(component.flowchart_selections) do
                    gather_toks_recursively(selection)
                end
            end
        end
    end
    for _, conf in ipairs(config.COMPONENT_TABLES) do
        gather_toks_recursively(components[conf.name])
    end

    for _, comp in ipairs(all_components_for_tokens) do
        if comp then
            local tok_block
            if caste_type == "non_sophont" then
                tok_block = comp.tok
            elseif caste_type == "mundane" then
                tok_block = comp.mundane_tok
            elseif caste_type == "core" then
                tok_block = comp.core_tok or comp.mundane_tok
            elseif caste_type == "transcendent" then
                tok_block = comp.transcendent_tok
            end

            if tok_block then
                split_to_lines(all_toks, tok_block)
            end
        end
    end
    return all_toks
end

local function gather_creature_level_toks(config, components)
    local all_toks = {}
    local all_components_for_tokens = { components.rating, components.size_variant }
    
    local function gather_toks_recursively(component)
        if component then
            table.insert(all_components_for_tokens, component)
            if component.flowchart_selections then
                for _, selection in ipairs(component.flowchart_selections) do
                    gather_toks_recursively(selection)
                end
            end
        end
    end
    for _, conf in ipairs(config.COMPONENT_TABLES) do
        gather_toks_recursively(components[conf.name])
    end

    for _, comp in ipairs(all_components_for_tokens) do
        if comp and comp.tok then
            local has_caste_override = comp.mundane_tok or comp.core_tok
            if not has_caste_override then
                split_to_lines(all_toks, comp.tok)
            end
        end
    end
    return all_toks
end

local function gather_size_specific_tokens(config, components)
    local extra_toks = {}
    local current_size_tags = components.size_variant.size_tags or {}
    
    local function check_comp(comp)
        if comp and comp.size_specific_tokens then
            for tag, token_block in pairs(comp.size_specific_tokens) do
                if table_contains(current_size_tags, tag) then
                    split_to_lines(extra_toks, token_block)
                end
            end
        end
    end

    local function gather_size_toks_recursively(component)
        if component then
            check_comp(component)
            if component.flowchart_selections then
                for _, selection in ipairs(component.flowchart_selections) do
                    gather_size_toks_recursively(selection)
                end
            end
        end
    end

    gather_size_toks_recursively(components.rating)
    gather_size_toks_recursively(components.size_variant)

    for _, conf in ipairs(config.COMPONENT_TABLES) do
        gather_size_toks_recursively(components[conf.name])
    end
    
    return extra_toks
end

local function construct_body_string(config, components, caste_type)
    local body_parts = {}
    local function gather_parts_recursively(component)
        if component then
            local body_token = get_caste_specific_value(component, 'body_token', caste_type)
            if body_token then table.insert(body_parts, body_token) end
            if component.flowchart_selections then
                for _, selection in ipairs(component.flowchart_selections) do
                    gather_parts_recursively(selection)
                end
            end
        end
    end

    for _, conf in ipairs(config.COMPONENT_TABLES) do
        gather_parts_recursively(components[conf.name])
    end
    return "[BODY:" .. table.concat(body_parts, "") .. "]"
end

local function construct_full_description(config, comps, final_mass, additional_line, include_rating_desc, caste_type)
    local parts = {}
    
    local function add_descriptions_recursively(component)
        if component then
            local desc_part = get_caste_specific_value(component, 'desc_part', caste_type)
            if desc_part then
                table.insert(parts, desc_part)
            end
        end
        if component and component.flowchart_selections then
            for _, selection in ipairs(component.flowchart_selections) do
                add_descriptions_recursively(selection)
            end
        end
    end

    for _, conf in ipairs(config.COMPONENT_TABLES) do
        add_descriptions_recursively(comps[conf.name])
    end

    if include_rating_desc and comps.rating and comps.rating.desc_part then table.insert(parts, comps.rating.desc_part) end
    if additional_line and additional_line ~= "" then table.insert(parts, additional_line) end
    if comps.lore then table.insert(parts, comps.lore) end
	
	if difficulty_calculator then
        local score = difficulty_calculator.calculate_difficulty(config, comps)
        -- Adds "THREAT_RANK:X. "
        table.insert(parts, " THREAT_RANK= " .. tostring(score) .. "/")
    end
	
    table.insert(parts, string.format(comps.size_variant.desc_part, final_mass))
    return string.gsub(table.concat(parts, ""), "%s+$", "")
end

local utility_functions = {
    pick_random = pick_random,
    split_to_lines = split_to_lines,
    table_contains = table_contains,
    filter_components_by_tags = filter_components_by_tags,
    description_constructor = construct_full_description,
    body_string_constructor = construct_body_string,
    gather_caste_toks = gather_caste_toks
}

-- #region Main Generation Logic
local function assemble_creature_raw(config, creature_id_suffix, components, numeric_code)
    local sz = components.size_variant
    
    -- [[ MODIFIED: RATING-SPECIFIC SIZE LOGIC ]] --
    local distribution_to_use = sz.size_distribution_weights
    
    -- Check if the component size variant has specific weights for the current rating
    if sz.rating_specific_weights and components.rating and components.rating.tags and components.rating.tags[1] then
        local rating_key = components.rating.tags[1]
        if sz.rating_specific_weights[rating_key] then
            distribution_to_use = sz.rating_specific_weights[rating_key]
        end
    end
    
    local rand_func = _G.trandom or function(n) return math.random(0, n - 1) end
    local size_multiplier = sz.favored_size_multiplier_enabled and pick_weighted_random_multiplier(distribution_to_use) or (rand_func(9) + 1)
    -- [[ END MODIFIED ]] --

    local default_adult_size = (sz.base_adult_size_for_random or 0) * size_multiplier
    local temp_child_size = sz.child_body_size or sz.min_raw_size_factor or 0
    local final_adult_size = sz.new_adult_size or default_adult_size
    components.final_adult_size = math.floor(final_adult_size)
    if sz.new_adult_size and default_adult_size > 0 and temp_child_size > 0 then
        components.final_child_size = math.floor(temp_child_size * (final_adult_size / default_adult_size))
    else
        components.final_child_size = temp_child_size
    end
    
    -- 1. BUILD THE IDENTIFIER STRING LIST (e.g. MDM, SPNT, 1111)
    local name_mods = { sz.name_part }
    for tag, suffix in pairs(config.TRAIT_NAME_MODIFIERS) do
        if table_contains(components.creature_tags, tag) then
            table.insert(name_mods, suffix)
            break
        end
    end

    if config.experiment_context then
        table.insert(name_mods, "EX")
    end
    
    table.insert(name_mods, numeric_code)
    components.numeric_code = numeric_code
    
    -- 2. CONSTRUCT DISPLAY NAME SUFFIX (e.g. "-MDM-SPNT-1111")
    local name_suffix = "-" .. table.concat(name_mods, "-")
    
    local base_singular, base_plural = name_resolver.get_base_names(config, components)
    local singular = base_singular .. name_suffix
    local plural = base_plural .. name_suffix
    
    -- 3. DETECT SUB-ARCHETYPE (e.g. "DEVIL")
    local detected_sub_archetype = "UNKNOWN"
    for _, conf in ipairs(config.COMPONENT_TABLES) do
        local comp = components[conf.name]
        if comp and comp.sub_archetype and #comp.sub_archetype > 0 then
            detected_sub_archetype = comp.sub_archetype[1] 
            break
        end
    end
    if detected_sub_archetype == "UNKNOWN" and components.sub_archetypes and #components.sub_archetypes > 0 then
        detected_sub_archetype = components.sub_archetypes[1]
    end

    -- 4. CONSTRUCT RAW TOKEN
    local creature_token = ""
    if config.experiment_context and config.experiment_context.token then
        creature_token = config.experiment_context.token
    else
        local id_clean_part = "ID" 
        local token_middle = table.concat(name_mods, "_")
        creature_token = config.ARCHETYPE_CLASS:upper() .. "_" .. id_clean_part .. "_" .. token_middle:upper() .. "_" .. detected_sub_archetype:upper()
    end
    
    local lines = {}
    table.insert(lines, "[CREATURE:" .. creature_token .. "]")
    table.insert(lines, "[NAME:" .. singular .. ":" .. plural .. ":" .. singular .. "]")
    table.insert(lines, "[CASTE_NAME:" .. singular .. ":" .. plural .. ":" .. singular .. "]")
    split_to_lines(lines, config.BASE_RAWS)

    -- [[ MOVED: Sphere Rules Injection ]]
    -- This places sphere tokens ABOVE the caste descriptions generated later.
    if avatar_sphere_rules then
        local sphere_tokens = avatar_sphere_rules.get_sphere_tokens(config, components)
        if sphere_tokens and #sphere_tokens > 0 then
            split_to_lines(lines, sphere_tokens)
        end
    end
    -- [[ END MOVED ]]

    if config.experiment_context and config.experiment_context.desc_func then
        -- skipped in exp context
    end

    local all_caste_raw_lines = {}
    local shared_descriptor_tokens = config.generate_caste_raws(config, components, all_caste_raw_lines, components.final_adult_size, utility_functions)

    local caste_definitions = {}
    local total_castes = 0
    local is_simple_pair = false 

    for _, line in ipairs(all_caste_raw_lines) do
        local caste_token = line:match("^%s*%[CASTE:([^%]]+)%]")
        if caste_token then
            total_castes = total_castes + 1
            table.insert(caste_definitions, {
                original_line = line,
                token = caste_token,
                is_male = line:match("%[MALE%]") ~= nil,
                is_female = line:match("%[FEMALE%]") ~= nil
            })
        end
    end

    if total_castes == 2 then
        local c1 = caste_definitions[1]
        local c2 = caste_definitions[2]
        if (c1.is_male and c2.is_female) or (c1.is_female and c2.is_male) then
            if (c1.token == "MALE" and c2.token == "FEMALE") or (c1.token == "FEMALE" and c2.token == "MALE") then
                is_simple_pair = true
            end
            local c1_base = c1.token:gsub("_MALE$", ""):gsub("_FEMALE$", "")
            local c2_base = c2.token:gsub("_MALE$", ""):gsub("_FEMALE$", "")
            if c1_base == c2_base then
                 is_simple_pair = true
            end
        end
    end

    local needs_variant_naming = (total_castes > 2) or (total_castes == 2 and not is_simple_pair)
    local new_caste_names = {} 
    
    if needs_variant_naming then
        local variant_counter = 1
        local processed_lines = {} 

        for i, caste_def in ipairs(caste_definitions) do
            if not processed_lines[caste_def.original_line] then
                local variant_name = singular .. "-V" .. variant_counter
                local variant_plural = plural .. "-V" .. variant_counter
                local name_line = "[CASTE_NAME:" .. variant_name .. ":" .. variant_plural .. ":" .. variant_name .. "]"
                
                new_caste_names[caste_def.original_line] = name_line
                processed_lines[caste_def.original_line] = true
                
                local partner_token_str = nil
                if caste_def.is_male then
                    local base_name = caste_def.token:gsub("_MALE$", "")
                    if base_name ~= caste_def.token then 
                         partner_token_str = base_name .. "_FEMALE"
                    end
                elseif caste_def.is_female then
                    local base_name = caste_def.token:gsub("_FEMALE$", "")
                     if base_name ~= caste_def.token then
                        partner_token_str = base_name .. "_MALE"
                    end
                end
                
                if partner_token_str then
                    for j, partner_def in ipairs(caste_definitions) do
                        if i ~= j and partner_def.token == partner_token_str and not processed_lines[partner_def.original_line] then
                            new_caste_names[partner_def.original_line] = name_line
                            processed_lines[partner_def.original_line] = true
                            break 
                        end
                    end
                end
                
                variant_counter = variant_counter + 1
            end
        end
    end

    local reordered_caste_lines = {}
    local current_caste_block = nil

    local function flush_caste_block()
        if not current_caste_block then return end
        
        table.insert(reordered_caste_lines, current_caste_block.caste_line)
        
        local has_existing_caste_name = false
        for _, misc_line in ipairs(current_caste_block.misc) do
            if misc_line:match("^%s*%[CASTE_NAME:") then
                has_existing_caste_name = true
                break
            end
        end
        
        if needs_variant_naming and not has_existing_caste_name and new_caste_names[current_caste_block.caste_line] then
            table.insert(reordered_caste_lines, new_caste_names[current_caste_block.caste_line])
        end

        if current_caste_block.description then table.insert(reordered_caste_lines, current_caste_block.description) end

        local main_body_index = -1
        local max_colons = -1
        if #current_caste_block.body_lines > 0 then
            for i, body_line in ipairs(current_caste_block.body_lines) do
                local _, num_colons = body_line:gsub(":", "")
                if num_colons > max_colons then
                    max_colons = num_colons
                    main_body_index = i
                end
            end
            if main_body_index > 0 then
                table.insert(reordered_caste_lines, current_caste_block.body_lines[main_body_index])
                table.remove(current_caste_block.body_lines, main_body_index)
            end
        end

        for _, body_line in ipairs(current_caste_block.body_lines) do
            table.insert(reordered_caste_lines, body_line)
        end
        
        for _, misc_line in ipairs(current_caste_block.misc) do
            table.insert(reordered_caste_lines, misc_line)
        end
    end

    for _, line in ipairs(all_caste_raw_lines) do
        if line:match("^%s*%[CASTE:") then
            flush_caste_block()
            current_caste_block = { caste_line = line, misc = {}, body_lines = {} }
        elseif current_caste_block then
            if line:match("^%s*%[DESCRIPTION:") then
                current_caste_block.description = line
            elseif line:match("^%s*%[BODY:") then
                table.insert(current_caste_block.body_lines, line)
            else
                table.insert(current_caste_block.misc, line)
            end
        else
            table.insert(reordered_caste_lines, line)
        end
    end
    flush_caste_block()

    for _, line in ipairs(reordered_caste_lines) do
        table.insert(lines, line)
    end
    
    split_to_lines(lines, config.COMMON_BODY_DETAIL_RAWS)

    local creature_level_toks = gather_creature_level_toks(config, components)
    split_to_lines(lines, creature_level_toks)

    local size_specific_toks = gather_size_specific_tokens(config, components)
    split_to_lines(lines, size_specific_toks)

    if buildingdestroyer_calculator then
        local bldg_token = buildingdestroyer_calculator.get_buildingdestroyer_token(config, components)
        if bldg_token ~= "" then
            table.insert(lines, bldg_token)
        end
    end

    if difficulty_calculator then
        local difficulty_token = difficulty_calculator.get_difficulty_token(config, components)
        if difficulty_token ~= "" then
            table.insert(lines, difficulty_token)
        end
    end
	
    if population_calculator then
        local pop_token = population_calculator.get_population_token(config, components)
        if pop_token and pop_token ~= "" then
            table.insert(lines, pop_token)
        end
    end
	
	if cluster_calculator then
        local cluster_token = cluster_calculator.get_cluster_token(config, components)
        if cluster_token ~= "" then
            table.insert(lines, cluster_token)
        end
    end
	
	if frequency_calculator then
        local freq_token = frequency_calculator.get_frequency_token(config, components)
        if freq_token ~= "" then
            table.insert(lines, freq_token)
        end
    end
	
    if petvalue_calculator then
        local petvalue_token = petvalue_calculator.get_petvalue_token(config, components)
        if petvalue_token ~= "" then
            table.insert(lines, petvalue_token)
        end
    end
	
    if maxage_calculator then
        local maxage_token = maxage_calculator.get_maxage_token(config, components)
        if maxage_token ~= "" then
            table.insert(lines, maxage_token)
        end
    end
    
	if megabeast_calculator then
		local megabeast_token = megabeast_calculator.get_megabeast_token(config, components)
		if megabeast_token ~= "" then
			table.insert(lines, megabeast_token)
		end
	end
	
	if existential_variant_rules then
        local variant_token = existential_variant_rules.get_existential_token(config, components)
        if variant_token ~= "" then
            table.insert(lines, variant_token)
        end
    end
	
    if rating_token_rules then
        local rating_tokens = rating_token_rules.get_rating_tokens(config, components)
        if rating_tokens and #rating_tokens > 0 then
            split_to_lines(lines, rating_tokens)
        end
    end
	
	if natural_skills_calculator then
        local skill_tokens = natural_skills_calculator.get_natural_skill_tokens(config, components)
        if skill_tokens and skill_tokens ~= "" then
            split_to_lines(lines, skill_tokens)
        end
    end
    
    if config.ENABLE_SIZE_AND_CHILD_GENERATION then
        local child_years = sz.body_size_index_and_child_count
        local adult_size = components.final_adult_size
        local child_size = components.final_child_size
        if child_years and child_years > 0 then
            if child_size > 0 and child_size < adult_size then
                table.insert(lines, "[BODY_SIZE:0:0:" .. tostring(math.floor(child_size)) .. "]")
                table.insert(lines, "[BODY_SIZE:" .. tostring(child_years) .. ":0:" .. tostring(adult_size) .. "]")
            else
                table.insert(lines, "[BODY_SIZE:0:0:" .. tostring(adult_size) .. "]")
            end
            table.insert(lines, "[CHILD:" .. tostring(child_years) .. "]")
        else
            table.insert(lines, "[BODY_SIZE:0:0:" .. tostring(adult_size) .. "]")
        end
    end
    
    split_to_lines(lines, config.COMMON_APPEARANCE_RAWS)
    
    if shared_descriptor_tokens then
        split_to_lines(lines, shared_descriptor_tokens)
    end
    
    -- [[ MODIFIED: Return ID for Weaponizer ]]
    return { creature=lines, id=creature_token, weight=10, is_transcendent=false, components=components }
end

local function generate_all_creatures(config)
    local log_func = _G.log or function(...) print(table.concat({...}, "\t")) end
    local log_prefix = config.ARCHETYPE_CLASS:upper() .. "_GENERATOR_LOG"
    log_func(log_prefix .. ": Initializing generation.")
    assign_all_component_ids(config)

    log_func(log_prefix .. ": Analyzing config for valid creature generation paths...")
    local valid_ratings_pool = {}
    local forced_generation_queue = {}
    
    -- 1. Populate Valid Ratings Pool & Standard Demographic Requirements
    for _, rating_option in ipairs(config.interaction_rating) do
        if rating_option.enabled then
            local is_possible = true
            
            -- [[ RESTORED: Filter by forced_rating if provided (e.g. by Experiment Engine) ]]
            if config.forced_rating then
                 if not table_contains(rating_option.tags, config.forced_rating) then
                     is_possible = false
                 end
            end
            
            if is_possible then
                local compatible_sizes = filter_components_by_tags(config.generic_body_size_variants, rating_option.tags, {})
                if #compatible_sizes == 0 then 
                    is_possible = false 
                end

                if is_possible then
                    for _, conf in ipairs(config.COMPONENT_TABLES) do
                        local compatible_addons = filter_components_by_tags(config[conf.table_key], rating_option.tags, {})
                        if #compatible_addons == 0 then
                            is_possible = false
                            log_func(log_prefix .. ": [LOG] ...Invalid: No compatible components in table " .. conf.name)
                            break
                        end
                    end
                end

                if is_possible then
                    table.insert(valid_ratings_pool, rating_option)
                    
                    -- [[ ADDED: Verbose validation logging ]] --
                    log_func(log_prefix .. ": [LOG] ...Rating [" .. (rating_option.tags[1] or "UNKNOWN") .. "] validated and added to pool.")
                    
                    -- Enqueue demographic requirements ONLY if not in experiment context
                    if not config.experiment_context then
                        if rating_option.minimum_number and rating_option.minimum_number > 0 then
                            for i=1, rating_option.minimum_number do
                                table.insert(forced_generation_queue, { rating = rating_option, size_tag = nil, sub_archetype = nil })
                            end
                            log_func(log_prefix .. ": [LOG] ...Enqueued " .. rating_option.minimum_number .. " standard demographic generations for rating: " .. (rating_option.tags[1] or "Unknown"))
                        end
                    end
                end
            end
        end
    end

    if #valid_ratings_pool == 0 then
        log_func(log_prefix .. ": FATAL ERROR - No valid creature types can be generated with the current configuration (filters applied). Aborting.")
        return {}
    end

    -- 2. Determine Total Count
    local num_to_generate
    if config.experiment_context then
        num_to_generate = 1
    else
        local rand_func = _G.trandom or function(n) return math.random(0, n - 1) end
        num_to_generate = rand_func( (config.MAX_CREATURES or 30) - (config.MIN_CREATURES or 10) + 1 ) + (config.MIN_CREATURES or 10)
    end

    -- 3. Inject Special Forced Generations from Queue
    -- [[ FIXED: Only load global forced queue if NOT in experiment context ]]
    if config.FORCED_GENERATION_QUEUE and not config.experiment_context then
        for _, forced_req in ipairs(config.FORCED_GENERATION_QUEUE) do
            local target_rating = nil
            -- Find the rating object by tag (ignoring forced_rating filter as this is an override)
            for _, r in ipairs(config.interaction_rating) do
                 if r.enabled and r.tags and table_contains(r.tags, forced_req.rating) then
                    target_rating = r
                    break
                end
            end
            
            if target_rating then
                local count = forced_req.count or 1
                for i=1, count do
                    -- Insert at FRONT to prioritize
                    -- [[ FIXED: Use standard append to preserve FIFO order defined in config ]]
                    table.insert(forced_generation_queue, { rating = target_rating, size_tag = forced_req.size, sub_archetype = forced_req.sub_archetype })
                end
                num_to_generate = num_to_generate + count
                log_func(log_prefix .. ": [LOG] Added " .. count .. " FORCED " .. (forced_req.size or "ANY") .. " " .. forced_req.rating .. (forced_req.sub_archetype and (" ("..forced_req.sub_archetype..")") or "") .. " to the queue.")
            else
                log_func(log_prefix .. ": [WARNING] FORCED_GENERATION_RATING '" .. forced_req.rating .. "' not found in config.")
            end
        end
    end

    -- 4. Ensure Queue doesn't overflow total
    if #forced_generation_queue > num_to_generate then
        if not config.experiment_context then
             log_func(log_prefix .. ": [LOG] Increasing generation count from " .. num_to_generate .. " to " .. #forced_generation_queue .. " to satisfy minimum requirements.")
             num_to_generate = #forced_generation_queue
        end
    end
    
    local all_raw_data = {}
    local successfully_generated_count = 0
    local fingerprints = {}
    local max_attempts = num_to_generate * 200

    log_func(log_prefix .. ": Starting generation of " .. num_to_generate .. " creatures.")

    -- [[ NEW: STRIKE SYSTEM INITIALIZATION ]] --
    -- Add a table to track failures for specific queue items
    local forced_entry_failures = 0

    while successfully_generated_count < num_to_generate and max_attempts > 0 do
        max_attempts = max_attempts - 1

        local current_pool = nil
        local current_sub_archetypes = config.forced_sub_archetypes
        local current_forced_size = config.forced_size 
        
        local forced_entry = nil
        if #forced_generation_queue > 0 then
            forced_entry = forced_generation_queue[1] -- Peek at index 1
            current_pool = { forced_entry.rating }
            current_forced_size = forced_entry.size_tag 
            
            if forced_entry.sub_archetype then
                current_sub_archetypes = { forced_entry.sub_archetype }
            end
        else
            current_pool = valid_ratings_pool
        end

        local selection_successful, components = select_random_creature_components(config, current_pool, current_sub_archetypes, current_forced_size)

        if selection_successful and components then
            local fingerprint = generate_creature_fingerprint(config, components)
            
            if config.experiment_context or not fingerprints[fingerprint] then
                successfully_generated_count = successfully_generated_count + 1
                local id_suffix = string.format("%03d", successfully_generated_count)
                local numeric_code = generate_numeric_code(4)
                
                local creature_data = assemble_creature_raw(config, id_suffix, components, numeric_code)
                table.insert(all_raw_data, creature_data)
                fingerprints[fingerprint] = true
                
                if forced_entry then
                    table.remove(forced_generation_queue, 1)
                    forced_entry_failures = 0 -- Reset failure counter on success
                    max_attempts = max_attempts + 200 
                end
                
                local rating_str = (components.rating and components.rating.tags and components.rating.tags[1]) or "UNKNOWN_RATING"
                local size_str = (components.size_variant and components.size_variant.size_tags and components.size_variant.size_tags[1]) or "UNKNOWN_SIZE"
                
                local arch_str = "UNKNOWN_ARCH"
                for _, conf in ipairs(config.COMPONENT_TABLES) do
                    local comp = components[conf.name]
                    if comp and comp.sub_archetype and #comp.sub_archetype > 0 then
                        arch_str = comp.sub_archetype[1]
                        break
                    end
                end
                
                log_func(log_prefix .. ": [SUCCESS] Generated " .. size_str .. " " .. rating_str .. " (" .. arch_str .. ") - Code: " .. numeric_code)

                if config.experiment_context then break end
            end
        else
            -- [[ NEW: STRIKE SYSTEM FAILURE HANDLING ]] --
            if forced_entry then
                forced_entry_failures = forced_entry_failures + 1
                
                -- Only log the warning every 10 failures to reduce spam
                if forced_entry_failures % 10 == 0 then
                     local forced_sub = forced_entry.sub_archetype and (" ("..forced_entry.sub_archetype..")") or ""
                     log_func("ENGINE_WARNING: Struggling to generate forced entry: " .. (forced_entry.rating.tags[1] or "Unk") .. " " .. (forced_entry.size_tag or "Unk") .. forced_sub .. ". Failures: " .. forced_entry_failures)
                end

                -- ABORT CONDITION: If we fail 50 times on the same forced entry, delete it and move on.
                if forced_entry_failures > 50 then
                    local forced_sub = forced_entry.sub_archetype and (" ("..forced_entry.sub_archetype..")") or ""
                    log_func("ENGINE_ERROR: ABORTING forced entry due to excessive failures: " .. (forced_entry.rating.tags[1] or "Unk") .. " " .. (forced_entry.size_tag or "Unk") .. forced_sub)
                    table.remove(forced_generation_queue, 1)
                    forced_entry_failures = 0
                end
            end
        end
    end

    log_func(log_prefix .. ": Generation complete. Generated " .. #all_raw_data .. " total RAW sets.")
    return all_raw_data
end

-- #region Module Definition
local engine_module = {}

engine_module.run_generator = function(config)
    local generated_data = engine_module.generate_data_only(config)
    if generated_data and #generated_data > 0 then
        local all_lines = {}
        for _, obj in ipairs(generated_data) do
            for _, line in ipairs(obj.creature) do
                table.insert(all_lines, line)
            end
        end
        if _G.raws and _G.raws.register_creatures then
            _G.raws.register_creatures(all_lines)
        end
    end
    return generated_data or {}
end

engine_module.generate_data_only = function(config)
    local success, generated_data = pcall(generate_all_creatures, config)
    if not success then
        local log_func = _G.log or print
        log_func("ENGINE_LOG: FATAL ERROR during generate_all_creatures: " .. tostring(generated_data))
        return {}
    end
    return generated_data or {}
end

-- #endregion

-- #region Standalone Execution Block
if arg and arg[1] then
    math.randomseed(os.time())
    
    print("ENGINE: Running in STANDALONE mode.")
    local config_file_name = arg[1]:gsub("%.lua$", "")
    
    print("ENGINE: Loading config file: " .. config_file_name .. ".lua")
    local success, config = pcall(require, config_file_name)
    if not success or not config then
        print("ENGINE: FATAL ERROR - Could not load config file '" .. config_file_name .. ".lua'. " .. tostring(config))
        return
    end

    if not config.SAVE_TO_FILE_TOGGLE then
        print("ENGINE: File output is disabled in the config file. Exiting.")
        return
    end

    local generated_data = generate_all_creatures(config)

    -- [[ WEAPONIZER STANDALONE INTEGRATION ]] --
    print("ENGINE: Checking for Weaponizer...")
    local status_wep, weaponizer = pcall(require, "weaponizer_engine")
    local status_cfg, weapon_config = pcall(require, "config_weapons")

    if status_wep and status_cfg and weaponizer and weapon_config then
        print("ENGINE: Weaponizer found. Scanning " .. #generated_data .. " creatures for eligibility...")
        
        -- 1. Build the data list expected by the weaponizer (Adapter Step)
        local weaponizer_input = {}
        for _, obj in ipairs(generated_data) do
            if obj.id and obj.components then
                local adapter_obj = {
                    id = obj.id,
                    raw_lines = obj.creature, -- [[ IMPORTANT: PASS RAW LINES FOR CASTE SCANNING ]]
                    rating_tags = obj.components.rating.tags,
                    archetypes = { config.ARCHETYPE_CLASS },
                    size_tag = (obj.components.size_variant.size_tags and obj.components.size_variant.size_tags[1]) or "MEDIUM",
                    pop_ratio = 50,
                    sub_archetypes = obj.components.sub_archetypes
                }
                -- Use the ID as the key to ensure uniqueness if needed, or just insert
                weaponizer_input[obj.id] = adapter_obj
            end
        end

        -- 2. Generate the weapons
        local weapon_raws, count = weaponizer.generate_for_list(weaponizer_input, weapon_config)

        -- 3. Append results to our data list so they get written to the file
        if count > 0 then
            print("ENGINE: Weaponizer generated " .. count .. " variants.")
            -- We wrap the result in a structure compatible with the file writer loop below
            table.insert(generated_data, { creature = weapon_raws })
        else
            print("ENGINE: Weaponizer found no eligible creatures.")
        end
    else
        print("ENGINE: Weaponizer or config_weapons.lua not found in path. Skipping.")
    end
    -- [[ END WEAPONIZER INTEGRATION ]] --

    if generated_data and #generated_data > 0 then
        local output_filename = config.OUTPUT_FILENAME or "generated_creatures.txt"
        print("ENGINE: Attempting to write " .. #generated_data .. " creature sets to '" .. output_filename .. "'...")

        local file, err = io.open(output_filename, "w")
        if not file then
            print("ENGINE: FATAL ERROR - Could not open file for writing: " .. output_filename .. " (\"" .. tostring(err) .. "\")")
            return
        end
        
        local file_header = config.ARCHETYPE_CLASS:lower() .. "_creatures"
        file:write(file_header, "\n\n")
        file:write("[OBJECT:CREATURE]", "\n\n")

        for _, creature_obj in ipairs(generated_data) do
            if creature_obj.creature then
                for _, line in ipairs(creature_obj.creature) do
                    file:write(line, "\n")
                end
                file:write("\n")
            end
        end
        
        file:close()
        print("ENGINE: Successfully wrote all data to '" .. output_filename .. "'.")
    else
        print("ENGINE: No creature data was generated. No file written.")
    end
end
-- #endregion

return engine_module