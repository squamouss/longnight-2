

return {
    -- ### Base Identifiers ###
    ID_PREFIX = "NANOWEB",
    SECRET_PREFIX = "CONSTRUCTNANOWEB",
    PAYLOAD_PREFIX = "NANOWEB_PAYLOAD",

    -- ### General Naming ###
    WEAPON_NAME = "Nanomachine Webbing",
    SECRET_NAME = "Construct Nanomachine Webbing",
    TABLET_NAME = "Nanomachine Webbing Implant",
    
    -- Weapon Construction
    CONSTRUCT_ADV_NAME = "Construct Nanomachine Webbing",
    CONSTRUCT_VERB = "spin strands from ambient N-matter:spin strands from ambient N-matter:NA",
    CONSTRUCT_WAIT_PERIOD = 200, 

    -- Actual Attack
    PAYLOAD_VERB = "emit tendrils of webbing:emits tendrils of webbing:NA",
    PAYLOAD_PROJECTILE_MAT = "INORGANIC:B_TECH",
    PAYLOAD_PROJECTILE_TYPE = "WEB_SPRAY",
    PAYLOAD_RANGE = 1,
    
    -- Targeting Type
    PAYLOAD_TARGET_TYPE = "TOUCHABLE",
    
    -- Charge Time
    PAYLOAD_TELEGRAPH_TICKS = 2, 
    
    -- Firing Window
    PAYLOAD_WINDOW_DURATION = 9,
    
    -- DWF_STRETCH 
    PAYLOAD_DWF_STRETCH = 10,
    
    -- Shot Cooldowns
    PAYLOAD_COOLDOWNS = {
        NORMAL = 90, 
        LARGE = 60,  
        HUGE = 30,   
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
    FORT_CATEGORY_ID = "COMBAT_PROGRAM_NANOWEB",
    FORT_CATEGORY_NAME = "Combat Programs- Nanomachine Webbing",
    FORT_CATEGORY_DESC = "Install an cannonmatic weapon",
    
    -- Adventure Mode crafting
    ADV_CATEGORY_ID = "COMBAT_PROGRAM_NANOWEB_ADV",
    ADV_CATEGORY_NAME = "Combat Program- Nanomachine Webbing",
    ADV_CATEGORY_DESC = "Innate weapons",
}

