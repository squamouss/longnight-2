-- ======================================================
-- BUFF CONFIG: SPEED
-- ======================================================
return {
    -- ### Base Identifiers ###
    ID_PREFIX = "ENHANCESPEED",
    SECRET_PREFIX = "ENHANCESPEED",
    PAYLOAD_PREFIX = "SPEEDENHANCE",

    -- ### General Naming ###
    BUFF_NAME = "Speed",
    BUFF_NOUN = "speed",
    
    -- ### Acquisition (Tablet/Secret) ###
    ABILITY_ADV_NAME = "Attribute Program- Speed",
    
    ABILITY_VERBS = {
        PRIMARY     = "extrude multiple large thruster rockets on the back and limbs of your body:extrudes multiple large thruster rockets on the back and limbs of their body:NA",
        SECONDARY   = "extrude several large thruster rockets on the back and limbs of your body:extrudes several large thruster rockets on the back and limbs of their body:NA",
        TERTIARY    = "extrude several large thruster rockets on the back your body:extrudes several large thruster rockets on the back of their body:NA",
        QUATERNARY  = "extrude a large thruster rocket on the back your body:extrudes a large thruster rocket on the back of their body:NA"
    },
    
    ABILITY_WAIT_PERIOD = 2400,
    
    -- ### Payload (The Buff Effect) ###
    BUFF_SYNDROME_NAME = "Body Enhancement",
    BUFF_DURATION_TICKS = 10000,

    -- ### Controllable Syndrome Effects ###
    PAYLOAD_EFFECTS = {
        PRIMARY = {
            string.format("[CE_SPEED_CHANGE:SPEED_PERC:500:ABRUPT:START:0:END:%d]", 10000)
        },
        SECONDARY = {
            string.format("[CE_SPEED_CHANGE:SPEED_PERC:400:ABRUPT:START:0:END:%d]", 10000)
        },
        TERTIARY = {
            string.format("[CE_SPEED_CHANGE:SPEED_PERC:300:ABRUPT:START:0:END:%d]", 10000)
        },
        QUATERNARY = {
            string.format("[CE_SPEED_CHANGE:SPEED_PERC:200:ABRUPT:START:0:END:%d]", 10000)
        }
    },

    -- ### Edible Tablet Details ###
    TABLET_TILE = "'#'",
    TABLET_COLOR = "7:11:0",

    -- ### Crafting ###
    FORT_REAGENT_PREFIX = "ITEM_TOOL_TABLET_INCOMPLETE",
    FORT_REAGENT_MATERIAL = "INORGANIC:N_MATTER",
    FORT_BUILDING = "N_MATTER_REFINERY",
    FORT_CATEGORY_ID = "PROGRAM_BODY",
    FORT_CATEGORY_NAME = "Body Programs",
    FORT_CATEGORY_DESC = "Create physical data packets granting users multipliers to various physical attributes.\nAn enhanced body is required to make use of these abilities.",

    ADV_REAGENT_SCRAP = "ITEM_TOOL_SCRAP",
    ADV_REAGENT_MATERIAL = "INORGANIC:N_MATTER",
    ADV_REAGENT_TOOL = "ITEM_TOOL_PORTABLE_SYNTH",
    ADV_SCRAP_COSTS = { PRIMARY = 40, SECONDARY = 20, TERTIARY = 10, QUATERNARY = 5 },
    ADV_CATEGORY_ID = "PROGRAM_BODY_ADV",
    ADV_CATEGORY_NAME = "Body Programs",
    ADV_CATEGORY_DESC = "Attribute enhancers"
}
