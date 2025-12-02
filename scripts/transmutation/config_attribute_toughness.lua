-- ======================================================
-- BUFF CONFIG: TOUGHNESS
-- ======================================================
return {
    -- ### Base Identifiers ###
    ID_PREFIX = "ENHANCETOUGHNESS",
    SECRET_PREFIX = "ENHANCETOUGHNESS",
    PAYLOAD_PREFIX = "TOUGHNESSENHANCE",

    -- ### General Naming ###
    BUFF_NAME = "Toughness",
    BUFF_NOUN = "toughness",
    
    -- ### Acquisition (Tablet/Secret) ###
    ABILITY_ADV_NAME = "Attribute Program- Toughness",
    
    ABILITY_VERBS = {
        PRIMARY     = "are covered by thick slabs of metal that obscure your original form:are covered by thick slabs of metal that obscures their original form:NA",
        SECONDARY   = "are covered by thick slabs of metal adhering to your body:is covered by thick slabs of metal adhering to their body:NA",
        TERTIARY    = "are covered by thin segments of metal adhering to your body:are covered by thin segments of metal adhering to their body:NA",
        QUATERNARY  = "are partially covered by thin segments of metal adhering to your body:are partially covered by thin segments of metal adhering to their body:NA"
    },
    
    ABILITY_WAIT_PERIOD = 2400,
    
    -- ### Payload (The Buff Effect) ###
    BUFF_SYNDROME_NAME = "Body Enhancement",
    BUFF_DURATION_TICKS = 10000,

    -- ### Controllable Syndrome Effects ###
    PAYLOAD_EFFECTS = {
        PRIMARY = {
            string.format("[CE_PHYS_ATT_CHANGE:TOUGHNESS:500:0:START:0:END:%d]", 10000)
        },
        SECONDARY = {
            string.format("[CE_PHYS_ATT_CHANGE:TOUGHNESS:400:0:START:0:END:%d]", 10000)
        },
        TERTIARY = {
            string.format("[CE_PHYS_ATT_CHANGE:TOUGHNESS:300:0:START:0:END:%d]", 10000)
        },
        QUATERNARY = {
            string.format("[CE_PHYS_ATT_CHANGE:TOUGHNESS:200:0:START:0:END:%d]", 10000)
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
