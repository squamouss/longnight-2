return {
    -- ### Base Identifiers ###
    -- Used to build the final raw tokens
    -- e.g., ENHANCEAGILITY_PRIMARY_PROGRAM
    ID_PREFIX = "ENHANCEAGILITY",
    
    -- e.g., ENHANCEAGILITY_PRIMARY_SECRET
    SECRET_PREFIX = "ENHANCEAGILITY",
    
    -- e.g., AGILITYENHANCE_PRIMARY
    PAYLOAD_PREFIX = "AGILITYENHANCE",

    -- ### General Naming ###
    BUFF_NAME = "Agility",
    BUFF_NOUN = "agility", -- For descriptions
    
    -- ### Acquisition (Tablet/Secret) ###
    -- This is the permanent ability the user gets
    ABILITY_ADV_NAME = "Attribute Program- Agility",
    
    -- Verbs for activating the ability (Primary, Secondary, etc.)
    ABILITY_VERBS = {
        PRIMARY     = "extrude many small thruster rockets from all over your body:extrudes many small thruster rockets from all over their body:NA",
        SECONDARY   = "extrude multiple small thruster rockets from all over your body:extrudes multiple small thruster rockets from all over their body:NA",
        TERTIARY    = "extrude multiple small thruster rockets from parts of your body:extrudes multiple small thruster rockets from parts of their body:NA",
        QUATERNARY  = "extrude several small thruster rockets from parts of your body:extrudes several small thruster rockets from parts of their body:NA"
    },
    
    ABILITY_WAIT_PERIOD = 2400,
    
    -- ### Payload (The Buff Effect) ###
    -- This is the temporary syndrome applied by the ability
    BUFF_SYNDROME_NAME = "Body Enhancement",
    BUFF_DURATION_TICKS = 10000,

    -- ====================================================================
    -- ### YOUR NEW REQUIREMENT ###
    -- This table gives you direct control over the syndrome effects.
    -- The generator will insert these lines directly into the
    -- payload interaction's syndrome definition for each level.
    -- You can add any CE_ token here (e.g., CE_ADD_TAG).
    -- ====================================================================
    PAYLOAD_EFFECTS = {
        PRIMARY = {
            string.format("[CE_PHYS_ATT_CHANGE:AGILITY:500:0:START:0:END:%d]", 10000)
            -- e.g., you could add "[CE_ADD_TAG:AGILITY_BOOST_PRIMARY:START:0:END:10000]"
        },
        SECONDARY = {
            string.format("[CE_PHYS_ATT_CHANGE:AGILITY:400:0:START:0:END:%d]", 10000)
        },
        TERTIARY = {
            string.format("[CE_PHYS_ATT_CHANGE:AGILITY:300:0:START:0:END:%d]", 10000)
        },
        QUATERNARY = {
            string.format("[CE_PHYS_ATT_CHANGE:AGILITY:200:0:START:0:END:%d]", 10000)
        }
    },

    -- ### Edible Tablet Details ###
    TABLET_TILE = "'#'",
    TABLET_COLOR = "7:11:0",

    -- ### Crafting ###
    -- Fortress
    FORT_REAGENT_PREFIX = "ITEM_TOOL_TABLET_INCOMPLETE", -- Becomes ITEM_TOOL_TABLET_INCOMPLETE_PRIMARY, etc.
    FORT_REAGENT_MATERIAL = "INORGANIC:N_MATTER",
    FORT_BUILDING = "N_MATTER_REFINERY",
    FORT_CATEGORY_ID = "PROGRAM_BODY",
    FORT_CATEGORY_NAME = "Body Programs",
    FORT_CATEGORY_DESC = "Create physical data packets granting users multipliers to various physical attributes.\nAn enhanced body is required to make use of these abilities.",

    -- Adventure
    ADV_REAGENT_SCRAP = "ITEM_TOOL_SCRAP",
    ADV_REAGENT_MATERIAL = "INORGANIC:N_MATTER",
    ADV_REAGENT_TOOL = "ITEM_TOOL_PORTABLE_SYNTH",
    ADV_SCRAP_COSTS = {
        PRIMARY = 40,
        SECONDARY = 20,
        TERTIARY = 10,
        QUATERNARY = 5
    },
    ADV_CATEGORY_ID = "PROGRAM_BODY_ADV",
    ADV_CATEGORY_NAME = "Body Programs",
    ADV_CATEGORY_DESC = "Attribute enhancers"
}