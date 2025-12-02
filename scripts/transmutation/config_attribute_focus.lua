-- ======================================================
-- BUFF CONFIG: FOCUS
-- ======================================================
return {
    -- ### Base Identifiers ###
    ID_PREFIX = "ENHANCEFOCUS",
    SECRET_PREFIX = "ENHANCEFOCUS",
    PAYLOAD_PREFIX = "FOCUSENHANCE",

    -- ### General Naming ###
    BUFF_NAME = "Focus",
    BUFF_NOUN = "focus",
    
    -- ### Acquisition (Tablet/Secret) ###
    ABILITY_ADV_NAME = "Attribute Program- Focus",
    
    ABILITY_VERBS = {
        PRIMARY     = "manifest four times the amount of eyes on your head:manifests four times the amount of eyes on their head:NA",
        SECONDARY   = "manifest three times the amount of eyes on your head:manifests three times the amount of eyes on their head:NA",
        TERTIARY    = "manifest twice the amount of eyes on your head:manifests twice the amount of eyes on their head:NA",
        QUATERNARY  = "manifest an additional eye on your head:manifests an additional eye on their head:NA"
    },
    
    ABILITY_WAIT_PERIOD = 2400,
    
    -- ### Payload (The Buff Effect) ###
    BUFF_SYNDROME_NAME = "Body Enhancement",
    BUFF_DURATION_TICKS = 10000,

    -- ### Controllable Syndrome Effects ###
    PAYLOAD_EFFECTS = {
        PRIMARY = {
            string.format("[CE_MENT_ATT_CHANGE:FOCUS:500:0:START:0:END:%d]", 10000)
        },
        SECONDARY = {
            string.format("[CE_MENT_ATT_CHANGE:FOCUS:400:0:START:0:END:%d]", 10000)
        },
        TERTIARY = {
            string.format("[CE_MENT_ATT_CHANGE:FOCUS:300:0:START:0:END:%d]", 10000)
        },
        QUATERNARY = {
            string.format("[CE_MENT_ATT_CHANGE:FOCUS:200:0:START:0:END:%d]", 10000)
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
