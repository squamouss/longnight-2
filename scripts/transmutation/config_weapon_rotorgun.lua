

return {
    -- ### Base Identifiers ###
    ID_PREFIX = "ROTORGUN",
    SECRET_PREFIX = "CONSTRUCTROTORGUN",
    PAYLOAD_PREFIX = "ROTORGUN_PAYLOAD",

    -- ### General Naming ###
    WEAPON_NAME = "Rotorgun",
    SECRET_NAME = "Construct Rotorgun",
    TABLET_NAME = "Rotorgun Implant",
    
    -- Weapon Construction
    CONSTRUCT_ADV_NAME = "Construct Rotorgun",
    CONSTRUCT_VERB = "construct a rotorgun from ambient N-matter:constructs a rotorgun from ambient N-matter:NA",
    CONSTRUCT_WAIT_PERIOD = 200, 

    -- Actual Attack
    PAYLOAD_VERB = "fire your rotorgun:fire your rotorgun:NA",
    PAYLOAD_PROJECTILE_MAT = "INORGANIC:M_TECH_BULLET",
    PAYLOAD_PROJECTILE_TYPE = "SOLID_GLOB",
    PAYLOAD_RANGE = 100,
    
    -- Targeting Type
    PAYLOAD_TARGET_TYPE = "LINE_OF_SIGHT",
    
    -- Charge Time
    PAYLOAD_TELEGRAPH_TICKS = 2, 
    
    -- Firing Window
    PAYLOAD_WINDOW_DURATION = 3,
    
    -- DWF_STRETCH 
    PAYLOAD_DWF_STRETCH = 10,
    
    -- Shot Cooldowns
    PAYLOAD_COOLDOWNS = {
        NORMAL = 3, 
        LARGE = 2,  
        HUGE = 1,   
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
    FORT_CATEGORY_ID = "COMBAT_PROGRAM_ROTORGUN",
    FORT_CATEGORY_NAME = "Combat Programs- Rotorgun",
    FORT_CATEGORY_DESC = "Install an automatic weapon",
    
    -- Adventure Mode crafting
    ADV_CATEGORY_ID = "COMBAT_PROGRAM_ROTORGUN_ADV",
    ADV_CATEGORY_NAME = "Combat Program- Rotorgun",
    ADV_CATEGORY_DESC = "Innate weapons",
}

