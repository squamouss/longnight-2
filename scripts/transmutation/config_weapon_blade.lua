

return {
    -- ### Base Identifiers ###
    ID_PREFIX = "BLADE",
    SECRET_PREFIX = "CONSTRUCTBLADE",
    PAYLOAD_PREFIX = "BLADE_PAYLOAD",

    -- ### General Naming ###
    WEAPON_NAME = "Blade",
    SECRET_NAME = "Construct Blade",
    TABLET_NAME = "Blade Implant",
    
    -- Weapon Construction
    CONSTRUCT_ADV_NAME = "Construct Blade",
    CONSTRUCT_VERB = "construct a disposable blade from ambient N-matter:constructs a disposable blade from ambient N-matter:NA",
    CONSTRUCT_WAIT_PERIOD = 100, 

    -- Actual Attack
    PAYLOAD_VERB = "slash with your blade:slashes with their blade:NA",
    PAYLOAD_PROJECTILE_MAT = "INORGANIC:W_TECH",
    PAYLOAD_PROJECTILE_TYPE = "SHARP_ROCK",
    PAYLOAD_RANGE = 50,
    
    -- Targeting Type
    PAYLOAD_TARGET_TYPE = "TOUCHABLE",
    
    -- Charge Time
    PAYLOAD_TELEGRAPH_TICKS = 1, 
    
    -- Firing Window
    PAYLOAD_WINDOW_DURATION = 2,
    
    -- DWF_STRETCH 
    PAYLOAD_DWF_STRETCH = 10,
    
    -- Shot Cooldowns
    PAYLOAD_COOLDOWNS = {
        NORMAL = 30, 
        LARGE = 20,  
        HUGE = 10,   
    },

    -- Max Targets
    PAYLOAD_MAX_TARGETS = {
        NORMAL = 1,
        LARGE = 1,
        HUGE = 1,
    },

    -- Edible Tablet
    TABLET_TILE = "'#'",
    TABLET_COLOR = "7:11:0",

    -- Crafting Reactions
    FORT_REAGENT_TABLET = "ITEM_TOOL_TABLET_INCOMPLETE_COMBAT",
    FORT_REAGENT_MATERIAL = "INORGANIC:N_MATTER",
    FORT_BUILDING = "N_MATTER_REFINERY",
    
    ADV_REAGENT_SCRAP = "ITEM_TOOL_SCRAP",
    ADV_REAGENT_MATERIAL = "INORGANIC:N_MATTER",
    ADV_REAGENT_TOOL = "ITEM_TOOL_PORTABLE_SYNTH",
    ADV_SCRAP_COST = 15,

    -- Fortress Mode crafting
    FORT_CATEGORY_ID = "COMBAT_PROGRAM_BLADE",
    FORT_CATEGORY_NAME = "Combat Programs- Blade",
    FORT_CATEGORY_DESC = "Install an automatic weapon",
    
    -- Adventure Mode crafting
    ADV_CATEGORY_ID = "COMBAT_PROGRAM_BLADE_ADV",
    ADV_CATEGORY_NAME = "Combat Program- Blade",
    ADV_CATEGORY_DESC = "Innate weapons",
}

