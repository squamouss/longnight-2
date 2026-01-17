 local M = {}

    local function script_log(...)
        if _G.log then _G.log(...) end
    end

    -- OPTIMIZED: Uses direct indexing instead of table.insert for better performance
    local function split_to_lines(current_lines_table, raw_block)
        if not raw_block then return current_lines_table end

        local idx = #current_lines_table
        local content_type = type(raw_block)
        if content_type == 'string' then
            for line in raw_block:gmatch("[^\r\n]+") do
                if line:match("%S") then
                    idx = idx + 1
                    current_lines_table[idx] = line
                end
            end
        elseif content_type == 'table' then
            for i = 1, #raw_block do
                local line = raw_block[i]
                if type(line) == 'string' and line:match("%S") then
                    idx = idx + 1
                    current_lines_table[idx] = line
                end
            end
        end
        return current_lines_table
    end

    -- OPTIMIZED: Uses direct indexing instead of table.insert for better performance
    local function table_merge(t1, t2)
        local t1_len = #t1
        local t2_len = #t2
        for i = 1, t2_len do
            t1[t1_len + i] = t2[i]
        end
        return t1
    end

    local function add_generated_info(lines)
        if _G.add_generated_info then _G.add_generated_info(lines)
        else table.insert(lines, "[GENERATED]") end
    end

    -- =============================================================================
    --  1. FINAL ATTACK GENERATION (The Effect Syndrome)
    -- =============================================================================
    local function generate_final_attack(config, ability_key, sev_lvl, is_self_optimized, target_type_key)
        local ability_list = config.ABILITY_TYPES or config.ABILITIES
        local ability = ability_list[ability_key]

        -- For projectile abilities, create target-type-specific FINALs
        local id_suffix
        if ability.projectile and target_type_key then
            id_suffix = "_FINAL_" .. target_type_key
        else
            id_suffix = is_self_optimized and "_FINAL_SELF" or "_FINAL"
        end
        local id = string.format("%s_SEV_%d%s", ability.token_prefix, sev_lvl, id_suffix)
        local lines = {}

        table.insert(lines, "[INTERACTION:" .. id .. "]")
        add_generated_info(lines)

        -- Detect special PROPEL effect
        if ability.propel_force_base then
            local final_force = ability.propel_force_base + (sev_lvl * 100000)

            -- Build target block with location and creature targets
            local propel_target = [[
        [I_TARGET:A:LOCATION]
            [IT_LOCATION:CONTEXT_LOCATION]
        [I_TARGET:B:CREATURE]
            [IT_LOCATION:CONTEXT_CREATURE]
            [IT_MANUAL_INPUT:target]
    ]]
            table_merge(lines, split_to_lines({}, propel_target))

            -- Add defensive checks (binary blocking)
            for i = sev_lvl, config.MAX_POWER_LEVEL do
                table.insert(lines, "        [IT_CANNOT_HAVE_SYNDROME_CLASS:" .. config.FIREWALL_CLASS_PREFIX .. "_" .. i .. "]")
            end
            for i = sev_lvl, config.MAX_POWER_LEVEL do
                table.insert(lines, "        [IT_IMMUNE_CLASS:INNATE_" .. config.INNATE_CLASS .. "_" .. i .. "]")
            end

            -- Add the PROPEL effect
            local propel_effect = string.format([[
        [I_EFFECT:PROPEL_UNIT]
            [IE_PROPEL_FORCE:%d]
            [IE_TARGET:A]
            [IE_TARGET:B]
            [IE_IMMEDIATE]
    ]], final_force)
            table_merge(lines, split_to_lines({}, propel_effect))

            return id, lines
        end

        -- Detect special PROJECTILE effect (weapon abilities)
        if ability.projectile and target_type_key then
            local proj = ability.projectile
            local target_config = config.TARGET_TYPES[target_type_key]

            -- Self-target to grant firing capability
            local base_target = [[
        [I_TARGET:C:CREATURE]
            [IT_LOCATION:CONTEXT_CREATURE]
        [I_EFFECT:ADD_SYNDROME]
            [IE_TARGET:C]
            [IE_IMMEDIATE]
            [SYNDROME]
    ]]
            table_merge(lines, split_to_lines({}, base_target))

            -- Firing window timing
            local start_time = ability.telegraph_ticks or 1
            local end_time = start_time + (ability.window_duration or 6)
            local dwf_stretch = ability.dwf_stretch or 10
            local burst_cooldown = ability.burst_cooldown or 30

            -- Get max targets from target type config
            local max_targets = target_config.max_targets or 1

            -- Add the firing capability
            table.insert(lines, string.format(
                "            [CE_CAN_DO_INTERACTION:PROB:100:START:%d:END:%d:DWF_STRETCH:%d]",
                start_time, end_time, dwf_stretch
            ))
            table.insert(lines, "                [CDI:ADV_NAME:fire " .. ability.token_prefix .. "_SEV_" .. sev_lvl .. "_" .. target_type_key .. "]")
            table.insert(lines, "                [CDI:USAGE_HINT:ATTACK]")
            table.insert(lines, "                [CDI:INTERACTION:MATERIAL_EMISSION]")
            table.insert(lines, string.format("                [CDI:MATERIAL:%s:%s]", proj.material, proj.type))
            -- Derive CDI targeting from target type: MELEE/FIELD use TOUCHABLE, others use LINE_OF_SIGHT
            local cdi_target = (target_type_key == "MELEE" or target_type_key == "FIELD") and "TOUCHABLE" or "LINE_OF_SIGHT"
            table.insert(lines, string.format("                [CDI:TARGET:C:%s]", cdi_target))
            table.insert(lines, string.format("                [CDI:TARGET_RANGE:C:%d]", proj.range))
            table.insert(lines, string.format("                [CDI:MAX_TARGET_NUMBER:C:%d]", max_targets))
            table.insert(lines, string.format("                [CDI:WAIT_PERIOD:%d]", burst_cooldown))

            -- Support nested fire_verbs[sev][target_type] or flat fire_verb
            local fire_verb = "fire:fires:NA"
            if ability.fire_verbs and ability.fire_verbs[sev_lvl] then
                local sev_entry = ability.fire_verbs[sev_lvl]
                if type(sev_entry) == "table" and sev_entry[target_type_key] then
                    fire_verb = sev_entry[target_type_key]
                elseif type(sev_entry) == "string" then
                    fire_verb = sev_entry
                end
            elseif ability.fire_verb then
                fire_verb = ability.fire_verb
            end
            table.insert(lines, "                [CDI:VERB:" .. fire_verb .. "]")

            return id, lines
        end

        -- =====================================================================
        -- HEALING EFFECTS (REGENERATE/REVIVE with innate class restrictions)
        -- =====================================================================
        if ability.healing_effects then
            local heal = ability.healing_effects
            local target_type = heal.target_type or "CREATURE"
            local location = heal.location or "CONTEXT_CREATURE"

            -- I_TARGET header
            table.insert(lines, string.format("    [I_TARGET:C:%s]", target_type))
            table.insert(lines, string.format("        [IT_LOCATION:%s]", location))

            -- IT_REQUIRES from config
            if heal.requires then
                for _, req in ipairs(heal.requires) do
                    table.insert(lines, string.format("        [IT_REQUIRES:%s]", req))
                end
            end

            -- IT_FORBIDDEN from config (base forbidden, e.g., NOT_LIVING)
            if heal.forbidden then
                for _, forb in ipairs(heal.forbidden) do
                    table.insert(lines, string.format("        [IT_FORBIDDEN:%s]", forb))
                end
            end

            -- Innate class restrictions for NON-SELF targets
            -- Sev 1 can only heal targets with innate 1 or lower (immune to 2-6)
            -- Sev 6 can heal anyone (no immunity restrictions)
            if heal.innate_class and not is_self_optimized then
                for i = sev_lvl + 1, config.MAX_POWER_LEVEL do
                    table.insert(lines, string.format("        [IT_IMMUNE_CLASS:%s_%d]", heal.innate_class, i))
                end
            end

            -- Manual input for corpse selection
            if heal.manual_input then
                table.insert(lines, string.format("        [IT_MANUAL_INPUT:%s]", heal.manual_input))
            elseif not is_self_optimized then
                table.insert(lines, "        [IT_MANUAL_INPUT:target]")
            end

            -- I_EFFECT header
            table.insert(lines, string.format("    [I_EFFECT:%s]", heal.effect_type or "ADD_SYNDROME"))
            table.insert(lines, "        [IE_TARGET:C]")
            table.insert(lines, "        [IE_IMMEDIATE]")

            -- Syndrome effects from config
            if heal.syndrome then
                table.insert(lines, "        [SYNDROME]")
                for line in heal.syndrome:gmatch("[^\r\n]+") do
                    local trimmed = line:match("^%s*(.-)%s*$")
                    if trimmed and trimmed ~= "" then
                        table.insert(lines, "        " .. trimmed)
                    end
                end
            end

            return id, lines
        end

        -- =====================================================================
        -- DETECTION EFFECTS (CE_SENSE_CREATURE_CLASS from config entries)
        -- =====================================================================
        if ability.detection_entries then
            local duration = (ability.duration_values and ability.duration_values[sev_lvl]) or ability.duration or 1000

            local base_target = [[
        [I_TARGET:C:CREATURE]
            [IT_LOCATION:CONTEXT_CREATURE]
        [I_EFFECT:ADD_SYNDROME]
            [IE_TARGET:C]
            [IE_IMMEDIATE]
            [SYNDROME]
    ]]
            table_merge(lines, split_to_lines({}, base_target))

            -- Output each detection entry from config
            for _, entry in ipairs(ability.detection_entries) do
                table.insert(lines, string.format(
                    "            [CE_SENSE_CREATURE_CLASS:START:0:END:%d:CLASS:%s:%s:%s]",
                    duration, entry.class, tostring(entry.tile), entry.color
                ))
            end

            return id, lines
        end

        local effect_duration = ability.duration or 1000
        local is_perm = (effect_duration == -1)
        local end_tag = is_perm and "" or (":END:" .. effect_duration)

        -- Soak is only applicable to Offensive abilities that explicitly have the soak flag.
        local should_soak = ability.role == "OFFENSE" and ability.soak

        if ability.role == "DEFENSE" or (ability.role == "OFFENSE" and not should_soak) then

            local manual_input_line = is_self_optimized and "" or "[IT_MANUAL_INPUT:target]"

            local base_target = string.format([[
        [I_TARGET:C:CREATURE]
            [IT_LOCATION:CONTEXT_CREATURE]
            %s
    ]], manual_input_line)
            table_merge(lines, split_to_lines({}, base_target))

            if ability.role == "OFFENSE" then
                for i = sev_lvl, config.MAX_POWER_LEVEL do
                     table.insert(lines, "        [IT_CANNOT_HAVE_SYNDROME_CLASS:" .. config.FIREWALL_CLASS_PREFIX .. "_" .. i .. "]")
                end
                for i = sev_lvl, config.MAX_POWER_LEVEL do
                     table.insert(lines, "        [IT_IMMUNE_CLASS:INNATE_" .. config.INNATE_CLASS .. "_" .. i .. "]")
                end
                table.insert(lines, "        [IT_CANNOT_TARGET_IF_ALREADY_AFFECTED]")

            elseif ability.role == "DEFENSE" and not ability.is_curse_style then
                for i = sev_lvl, config.MAX_POWER_LEVEL do
                     table.insert(lines, "        [IT_IMMUNE_CLASS:INNATE_" .. config.INNATE_CLASS .. "_" .. i .. "]")
                end
            end

            local effect_base = [[
        [I_EFFECT:ADD_SYNDROME]
            [IE_TARGET:C]
            [IE_IMMEDIATE]
            [SYNDROME]
    ]]
            table_merge(lines, split_to_lines({}, effect_base))

            if ability.role == "DEFENSE" and not ability.is_curse_style then
                table.insert(lines, "            [SYN_CLASS:" .. config.FIREWALL_CLASS_PREFIX .. "_" .. sev_lvl .. "]")
            end

            if ability.injects_silence then
                table.insert(lines, "            [SYN_CLASS:" .. config.SILENCE_CLASS .. "]")
            end

            -- Disease Resistance Timer Vector (100 is neutral across the board)
            table.insert(lines, string.format("            [CE_PHYS_ATT_CHANGE:DISEASE_RESISTANCE:100:100:START:0%s]", end_tag))

            if ability.skill_roll_adj then
                local total_adj = ability.skill_roll_adj * sev_lvl
                local forced_result = total_adj > 0 and 100 or 0
                local force_chance = math.abs(total_adj)
                table.insert(lines, string.format("            [CE_SKILL_ROLL_ADJUST:PERC:%d:PERC_ON:%d:START:0%s]", forced_result, force_chance, end_tag))
            end

            if ability.speed_penalty_base then
                local final_speed = 100 - (10 * sev_lvl)
                if final_speed < 10 then final_speed = 10 end
                table.insert(lines, "            [CE_SPEED_CHANGE:SPEED_PERC:"..final_speed..":ABRUPT:START:0" .. end_tag .. "]")
            end

            -- BREAK logic for scaling attribute reductions
            if ability.ment_att_change then
                local final_perc = 100 - (10 * sev_lvl)
                for _, att in ipairs(ability.ment_att_change) do
                    table.insert(lines, string.format("            [CE_MENT_ATT_CHANGE:%s:%d:0:START:0%s]", att, final_perc, end_tag))
                end
            end

            if ability.phys_att_change then
                local final_perc = 100 - (10 * sev_lvl)
                for _, att in ipairs(ability.phys_att_change) do
                    table.insert(lines, string.format("            [CE_PHYS_ATT_CHANGE:%s:%d:0:START:0%s]", att, final_perc, end_tag))
                end
            end

            -- BUFF logic for scaling attribute increases
            if ability.ment_att_buff then
                local final_perc = ability.ment_att_buff_values and ability.ment_att_buff_values[sev_lvl] or (100 + (10 * sev_lvl))
                for _, att in ipairs(ability.ment_att_buff) do
                    table.insert(lines, string.format("            [CE_MENT_ATT_CHANGE:%s:%d:0:START:0%s]", att, final_perc, end_tag))
                end
            end

            if ability.phys_att_buff then
                local final_perc = ability.phys_att_buff_values and ability.phys_att_buff_values[sev_lvl] or (100 + (10 * sev_lvl))
                for _, att in ipairs(ability.phys_att_buff) do
                    table.insert(lines, string.format("            [CE_PHYS_ATT_CHANGE:%s:%d:0:START:0%s]", att, final_perc, end_tag))
                end
            end

            -- Speed buff (CE_SPEED_CHANGE)
            if ability.speed_buff_values then
                local speed_perc = ability.speed_buff_values[sev_lvl] or (100 + (10 * sev_lvl))
                table.insert(lines, string.format("            [CE_SPEED_CHANGE:SPEED_PERC:%d:ABRUPT:START:0%s]", speed_perc, end_tag))
            end

            -- Flash tile only if colors are configured for this role
            if config.COLORS and config.COLORS[ability.role] then
                local tile = config.SEVERITY_SYMBOLS[sev_lvl] or 249
                local color = config.COLORS[ability.role]
                table.insert(lines, string.format("            [CE_FLASH_TILE:TILE:%d:%s:FREQUENCY:2000:1000:START:0%s]", tile, color, end_tag))
            end

            -- Handle material force multiplier effects
            if ability.material_force_mult then
                local mfm = ability.material_force_mult
                local a_val = mfm.values_a and mfm.values_a[sev_lvl] or (mfm.base_a + ((sev_lvl - 1) * (mfm.per_sev_a or 0)))
                local b_val = mfm.values_b and mfm.values_b[sev_lvl] or mfm.base_b
                if a_val < 0 then a_val = 0 end

                -- Support both single material and materials array
                local mat_list = mfm.materials or {mfm.material}
                for _, mat in ipairs(mat_list) do
                    table.insert(lines, string.format(
                        "            [CE_MATERIAL_FORCE_MULTIPLIER:MAT_MULT:%s:%d:%d:START:0%s]",
                        mat, a_val, b_val, end_tag
                    ))
                end
            end

        elseif should_soak then
            local manual_input_line = is_self_optimized and "" or "[IT_MANUAL_INPUT:target]"
            local base_target = string.format([[
        [I_TARGET:C:CREATURE]
            [IT_LOCATION:CONTEXT_CREATURE]
            %s
    ]], manual_input_line)
            table_merge(lines, split_to_lines({}, base_target))

            for i = sev_lvl, config.MAX_POWER_LEVEL do
                 table.insert(lines, "        [IT_CANNOT_HAVE_SYNDROME_CLASS:" .. config.FIREWALL_CLASS_PREFIX .. "_" .. i .. "]")
            end
            for i = sev_lvl, config.MAX_POWER_LEVEL do
                 table.insert(lines, "        [IT_IMMUNE_CLASS:INNATE_" .. config.INNATE_CLASS .. "_" .. i .. "]")
            end

            table.insert(lines, "    [I_EFFECT:ADD_SYNDROME]")
            table.insert(lines, "        [IE_TARGET:C]")
            table.insert(lines, "        [IE_IMMEDIATE]")

            for innate_lvl = 0, (sev_lvl - 1) do
                local effective_sev = math.max(1, sev_lvl - innate_lvl)
                table.insert(lines, "        [SYNDROME]")

                if innate_lvl == 0 then
                    for k = 1, config.MAX_POWER_LEVEL do
                         table.insert(lines, "            [SYN_IMMUNE_CLASS:INNATE_" .. config.INNATE_CLASS .. "_" .. k .. "]")
                    end
                else
                    table.insert(lines, "            [SYN_AFFECTED_CLASS:INNATE_" .. config.INNATE_CLASS .. "_" .. innate_lvl .. "]")
                    for k = (innate_lvl + 1), config.MAX_POWER_LEVEL do
                         table.insert(lines, "            [SYN_IMMUNE_CLASS:INNATE_" .. config.INNATE_CLASS .. "_" .. k .. "]")
                    end
                end

                if ability.injects_silence then
                     table.insert(lines, "            [SYN_CLASS:" .. config.SILENCE_CLASS .. "]")
                end

                -- Disease Resistance Timer Vector (Neutral for offense soak)
                table.insert(lines, string.format("            [CE_PHYS_ATT_CHANGE:DISEASE_RESISTANCE:100:100:START:0%s]", end_tag))

                if ability.skill_roll_adj then
                    local total_adj = ability.skill_roll_adj * effective_sev
                    local forced_result = total_adj > 0 and 100 or 0
                    local force_chance = math.abs(total_adj)
                    table.insert(lines, string.format("            [CE_SKILL_ROLL_ADJUST:PERC:%d:PERC_ON:%d:START:0%s]", forced_result, force_chance, end_tag))
                end

                if ability.speed_penalty_base then
                    local final_speed = 100 - (10 * effective_sev)
                    if final_speed < 10 then final_speed = 10 end
                    table.insert(lines, "            [CE_SPEED_CHANGE:SPEED_PERC:"..final_speed..":ABRUPT:START:0" .. end_tag .. "]")
                end

                -- Soakable BREAK logic
                if ability.ment_att_change then
                    local final_perc = 100 - (10 * effective_sev)
                    for _, att in ipairs(ability.ment_att_change) do
                        table.insert(lines, string.format("            [CE_MENT_ATT_CHANGE:%s:%d:0:START:0%s]", att, final_perc, end_tag))
                    end
                end

                if ability.phys_att_change then
                    local final_perc = 100 - (10 * effective_sev)
                    for _, att in ipairs(ability.phys_att_change) do
                        table.insert(lines, string.format("            [CE_PHYS_ATT_CHANGE:%s:%d:0:START:0%s]", att, final_perc, end_tag))
                    end
                end

                -- Flash tile only if colors are configured for OFFENSE
                if config.COLORS and config.COLORS.OFFENSE then
                    local tile = config.SEVERITY_SYMBOLS[effective_sev] or 249
                    local color = config.COLORS.OFFENSE
                    table.insert(lines, string.format("            [CE_FLASH_TILE:TILE:%d:%s:FREQUENCY:2000:1000:START:0%s]", tile, color, end_tag))
                end
            end
        end

        return id, lines
    end

    -- =============================================================================
    --  2. PREPARE INTERACTION (The Bullet / Firing)
    -- =============================================================================
    local function generate_prepare_interaction(config, ability_key, sev_lvl, target_type_key, final_attack_id)
        local ability_list = config.ABILITY_TYPES or config.ABILITIES
        local ability = ability_list[ability_key]
        local target_config = config.TARGET_TYPES[target_type_key]

        local strict_name = string.format("%s_SEV_%d_%s", ability.token_prefix, sev_lvl, target_type_key)
        local id = "PREPARE_" .. strict_name
        local lines = {}

        table.insert(lines, "[INTERACTION:" .. id .. "]")
        add_generated_info(lines)

        local base_target = string.format([[
        [I_TARGET:A:CREATURE]
            [IT_LOCATION:CONTEXT_CREATURE]
            [IT_CANNOT_TARGET_IF_ALREADY_AFFECTED]
            [IT_CANNOT_HAVE_SYNDROME_CLASS:%s]
        [I_EFFECT:ADD_SYNDROME]
            [IE_TARGET:A]
            [IE_IMMEDIATE]
            [SYNDROME]
    ]], config.SILENCE_CLASS)
        table_merge(lines, split_to_lines({}, base_target))

        -- Delay based on target type: single-target=2, area=3, mass=4
        local start_tick = 2
        if target_type_key == "TOTAL" then start_tick = 4
        elseif target_type_key == "FIELD" or target_type_key == "SPREAD" then start_tick = 3 end

        local window_width = 100
        local end_tick = start_tick + 1
        local dwf_stretch = 8

        table.insert(lines, string.format("            [CE_CAN_DO_INTERACTION:PROB:100:START:%d:END:%d:DWF_STRETCH:%d]", start_tick, end_tick, dwf_stretch))
        table.insert(lines, "                [CDI:INTERACTION:" .. final_attack_id .. "]")
        table.insert(lines, "                [CDI:ADV_NAME:execute " .. strict_name .. "]")

        -- Usage hints based on ability role and target type
        if ability.role == "DEFENSE" then
            if target_type_key == "SELF" then
                table.insert(lines, "                [CDI:USAGE_HINT:DEFEND]")
            else
                table.insert(lines, "                [CDI:USAGE_HINT:GREETING]")
            end
        else
            table.insert(lines, "                [CDI:USAGE_HINT:ATTACK]")
        end

        -- Targeting based on target type
        if target_type_key == "SELF" then
            table.insert(lines, "                [CDI:TARGET:C:SELF_ONLY]")
        else
            table.insert(lines, "                [CDI:TARGET:C:" .. target_config.cdi_target .. "]")
            if target_config.range then
                table.insert(lines, "                [CDI:TARGET_RANGE:C:" .. target_config.range .. "]")
            end
        end

        table.insert(lines, "                [CDI:MAX_TARGET_NUMBER:C:" .. target_config.max_targets .. "]")

        -- Use custom prepare cooldowns for projectile abilities, otherwise default
        local wait_period = (window_width + 10)
        if ability.prepare_cooldowns and ability.prepare_cooldowns[sev_lvl] then
            wait_period = ability.prepare_cooldowns[sev_lvl]
        end
        table.insert(lines, "                [CDI:WAIT_PERIOD:" .. wait_period .. "]")

        local t_verb_final = "hit target:hits target:NA"
        if ability.target_verbs and ability.target_verbs[sev_lvl] then
             local sev_entry = ability.target_verbs[sev_lvl]
             -- Check for nested format: target_verbs[sev][target_type]
             if type(sev_entry) == "table" and sev_entry[target_type_key] then
                 t_verb_final = sev_entry[target_type_key]
             elseif type(sev_entry) == "string" then
                 -- Flat format: target_verbs[sev] = "string"
                 t_verb_final = sev_entry
             end
        elseif ability.target_verb then
             local sev_adj = config.SEVERITY_ADJECTIVES[sev_lvl] or "standard"
             t_verb_final = ability.target_verb:gsub("%%s", sev_adj)
        end

        table.insert(lines, "                [CDI:TARGET_VERB:" .. t_verb_final .. "]")

        return id, lines
    end

    -- =============================================================================
    --  3. SECRET (Learning Method) - WITH AFFINITY UPGRADE SYSTEM
    -- =============================================================================
    local function generate_secret(config, ability_key, sev_lvl, target_type_key, prepare_id)
        local ability = (config.ABILITY_TYPES or config.ABILITIES)[ability_key]
        local target_config = config.TARGET_TYPES[target_type_key]
        local strict_name = string.format("%s_SEV_%d_%s", ability.token_prefix, sev_lvl, target_type_key)
        local base_secret_id = "SECRET_" .. strict_name
        local unique_class = "HAS_" .. strict_name
        local copies_count = math.max(1, (config.WORLDGEN_RARITY_CONSTANT or 10) - (sev_lvl + target_config.cost_tier))

        local all_lines = {}
        for i = 0, (copies_count - 1) do
            local current_id = (i > 0) and (base_secret_id .. "_COPY_" .. i) or base_secret_id
            table.insert(all_lines, "[INTERACTION:" .. current_id .. "]")
            add_generated_info(all_lines)

            local source_block_1 = string.format([[
        [I_SOURCE:DEITY]
            [IS_USAGE_HINT:MAJOR_CURSE]
            [IS_HIST_STRING_1: the infodeity was challenged in the Datasphere by ]
            [IS_HIST_STRING_2: who obtained the program %s]
        [I_SOURCE:SECRET]
            [IS_NAME:%s]
            [IS_SECRET_GOAL:IMMORTALITY]
            [IS_SECRET:SUPERNATURAL_LEARNING_POSSIBLE]
            [IS_SECRET:MUNDANE_RESEARCH_POSSIBLE]
            [IS_SECRET:MUNDANE_TEACHING_POSSIBLE]
            [IS_SECRET:MUNDANE_RECORDING_POSSIBLE:BOOK_INSTRUCTION:SECRET_DIGITAL]
        [I_TARGET:A:CREATURE]
            [IT_LOCATION:CONTEXT_CREATURE]
            [IT_REQUIRES:CAN_LEARN]
            [IT_REQUIRES:CAN_SPEAK]
            [IT_CANNOT_HAVE_SYNDROME_CLASS:%s]
    ]], strict_name, strict_name, unique_class)
            table_merge(all_lines, split_to_lines({}, source_block_1))

            -- I_EFFECT header
            table.insert(all_lines, "    [I_EFFECT:ADD_SYNDROME]")
            table.insert(all_lines, "        [IE_TARGET:A]")
            table.insert(all_lines, "        [IE_IMMEDIATE]")
            table.insert(all_lines, "        [IE_ARENA_NAME:" .. strict_name .. "]")

            -- =====================================================================
            -- AFFINITY UPGRADE SYSTEM
            -- Generate a syndrome for EACH innate level (1 to MAX)
            -- Each syndrome only affects creatures with that exact affinity
            -- Creatures get max(their_affinity, secret_severity) ability
            -- =====================================================================
            for affinity_lvl = config.MAX_POWER_LEVEL, 1, -1 do
                local grant_lvl = math.max(affinity_lvl, sev_lvl)
                local grant_strict_name = string.format("%s_SEV_%d_%s", ability.token_prefix, grant_lvl, target_type_key)
                local grant_unique_class = "HAS_" .. grant_strict_name
                local grant_prepare_id = "PREPARE_" .. grant_strict_name

                table.insert(all_lines, "        [SYNDROME]")
                table.insert(all_lines, "            [SYN_AFFECTED_CLASS:INNATE_" .. config.INNATE_CLASS .. "_" .. affinity_lvl .. "]")
                table.insert(all_lines, "            [SYN_CLASS:" .. grant_unique_class .. "]")
                table.insert(all_lines, "            [CE_DISPLAY_NAME:NAME:transmuter:transmuters:transmuter:START:0]")
                table.insert(all_lines, "            [CE_CAN_DO_INTERACTION:PROB:100:START:0:ABRUPT]")
                table.insert(all_lines, "                [CDI:ADV_NAME:compile " .. grant_strict_name .. "]")
                table.insert(all_lines, "                [CDI:TARGET:A:SELF_ONLY]")
                table.insert(all_lines, "                [CDI:INTERACTION:" .. grant_prepare_id .. "]")

                if ability.role == "DEFENSE" and target_type_key ~= "SELF" then
                    table.insert(all_lines, "                [CDI:USAGE_HINT:GREETING]")
                else
                    table.insert(all_lines, "                [CDI:USAGE_HINT:DEFEND]")
                end

                local grant_wait = ability.cooldown_values and ability.cooldown_values[grant_lvl] or ((grant_lvl + target_config.cost_tier) * 100)
                table.insert(all_lines, "                [CDI:WAIT_PERIOD:" .. grant_wait .. "]")

                local role_text = config.FLAVOR_TEXT[ability.role]
                if role_text and role_text[grant_lvl] and role_text[grant_lvl][target_type_key] then
                    local entry = role_text[grant_lvl][target_type_key]
                    table.insert(all_lines, "                [CDI:VERB:" .. entry.VERB_1ST .. ":" .. entry.VERB_3RD .. ":NA]")
                else
                    table.insert(all_lines, "                [CDI:VERB:compile a program:compiles a program:NA]")
                end
            end

            -- Base syndrome for creatures with NO innate class (grants secret's base severity)
            table.insert(all_lines, "        [SYNDROME]")
            for immune_lvl = 1, config.MAX_POWER_LEVEL do
                table.insert(all_lines, "            [SYN_IMMUNE_CLASS:INNATE_" .. config.INNATE_CLASS .. "_" .. immune_lvl .. "]")
            end
            table.insert(all_lines, "            [SYN_CLASS:" .. unique_class .. "]")
            table.insert(all_lines, "            [CE_DISPLAY_NAME:NAME:transmuter:transmuters:transmuter:START:0]")
            table.insert(all_lines, "            [CE_CAN_DO_INTERACTION:PROB:100:START:0:ABRUPT]")
            table.insert(all_lines, "                [CDI:ADV_NAME:compile " .. strict_name .. "]")
            table.insert(all_lines, "                [CDI:TARGET:A:SELF_ONLY]")
            table.insert(all_lines, "                [CDI:INTERACTION:" .. prepare_id .. "]")

            if ability.role == "DEFENSE" and target_type_key ~= "SELF" then
                table.insert(all_lines, "                [CDI:USAGE_HINT:GREETING]")
            else
                table.insert(all_lines, "                [CDI:USAGE_HINT:DEFEND]")
            end

            local secret_wait = ability.cooldown_values and ability.cooldown_values[sev_lvl] or ((sev_lvl + target_config.cost_tier) * 100)
            table.insert(all_lines, "                [CDI:WAIT_PERIOD:" .. secret_wait .. "]")

            local role_text = config.FLAVOR_TEXT[ability.role]
            local target_order = target_type_key
            if role_text and role_text[sev_lvl] and role_text[sev_lvl][target_order] then
                local entry = role_text[sev_lvl][target_order]
                table.insert(all_lines, "                [CDI:VERB:" .. entry.VERB_1ST .. ":" .. entry.VERB_3RD .. ":NA]")
            else
                table.insert(all_lines, "                [CDI:VERB:compile a program:compiles a program:NA]")
            end

            table.insert(all_lines, "")
        end
        return base_secret_id, all_lines
    end

    -- =============================================================================
    --  4. REACTION & INORGANIC (Crafting & Items)
    -- =============================================================================
    local function generate_reaction(config, ability_key, sev_lvl, target_type_key, inorganic_id)
        local ability = (config.ABILITY_TYPES or config.ABILITIES)[ability_key]
        local craft = config.CRAFTING
        local target_config = config.TARGET_TYPES[target_type_key]
        local strict_name = string.format("%s_SEV_%d_%s", ability.token_prefix, sev_lvl, target_type_key)
        local description = string.format("Compile a %s %s %s program.", config.SEVERITY_ADJECTIVES[sev_lvl] or "standard", ability.name, target_config.desc)
        local tier_sum = sev_lvl + target_config.cost_tier

        local lines = {}
        table.insert(lines, "[REACTION:" .. strict_name .. "_REACTION]")
        add_generated_info(lines)
        local reagent = (not craft.FREE_RECIPES) and ("[REAGENT:tablet:1:TOOL:ITEM_TOOL_TABLET_INCOMPLETE_PROGRAM" .. tier_sum .. ":NONE:NONE]") or ""

        local fort_block = string.format([[
        [NAME:Compile %s]
        [FORTRESS_MODE_ENABLED]
        [BUILDING:%s:NONE]
        %s
        [PRODUCT:100:1:MEAT:NONE:INORGANIC:%s]
        [SKILL:EXTRACT_STRAND]
        [DESCRIPTION:%s]
        [CATEGORY:%s_FORT]
            [CATEGORY_NAME:Transmutation Arts- %s]
    ]], strict_name, craft.FORT_BUILDING, reagent, inorganic_id, description, craft.CATEGORY_ID_PREFIX, config.SCHOOL_THEME)
        table_merge(lines, split_to_lines({}, fort_block))

        table.insert(lines, "")
        table.insert(lines, "[REACTION:" .. strict_name .. "_REACTION_ADV]")
        add_generated_info(lines)
        local adv_reagent = (not craft.FREE_RECIPES) and ("[REAGENT:scrap:"..(tier_sum * 15)..":TOOL:ITEM_TOOL_SCRAP:"..craft.ADV_SCRAP_MAT.."]") or ""

        local adv_block = string.format([[
        [NAME:Compile %s]
        [ADVENTURE_MODE_ENABLED]
        %s
        [PRODUCT:100:1:MEAT:NONE:INORGANIC:%s]
        [SKILL:EXTRACT_STRAND]
        [DESCRIPTION:%s]
        [CATEGORY:%s_ADV]
            [CATEGORY_NAME:Transmutation Arts- %s]
                  [CATEGORY_DESCRIPTION:]
    ]], strict_name, adv_reagent, inorganic_id, description, craft.CATEGORY_ID_PREFIX, config.SCHOOL_THEME)
        table_merge(lines, split_to_lines({}, adv_block))

        return strict_name .. "_REACTION", lines
    end

    -- =============================================================================
    --  INORGANIC - WITH AFFINITY UPGRADE SYSTEM
    -- =============================================================================
    local function generate_inorganic(config, ability_key, sev_lvl, target_type_key, prepare_id)
        local ability = (config.ABILITY_TYPES or config.ABILITIES)[ability_key]
        local target_config = config.TARGET_TYPES[target_type_key]
        local strict_name = string.format("%s_SEV_%d_%s", ability.token_prefix, sev_lvl, target_type_key)
        local unique_class = "HAS_" .. strict_name

        local lines = {}
        table.insert(lines, "[INORGANIC:" .. strict_name .. "_PROGRAM]")
        add_generated_info(lines)

        -- Base material properties (no syndrome yet)
        local base_material = string.format([[
        [USE_MATERIAL_TEMPLATE:MUSCLE_TABLET_TEMPLATE][MEAT][SPECIAL]
        [STATE_NAME_ADJ:ALL_SOLID:%s]
        [DISPLAY_COLOR:2:0:1][TILE:232]
        [MELTING_POINT:12070]
        [SOLID_DENSITY:400]
        [MEAT_NAME:NONE:data packet- %s:data packets- %s]
    ]], strict_name, strict_name, strict_name)
        table_merge(lines, split_to_lines({}, base_material))

        -- =====================================================================
        -- AFFINITY UPGRADE SYSTEM FOR INORGANICS
        -- Generate a syndrome for EACH innate level (1 to MAX)
        -- Each syndrome only affects creatures with that exact affinity
        -- Creatures get max(their_affinity, inorganic_severity) ability
        -- =====================================================================
        for affinity_lvl = config.MAX_POWER_LEVEL, 1, -1 do
            local grant_lvl = math.max(affinity_lvl, sev_lvl)
            local grant_strict_name = string.format("%s_SEV_%d_%s", ability.token_prefix, grant_lvl, target_type_key)
            local grant_unique_class = "HAS_" .. grant_strict_name
            local grant_prepare_id = "PREPARE_" .. grant_strict_name

            table.insert(lines, "    [SYNDROME]")
            table.insert(lines, "        [SYN_INGESTED]")
            table.insert(lines, "        [SYN_AFFECTED_CLASS:INNATE_" .. config.INNATE_CLASS .. "_" .. affinity_lvl .. "]")
            table.insert(lines, "        [SYN_CLASS:" .. grant_unique_class .. "]")
            table.insert(lines, "        [SYN_IMMUNE_CLASS:" .. grant_unique_class .. "]")
            table.insert(lines, "        [CE_DISPLAY_NAME:NAME:transmuter:transmuters:transmuter:START:0]")
            table.insert(lines, "        [CE_CAN_DO_INTERACTION:PROB:100:START:0]")
            table.insert(lines, "            [CDI:ADV_NAME:compile " .. grant_strict_name .. "]")
            table.insert(lines, "            [CDI:TARGET:A:SELF_ONLY]")
            table.insert(lines, "            [CDI:INTERACTION:" .. grant_prepare_id .. "]")

            local grant_wait = ability.cooldown_values and ability.cooldown_values[grant_lvl] or ((grant_lvl + target_config.cost_tier) * 100)
            table.insert(lines, "            [CDI:WAIT_PERIOD:" .. grant_wait .. "]")

            if ability.role == "DEFENSE" and target_type_key ~= "SELF" then
                table.insert(lines, "            [CDI:USAGE_HINT:GREETING]")
            else
                table.insert(lines, "            [CDI:USAGE_HINT:DEFEND]")
            end

            local role_text = config.FLAVOR_TEXT[ability.role]
            if role_text and role_text[grant_lvl] and role_text[grant_lvl][target_type_key] then
                local entry = role_text[grant_lvl][target_type_key]
                table.insert(lines, "            [CDI:VERB:" .. entry.VERB_1ST .. ":" .. entry.VERB_3RD .. ":NA]")
            else
                table.insert(lines, "            [CDI:VERB:compile a program:compiles a program:NA]")
            end
        end

        -- Base syndrome for creatures with NO innate class (grants inorganic's base severity)
        table.insert(lines, "    [SYNDROME]")
        table.insert(lines, "        [SYN_INGESTED]")
        for immune_lvl = 1, config.MAX_POWER_LEVEL do
            table.insert(lines, "        [SYN_IMMUNE_CLASS:INNATE_" .. config.INNATE_CLASS .. "_" .. immune_lvl .. "]")
        end
        table.insert(lines, "        [SYN_CLASS:" .. unique_class .. "]")
        table.insert(lines, "        [SYN_IMMUNE_CLASS:" .. unique_class .. "]")
        table.insert(lines, "        [CE_DISPLAY_NAME:NAME:transmuter:transmuters:transmuter:START:0]")
        table.insert(lines, "        [CE_CAN_DO_INTERACTION:PROB:100:START:0]")
        table.insert(lines, "            [CDI:ADV_NAME:compile " .. strict_name .. "]")
        table.insert(lines, "            [CDI:TARGET:A:SELF_ONLY]")
        table.insert(lines, "            [CDI:INTERACTION:" .. prepare_id .. "]")

        local inorganic_wait = ability.cooldown_values and ability.cooldown_values[sev_lvl] or ((sev_lvl + target_config.cost_tier) * 100)
        table.insert(lines, "            [CDI:WAIT_PERIOD:" .. inorganic_wait .. "]")

        if ability.role == "DEFENSE" and target_type_key ~= "SELF" then
            table.insert(lines, "            [CDI:USAGE_HINT:GREETING]")
        else
            table.insert(lines, "            [CDI:USAGE_HINT:DEFEND]")
        end

        local role_text = config.FLAVOR_TEXT[ability.role]
        local target_order = target_type_key
        if role_text and role_text[sev_lvl] and role_text[sev_lvl][target_order] then
            table.insert(lines, "            [CDI:VERB:" .. role_text[sev_lvl][target_order].VERB_1ST .. ":" .. role_text[sev_lvl][target_order].VERB_3RD .. ":NA]")
        else
            table.insert(lines, "            [CDI:VERB:compile a program:compiles a program:NA]")
        end

        return strict_name .. "_PROGRAM", lines
    end

    -- =============================================================================
    --  5. NPC UNLOCKER SYSTEM (UNIVERSAL) - OPTIMIZED
    -- =============================================================================
    local function generate_npc_tiers(config, sorted_ability_keys)
        local lines = {}
        local idx = 0
        local prefix = config.CRAFTING.CATEGORY_ID_PREFIX or "TRANSMUTATION"
        local init_class = prefix .. "_NPC_INITIALIZED"
        local innate_class = config.INNATE_CLASS
        local max_power = config.MAX_POWER_LEVEL
        local ability_list = config.ABILITY_TYPES or config.ABILITIES
        local flavor_text = config.FLAVOR_TEXT

        -- Header lines
        idx = idx + 1; lines[idx] = "[INTERACTION:" .. prefix .. "_NPC_UNLOCK_UNIVERSAL]"
        add_generated_info(lines); idx = #lines
        idx = idx + 1; lines[idx] = "    [I_TARGET:A:CREATURE]\n        [IT_LOCATION:CONTEXT_CREATURE]\n        [IT_CANNOT_HAVE_SYNDROME_CLASS:" .. init_class .. "]"
        idx = idx + 1; lines[idx] = "    [I_EFFECT:ADD_SYNDROME]\n        [IE_TARGET:A]\n        [IE_IMMEDIATE]\n        [SYNDROME]\n            [SYN_CLASS:" .. init_class .. "]"
        for i = 0, max_power do
            idx = idx + 1; lines[idx] = "            [SYN_AFFECTED_CLASS:INNATE_" .. innate_class .. "_" .. i .. "]"
        end

        -- Pre-cache target configs for faster access in inner loop
        local target_configs = config.TARGET_TYPES

        for firewall_lvl = 0, max_power do
            local tier_to_grant = firewall_lvl + 2
            local firewall_class_line = "            [SYN_AFFECTED_CLASS:INNATE_" .. innate_class .. "_" .. firewall_lvl .. "]"

            for _, key in ipairs(sorted_ability_keys) do
                local ability = ability_list[key]
                local ability_role = ability.role
                local token_prefix = ability.token_prefix
                local target_types = ability.target_types or {}
                local role_text = flavor_text[ability_role]

                for sev = 1, max_power do
                    for t = 1, #target_types do
                        local target_type_key = target_types[t]
                        local target_config = target_configs[target_type_key]
                        local ability_tier = sev + target_config.cost_tier

                        if ability_tier == tier_to_grant then
                            -- Skip multi-target DEFENSE abilities for NPCs
                            if not (ability_role == "DEFENSE" and target_type_key ~= "SELF") then
                                local strict_name = token_prefix .. "_SEV_" .. sev .. "_" .. target_type_key
                                local unique_class = "HAS_" .. strict_name

                                local prob = 30
                                if ability_role == "DEFENSE" and target_type_key == "SELF" and token_prefix ~= "POSPROB" then prob = 100 end

                                idx = idx + 1; lines[idx] = "        [SYNDROME]"
                                idx = idx + 1; lines[idx] = "            [SYN_CLASS:" .. unique_class .. "]\n            [SYN_IMMUNE_CLASS:" .. unique_class .. "]"
                                idx = idx + 1; lines[idx] = firewall_class_line
                                idx = idx + 1; lines[idx] = "            [CE_CAN_DO_INTERACTION:PROB:" .. prob .. ":START:0:ABRUPT]"
                                idx = idx + 1; lines[idx] = "                [CDI:INTERACTION:PREPARE_" .. strict_name .. "]\n                [CDI:ADV_NAME:compile npc_ability]\n                [CDI:TARGET:A:SELF_ONLY]"
                                idx = idx + 1; lines[idx] = "                [CDI:WAIT_PERIOD:" .. (ability_tier * 100) .. "]"
                                idx = idx + 1; lines[idx] = "                [CDI:USAGE_HINT:" .. (ability_role == "DEFENSE" and "DEFEND" or "ATTACK") .. "]"

                                if role_text and role_text[sev] and role_text[sev][target_type_key] then
                                    local entry = role_text[sev][target_type_key]
                                    idx = idx + 1; lines[idx] = "                [CDI:VERB:" .. entry.VERB_1ST .. ":" .. entry.VERB_3RD .. ":NA]"
                                else
                                    idx = idx + 1; lines[idx] = "                [CDI:VERB:compile a program:compiles a program:NA]"
                                end
                            end
                        end
                    end
                end
            end
        end
        return lines
    end

    -- =============================================================================
    --  MAIN EXECUTION
    -- =============================================================================
    function M.generate(config)
        local all_interaction_lines, all_inorganic_lines, all_reaction_lines = {}, {}, {}
        script_log("TRANSMUTATION_ARTS: Starting generation for " .. (config.SCHOOL_NAME or "unknown school") .. "...")

        local sorted_keys = {}
        for k in pairs(config.ABILITY_TYPES or config.ABILITIES) do table.insert(sorted_keys, k) end
        table.sort(sorted_keys)

        for _, key in ipairs(sorted_keys) do
            local ability = (config.ABILITY_TYPES or config.ABILITIES)[key]
            for sev = 1, config.MAX_POWER_LEVEL do
                local shared_id = nil
                local self_attack_id = nil

                -- For external_interaction abilities, skip FINAL generation entirely
                -- For non-projectile abilities, create shared FINAL and optional SELF FINAL
                if not ability.projectile and not ability.external_interaction then
                    local attack_lines
                    shared_id, attack_lines = generate_final_attack(config, key, sev, false)
                    table_merge(all_interaction_lines, attack_lines)
                    table.insert(all_interaction_lines, "")

                    if ability.role == "DEFENSE" then
                        local self_lines
                        self_attack_id, self_lines = generate_final_attack(config, key, sev, true)
                        table_merge(all_interaction_lines, self_lines)
                        table.insert(all_interaction_lines, "")
                    end
                end

                for _, target_type_key in ipairs(ability.target_types or {}) do
                    local final_id

                    -- For external_interaction abilities, use the external interaction ID directly
                    if ability.external_interaction then
                        final_id = ability.external_interaction
                    -- For projectile abilities, create a FINAL for each target type
                    elseif ability.projectile then
                        local proj_lines
                        final_id, proj_lines = generate_final_attack(config, key, sev, false, target_type_key)
                        table_merge(all_interaction_lines, proj_lines)
                        table.insert(all_interaction_lines, "")
                    else
                        -- Use self_attack_id for SELF target type on DEFENSE
                        final_id = (target_type_key == "SELF" and self_attack_id) and self_attack_id or shared_id
                    end

                    local prep_id, prep_lines = generate_prepare_interaction(config, key, sev, target_type_key, final_id)
                    table_merge(all_interaction_lines, prep_lines)
                    table.insert(all_interaction_lines, "")

                    local _, sec_lines = generate_secret(config, key, sev, target_type_key, prep_id)
                    table_merge(all_interaction_lines, sec_lines)
                    table.insert(all_interaction_lines, "")

                    local mat_id, mat_lines = generate_inorganic(config, key, sev, target_type_key, prep_id)
                    table_merge(all_inorganic_lines, mat_lines)
                    table.insert(all_inorganic_lines, "")

                    local _, react_lines = generate_reaction(config, key, sev, target_type_key, mat_id)
                    table_merge(all_reaction_lines, react_lines)
                    table.insert(all_reaction_lines, "")
                end
            end
        end

        table_merge(all_interaction_lines, generate_npc_tiers(config, sorted_keys))

        if _G.raws then
            if _G.raws.register_interactions then _G.raws.register_interactions(all_interaction_lines) end
            if _G.raws.register_inorganics then _G.raws.register_inorganics(all_inorganic_lines) end
            if _G.raws.register_reactions then _G.raws.register_reactions(all_reaction_lines) end
        end
        return all_interaction_lines, all_inorganic_lines, all_reaction_lines
    end

-- =============================================================================
-- STANDALONE PATH FIX (must be at module level)
-- =============================================================================
local function add_script_dir_to_path()
    local info = debug.getinfo(1, "S")
    if info and info.source then
        -- Handle both Unix and Windows path separators
        local script_path = info.source:match("@?(.*[/\\])") or "./"
        package.path = script_path .. "?.lua;" .. package.path
        return script_path
    end
    return nil
end

-- =============================================================================
-- STANDALONE EXECUTION BLOCK
-- =============================================================================
if arg and arg[0] and arg[0]:match("generator_transmutation_arts") then
    local script_dir = add_script_dir_to_path()
    math.randomseed(os.time())

    -- Preload shared config for standalone mode (handles transmutation.X -> X mapping)
    local shared_success, shared_module = pcall(require, "config_transmutation_shared")
    if shared_success then
        package.loaded["transmutation.config_transmutation_shared"] = shared_module
        print("TRANSMUTATION_GENERATOR: Preloaded shared config module.")
    end

    print("TRANSMUTATION_GENERATOR: Running in STANDALONE mode.")
    if script_dir then
        print("TRANSMUTATION_GENERATOR: Script directory: " .. script_dir)
    end

    local config_file_name = arg[1]
    if not config_file_name then
        print("TRANSMUTATION_GENERATOR: ERROR - No config file specified.")
        print("Usage: lua generator_transmutation_arts.lua <config_file>")
        print("Example: lua generator_transmutation_arts.lua config_energy_warfare")
        print("         lua generator_transmutation_arts.lua config_digital_warfare")
        return
    end

    -- Strip .lua extension if provided
    config_file_name = config_file_name:gsub("%.lua$", "")

    print("TRANSMUTATION_GENERATOR: Loading config file: " .. config_file_name .. ".lua")
    local success, config = pcall(require, config_file_name)
    if not success or not config then
        print("TRANSMUTATION_GENERATOR: FATAL ERROR - Could not load config file.")
        print("Error details: " .. tostring(config))
        return
    end

    print("TRANSMUTATION_GENERATOR: Config loaded successfully: " .. (config.SCHOOL_NAME or "Unknown School"))

    -- Set up output capture
    local output_filename = "output_" .. config_file_name:gsub("^config_", "") .. ".txt"

    local all_interactions = {}
    local all_inorganics = {}
    local all_reactions = {}

    _G.raws = {
        register_interactions = function(lines)
            for _, line in ipairs(lines) do table.insert(all_interactions, line) end
        end,
        register_inorganics = function(lines)
            for _, line in ipairs(lines) do table.insert(all_inorganics, line) end
        end,
        register_reactions = function(lines)
            for _, line in ipairs(lines) do table.insert(all_reactions, line) end
        end,
    }

    print("TRANSMUTATION_GENERATOR: Starting generation...")
    local gen_success, err = pcall(M.generate, config)
    if not gen_success then
        print("TRANSMUTATION_GENERATOR: FATAL ERROR during generation: " .. tostring(err))
        return
    end

    -- Write output file
    local file, open_err = io.open(output_filename, "w")
    if not file then
        print("TRANSMUTATION_GENERATOR: FATAL ERROR - Could not open output file: " .. tostring(open_err))
        return
    end

    file:write("--- GENERATED " .. (config.SCHOOL_NAME or "UNKNOWN"):upper() .. " OUTPUT ---\n\n")

    if #all_interactions > 0 then
        file:write("[OBJECT:INTERACTION]\n\n")
        for _, line in ipairs(all_interactions) do file:write(line .. "\n") end
        file:write("\n")
    end

    if #all_inorganics > 0 then
        file:write("[OBJECT:INORGANIC]\n\n")
        for _, line in ipairs(all_inorganics) do file:write(line .. "\n") end
        file:write("\n")
    end

    if #all_reactions > 0 then
        file:write("[OBJECT:REACTION]\n\n")
        for _, line in ipairs(all_reactions) do file:write(line .. "\n") end
    end

    file:close()

    print("TRANSMUTATION_GENERATOR: Successfully generated output to '" .. output_filename .. "'")
    print("TRANSMUTATION_GENERATOR: Interactions: " .. #all_interactions .. " lines")
    print("TRANSMUTATION_GENERATOR: Inorganics: " .. #all_inorganics .. " lines")
    print("TRANSMUTATION_GENERATOR: Reactions: " .. #all_reactions .. " lines")
end

return M
