local rules = require("rules.gait_rules")

local M = {}

-- [[ CORE CALCULATION LOGIC ]] --

local function calculate_net_gaits(config, components)
    local net_gaits = {}
    
    -- Helper to process a table's gait entries (now looking inside .gaits)
    local function add_gaits(source)
        if source and source.gaits then
            for _, gait_key in ipairs(rules.VALID_GAITS) do
                if source.gaits[gait_key] then
                    net_gaits[gait_key] = (net_gaits[gait_key] or 0) + source.gaits[gait_key]
                end
            end
        end
    end

    -- 1. Check base config
    add_gaits(config)

    -- 2. Check components and their flowcharts
    if components then
        for _, comp_data in pairs(components) do
            if type(comp_data) == "table" then
                add_gaits(comp_data)
                
                -- Recursive flowchart check
                if comp_data.flowchart_selections then
                    local function check_flowchart(selections)
                        for _, selection in ipairs(selections) do
                            add_gaits(selection)
                            if selection.flowchart_selections then
                                check_flowchart(selection.flowchart_selections)
                            end
                        end
                    end
                    check_flowchart(comp_data.flowchart_selections)
                end
            end
        end
    end
    
    return net_gaits
end

-- [[ STRING GENERATION ]] --

function M.generate_gait_strings(config, components)
    local net_gaits = calculate_net_gaits(config, components)
    local lines = {}

    for gait_key, total_kph in pairs(net_gaits) do
        local mapping = rules.GAIT_MAPPINGS[gait_key]
        if mapping then
            local df_speed = rules.calculate_df_speed(total_kph)
            
            for _, gait_type in ipairs(mapping.types) do
                local line = string.format("[GAIT:%s:%s:%d:%d:%d:10]", 
                    gait_type, 
                    mapping.action, 
                    df_speed, 
                    math.floor(df_speed * 0.75), 
                    math.floor(df_speed * 0.5)
                )
                table.insert(lines, line)
            end
        end
    end

    return table.concat(lines, "\n")
end

-- [[ DESCRIPTION GENERATION ]] --

function M.get_gait_description(config, components)
    local net_gaits = calculate_net_gaits(config, components)
    local desc_parts = {}

    for gait_key, total_kph in pairs(net_gaits) do
        local label = gait_key:match("STANDARD_(%w+)_GAITS") or gait_key
        table.insert(desc_parts, string.format("%s: %d KPH", label, total_kph))
    end

    if #desc_parts > 0 then
        return "/APPROX_SPEED = " .. table.concat(desc_parts, ", ") .. ""
    end

    return ""
end

return M