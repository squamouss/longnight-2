

return {
    -- ### Base Identifiers ###
    ID_PREFIX = "AUTOGUN",
    SECRET_PREFIX = "CONSTRUCTAUTOGUN",
    PAYLOAD_PREFIX = "AUTOGUN_PAYLOAD",

    -- ### General Naming ###
    WEAPON_NAME = "Autogun",
    SECRET_NAME = "Construct Autogun",
    TABLET_NAME = "Autogun Implant",
    
    -- Weapon Construction
    CONSTRUCT_ADV_NAME = "Construct Autogun",
    CONSTRUCT_VERB = "construct an autogun from ambient N-matter:constructs an autogun from ambient N-matter:NA",
    CONSTRUCT_WAIT_PERIOD = 100, 

    -- Actual Attack
    PAYLOAD_VERB = "fire your autogun:fire your autogun:NA",
    PAYLOAD_PROJECTILE_MAT = "INORGANIC:M_TECH",
    PAYLOAD_PROJECTILE_TYPE = "SOLID_GLOB",
    PAYLOAD_RANGE = 100,
    
    -- Targeting Type
    PAYLOAD_TARGET_TYPE = "LINE_OF_SIGHT",
    
    -- Charge Time
    PAYLOAD_TELEGRAPH_TICKS = 1, 
    
    -- Firing Window
    PAYLOAD_WINDOW_DURATION = 6,
    
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
    FORT_CATEGORY_ID = "COMBAT_PROGRAM_AUTOGUN",
    FORT_CATEGORY_NAME = "Combat Programs- Autogun",
    FORT_CATEGORY_DESC = "Install an automatic weapon",
    
    -- Adventure Mode crafting
    ADV_CATEGORY_ID = "COMBAT_PROGRAM_AUTOGUN_ADV",
    ADV_CATEGORY_NAME = "Combat Program- Autogun",
    ADV_CATEGORY_DESC = "Innate weapons",
}

