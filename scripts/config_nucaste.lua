
return {
    -- ============================================================================
    -- Basic Configuration
    -- ============================================================================
    ARCHETYPE_CLASS = "NUCASTE",
    MIN_CREATURES = 20,
    MAX_CREATURES = 50,
    BASE_CREATURE_NAME_PREFIX = "nucaste ID",
    OUTPUT_FILENAME = "generated_nucaste_creatures.txt",
    SAVE_TO_FILE_TOGGLE = true,
    SAVE_PARTIAL_OUTPUT_ON_ERROR = false,
    ENABLE_SIZE_AND_CHILD_GENERATION = true,

    -- ============================================================================
    -- Name & Component Configuration
    -- ============================================================================
    TRANSCENDENT_NAME_ROOT_SINGULAR = "nucaste",
    TRANSCENDENT_NAME_ROOT_PLURAL = "nucastes",

    TRAIT_NAME_MODIFIERS = {
        ["SOPHONT"] = "SPNT",
        ["HOSTILE"] = "HSTL", 
        ["VESSEL"] = "VSSL", 
        ["DEVIANT"] = "DVNT", 
        ["AVATAR"] = "AVTR", 
        ["INCURSION"] = "NCUR", 
		
        ["DANGEROUS"] = "DNGR",
        ["BENIGN"] = "BNGN", 
        ["HAZARDOUS"] = "HZRD", 
        ["PROBLEMATIC"] = "PRBM",
        ["EXISTENTIAL"] = "EXST",  
		
        ["VERMIN"] = "VRMN", 
        ["AMBIENT"] = "AMBT",
		
        ["DOMESTIC"] = "DMST",
        ["VEHICLE"] = "VHCL", 
        ["CARRIER"] = "CRER", 
        ["NOMAD"] = "NMAD", 
        ["WEAPON"] = "WEPN", 
        ["LABOR"] = "LABR", 
        ["SERVANT"] = "SRVT", 
        ["HUNTER"] = "HNTR", 
        ["SANITATION"] = "SNTN", 
        ["PRODUCT"] = "PRDC"
    },

    COMPONENT_TABLES = {
        { name = "component_1", table_key = "procgen_addon_table_1" },
        { name = "component_2", table_key = "procgen_addon_table_2" },
        { name = "component_3", table_key = "procgen_addon_table_3" },
    },

    -- ============================================================================
    -- RAW String Blocks
    -- ============================================================================
    BASE_RAWS = [[
       [COLOR:3:0:0]
        [CREATURE_CLASS:NUCASTE]
        [CREATURE_CLASS:UNPET]
        [CREATURE_CLASS:NOPOWER]
        [CREATURE_CLASS:ORGANIC_VULNERABLE]
		[GENERATED]

    ]],
    
    COMMON_BODY_DETAIL_RAWS = [[
	[SELECT_CASTE:ALL]

        [BODY_DETAIL_PLAN:STANDARD_MATERIALS]
        [BODY_DETAIL_PLAN:STANDARD_TISSUES]
        [BODY_DETAIL_PLAN:VERTEBRATE_TISSUE_LAYERS:SKIN:FAT:MUSCLE:BONE:CARTILAGE]
        [BODY_DETAIL_PLAN:CYBORG_MATERIALS]
        [BODY_DETAIL_PLAN:CYBORG_TISSUES]
        [BODY_DETAIL_PLAN:CYBORG_TISSUE_LAYERS:ENDOSKELETON:TUBE:EXTERIOR]
        [USE_MATERIAL_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [USE_TISSUE_TEMPLATE:NAIL:NAIL_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:FINGER:NAIL:FRONT]
        [TISSUE_LAYER:BY_CATEGORY:TOE:NAIL:FRONT]
        [SELECT_TISSUE_LAYER:HEART:BY_CATEGORY:HEART]
        [PLUS_TISSUE_LAYER:SKIN:BY_CATEGORY:THROAT]
            [TL_MAJOR_ARTERIES]
        [BODY_DETAIL_PLAN:STANDARD_HEAD_POSITIONS]
        [BODY_DETAIL_PLAN:HUMANOID_HEAD_POSITIONS]
        [BODY_DETAIL_PLAN:HUMANOID_RIBCAGE_POSITIONS]
        [BODY_DETAIL_PLAN:HUMANOID_RELSIZES]
        [USE_MATERIAL_TEMPLATE:SINEW:SINEW_TEMPLATE]
        [TENDONS:LOCAL_CREATURE_MAT:SINEW:200]
        [LIGAMENTS:LOCAL_CREATURE_MAT:SINEW:200]
        [HAS_NERVES]
        [USE_MATERIAL_TEMPLATE:BLOOD:BLOOD_TEMPLATE]
        [BLOOD:LOCAL_CREATURE_MAT:BLOOD:LIQUID]
        [CREATURE_CLASS:GENERAL_POISON]
        [GETS_WOUND_INFECTIONS]
        [GETS_INFECTIONS_FROM_ROT]
        [USE_MATERIAL_TEMPLATE:PUS:PUS_TEMPLATE]
        [PUS:LOCAL_CREATURE_MAT:PUS:LIQUID]
        [USE_MATERIAL_TEMPLATE:SWEAT:SWEAT_TEMPLATE]
        [USE_MATERIAL_TEMPLATE:TEARS:TEARS_TEMPLATE]
        [USE_MATERIAL_TEMPLATE:SPIT:SPIT_TEMPLATE]
        [SECRETION:LOCAL_CREATURE_MAT:SWEAT:LIQUID:BY_CATEGORY:ALL:SKIN:EXERTION]
        [SECRETION:LOCAL_CREATURE_MAT:TEARS:LIQUID:BY_CATEGORY:EYE:ALL:EXTREME_EMOTION]
        [BODY_DETAIL_PLAN:HEAD_HAIR_TISSUE_LAYERS]
        [USE_TISSUE_TEMPLATE:EYEBROW:EYEBROW_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:HEAD:EYEBROW:ABOVE:BY_CATEGORY:EYE]
        [USE_TISSUE_TEMPLATE:EYELASH:EYELASH_TEMPLATE]
        [TISSUE_LAYER:BY_CATEGORY:EYELID:EYELASH:FRONT]
        [BODY_DETAIL_PLAN:FACIAL_HAIR_TISSUES]
        [BABY:1]
		
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
                [TISSUE_LAYER_OVER:BY_CATEGORY:ALL:DERMAL]
					
		
        [ATTACK:PUNCH:BODYPART:BY_TYPE:GRASP]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:punch:punches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_FLAG_WITH]
            [ATTACK_PRIORITY:MAIN]
        [ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
            [ATTACK_SKILL:STANCE_STRIKE]
            [ATTACK_VERB:kick:kicks]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PREPARE_AND_RECOVER:4:4]
            [ATTACK_FLAG_WITH]
            [ATTACK_PRIORITY:SECOND]
            [ATTACK_FLAG_BAD_MULTIATTACK]
        [ATTACK:SCRATCH:CHILD_TISSUE_LAYER_GROUP:BY_TYPE:GRASP:BY_CATEGORY:FINGER:NAIL]
            [ATTACK_SKILL:GRASP_STRIKE]
            [ATTACK_VERB:scratch:scratches]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
        [SMELL_TRIGGER:90]
        [HOMEOTHERM:10067]
        [MUNDANE]
        [DIURNAL]
        [MANNERISM_FINGERS:finger:fingers]
        [MANNERISM_NOSE:nose]
        [MANNERISM_EAR:ear]
        [MANNERISM_HEAD:head]
        [MANNERISM_EYES:eyes]
        [MANNERISM_MOUTH:mouth]
        [MANNERISM_HAIR:hair]
        [MANNERISM_KNUCKLES:knuckles]
        [MANNERISM_LIPS:lips]
        [MANNERISM_CHEEK:cheek]
        [MANNERISM_NAILS:nails]
        [MANNERISM_FEET:feet]
        [MANNERISM_ARMS:arms]
        [MANNERISM_HANDS:hands]
        [MANNERISM_TONGUE:tongue]
        [MANNERISM_LEG:leg]
        [MANNERISM_LAUGH]
        [MANNERISM_SMILE]
        [MANNERISM_WALK]
        [MANNERISM_SIT]
        [MANNERISM_BREATH]
        [MANNERISM_POSTURE]
        [MANNERISM_STRETCH]
        [MANNERISM_EYELIDS]
        [SPOUSE_CONVERSION_TARGET]
    ]],

    COMMON_APPEARANCE_RAWS = [[
        [BODY_APPEARANCE_MODIFIER:HEIGHT:75:95:98:100:102:105:125]
            [APP_MOD_IMPORTANCE:500]
        [BODY_APPEARANCE_MODIFIER:BROADNESS:75:95:98:100:102:105:125]
            [APP_MOD_IMPORTANCE:500]
        [SET_BP_GROUP:BY_CATEGORY:EYE]
            [BP_APPEARANCE_MODIFIER:CLOSE_SET:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
            [BP_APPEARANCE_MODIFIER:DEEP_SET:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
            [BP_APPEARANCE_MODIFIER:ROUND_VS_NARROW:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
            [BP_APPEARANCE_MODIFIER:LARGE_IRIS:25:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyes:PLURAL]
                [APP_MOD_DESC_RANGE:30:60:90:110:150:190]
        [SET_BP_GROUP:BY_CATEGORY:NOSE]
            [BP_APPEARANCE_MODIFIER:BROADNESS:25:70:90:100:110:130:200]
                [APP_MOD_DESC_RANGE:30:60:90:110:150:190]
            [BP_APPEARANCE_MODIFIER:LENGTH:25:70:90:100:110:130:200]
                [APP_MOD_DESC_RANGE:30:60:90:110:150:190]
            [BP_APPEARANCE_MODIFIER:UPTURNED:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:CONVEX:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:nose bridge:SINGULAR]
        [SET_BP_GROUP:BY_CATEGORY:EAR]
            [BP_APPEARANCE_MODIFIER:SPLAYED_OUT:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:ears:PLURAL]
            [BP_APPEARANCE_MODIFIER:HANGING_LOBES:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:ears:PLURAL]
            [BP_APPEARANCE_MODIFIER:BROADNESS:90:95:98:100:102:105:110]
                [APP_MOD_IMPORTANCE:700]
                [APP_MOD_NOUN:ears:PLURAL]
                [APP_MOD_DESC_RANGE:91:94:98:102:106:109]
            [BP_APPEARANCE_MODIFIER:HEIGHT:90:95:98:100:102:105:110]
                [APP_MOD_IMPORTANCE:700]
                [APP_MOD_NOUN:ears:PLURAL]
                [APP_MOD_DESC_RANGE:91:94:98:102:106:109]
        [SET_BP_GROUP:BY_CATEGORY:SKULL]
            [BP_APPEARANCE_MODIFIER:HIGH_CHEEKBONES:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:BROAD_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:JUTTING_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:SQUARE_CHIN:0:70:90:100:110:130:200]
        [SET_BP_GROUP:BY_CATEGORY:THROAT]
            [BP_APPEARANCE_MODIFIER:DEEP_VOICE:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:RASPY_VOICE:0:70:90:100:110:130:200]
        [SET_BP_GROUP:BY_CATEGORY:HEAD]
            [BP_APPEARANCE_MODIFIER:BROADNESS:90:95:98:100:102:105:110]
                [APP_MOD_IMPORTANCE:700]
                [APP_MOD_DESC_RANGE:91:94:98:102:106:109]
            [BP_APPEARANCE_MODIFIER:HEIGHT:90:95:98:100:102:105:110]
                [APP_MOD_IMPORTANCE:700]
                [APP_MOD_DESC_RANGE:91:94:98:102:106:109]
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
            [TL_COLOR_MODIFIER:PALE_PINK:1:PINK:1:PALE_TAN:1:TAN:1:DARK_TAN:1:PALE_BROWN:1:BROWN:1:DARK_BROWN:1:YELLOW_BROWN:1:PALE_YELLOW:1]
                [TLCM_NOUN:skin:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:WRINKLY:0:0:0:0:0:0:0]
                [APP_MOD_RATE:1:YEARLY:0:100:40:0:NO_END]
                [APP_MOD_NOUN:skin:SINGULAR]
                [APP_MOD_DESC_RANGE:0:0:0:1:25:50]
				
        [SET_TL_GROUP:BY_CATEGORY:EYE:EYE]
            [TL_COLOR_MODIFIER:IRIS_EYE_BLUE:1:IRIS_EYE_LIGHT_BLUE:1:IRIS_EYE_DARK_BLUE:1:IRIS_EYE_GREEN:1:IRIS_EYE_LIGHT_GREEN:1:IRIS_EYE_DARK_GREEN:1:IRIS_EYE_BROWN:1:IRIS_EYE_LIGHT_BROWN:1:IRIS_EYE_DARK_BROWN:1:IRIS_EYE_GRAY:1]
                [TLCM_NOUN:irises:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
		
        [SET_TL_GROUP:BY_CATEGORY:HEAD:HAIR]
         [PLUS_TL_GROUP:BY_CATEGORY:CHEEK:CHEEK_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD:CHIN_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD:MOUSTACHE]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD:SIDEBURNS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD:EYEBROW]
         [PLUS_TL_GROUP:BY_CATEGORY:EYELID:EYELASH]
                        [TL_COLOR_MODIFIER:BLACK:1:LIGHT_BROWN:1:BROWN:1:DARK_BROWN:1:LIGHT_YELLOW:1:RED_BROWN:1:YELLOW_BROWN:1:WHITE:1:RED:1:BLUE_GRAY:1]
                [TLCM_NOUN:hair:SINGULAR]
            [TL_COLOR_MODIFIER:GRAY:1]
                [TLCM_NOUN:hair:SINGULAR]
                [TLCM_TIMING:ROOT:50:0:90:0]
        [SET_TL_GROUP:BY_CATEGORY:HEAD:EYEBROW]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:LENGTH:50:80:90:100:110:120:150]
                [APP_MOD_NOUN:eyebrows:PLURAL]
                [APP_MOD_DESC_RANGE:55:70:90:110:130:145]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:DENSE:50:80:90:100:110:120:150]
                [APP_MOD_NOUN:eyebrows:PLURAL]
                [APP_MOD_DESC_RANGE:55:70:90:110:130:145]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:HIGH_POSITION:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:eyebrows:PLURAL]
        [SET_TL_GROUP:BY_CATEGORY:EYELID:EYELASH]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:LENGTH:50:80:90:100:110:120:150]
                [APP_MOD_NOUN:eyelashes:PLURAL]
                [APP_MOD_DESC_RANGE:55:70:90:110:130:145]
        [SET_TL_GROUP:BY_CATEGORY:HEAD:HAIR]
         [PLUS_TL_GROUP:BY_CATEGORY:CHEEK:CHEEK_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD:CHIN_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD:MOUSTACHE]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD:SIDEBURNS]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:LENGTH:0:0:0:0:0:0:0]
                [APP_MOD_NOUN:hair:SINGULAR]
                [APP_MOD_RATE:1:DAILY:0:1000:0:0:NO_END]
                [APP_MOD_DESC_RANGE:10:25:75:125:200:300]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:CURLY:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:hair:SINGULAR]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:GREASY:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:hair:SINGULAR]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:DENSE:50:80:90:100:110:120:150]
                [APP_MOD_NOUN:hair:SINGULAR]
                [APP_MOD_DESC_RANGE:55:70:90:110:130:145]
        [SET_TL_GROUP:BY_CATEGORY:HEAD:HAIR]
            [TISSUE_STYLE_UNIT:HAIR:STANDARD_HAIR_SHAPINGS]
                [TSU_NOUN:hair:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD:CHEEK_WHISKERS]
         [PLUS_TL_GROUP:BY_CATEGORY:HEAD:CHIN_WHISKERS]
            [TISSUE_STYLE_UNIT:BEARD:STANDARD_BEARD_SHAPINGS]
                [TSU_NOUN:beard:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD:MOUSTACHE]
            [TISSUE_STYLE_UNIT:MOUSTACHE:STANDARD_MOUSTACHE_SHAPINGS]
                [TSU_NOUN:moustache:SINGULAR]
        [SET_TL_GROUP:BY_CATEGORY:HEAD:SIDEBURNS]
            [TISSUE_STYLE_UNIT:SIDEBURNS:STANDARD_SIDEBURNS_SHAPINGS]
                [TSU_NOUN:sideburns:PLURAL]
    ]],

    -- ============================================================================
    -- Data Tables
    -- ============================================================================
    generic_creature_lore_snippets = {
        "The Nucaste are humans who have broken free from the genetic caste system of the Geno-Autarchic era, breaking down the safeguards and proprietary encoding that limited the self-modification of humans during that time. While some such efforts led to the birth of transhuman elites to rival the hicaste, most merely traded the chains of stagnation for the promise of cancer and instability, requiring regular medical treatments to maintain a healthy life. While the long millenia of the current era have granted them some degree of stability, it was only through the long winnowing of those lineages unable to sustain themselves, and those who survive bear the scars of what was done to see them live through it. ",
    },

    interaction_rating = {
        {
            desc_part = "It is classified as Sophontic; it is an intelligent being capable of reason and metacognition, aligned with human values and psychology. ",
            tok = {[[
            [INTELLIGENT][EQUIPS][CANOPENDOORS][OUTSIDER_CONTROLLABLE][LOCAL_POPS_PRODUCE_HEROES][NIGHT_CREATURE_EXPERIMENTER]
            [BENIGN]
            [CREATURE_CLASS:SOPHONT]
            ]]},
            tags = {"SOPHONT"},
            weight = 5,
            enabled = true
        },
        {
            desc_part = "It is classified as Hostile; while effectively sapient in terms of problem solving skill, its behaviors are dictated by deep-set programming which align it against other sophonts. ",
            tok = {[[
            [INTELLIGENT][EQUIPS][CANOPENDOORS]
            [NIGHT_CREATURE_HUNTER]	
            [LAIR_HUNTER][BIOME:ANY_LAND]
            [LAIR:SIMPLE_BURROW:50]
            [LAIR:SIMPLE_MOUND:50]
            [LAIR:LABYRINTH:25]
            [LAIR:SHRINE:25]
            [LAIR_CHARACTERISTIC:HAS_DOORS:50]
            [HABIT_NUM:TEST_ALL]
            [HABIT:GRIND_BONE_MEAL:50]
            [HABIT:COOK_BLOOD:50]
            [HABIT:GRIND_VERMIN:50]
            [HABIT:COOK_VERMIN:50]
            [HABIT:COOK_PEOPLE:50]
            [HABIT:COLLECT_TROPHIES:50]
            [HABIT:COLLECT_WEALTH:50]
            [HABIT:USE_ANY_MELEE_WEAPON:100]
            [CREATURE_CLASS:HOSTILE]
            [FREQUENCY:5]
            ]]},
            tags = {"HOSTILE"},
            weight = 5
        },
        {
            desc_part = "It is classified as Existential; It represents a threat to entire settlements or even civilizations and cannot be reasoned with. ",
            tok = {[[
            [ATTACK_TRIGGER:3:3:3]
            [BUILDINGDESTROYER:2]
            [FEATURE_BEAST]
            [CREATURE_CLASS:EXISTENTIAL]
            ]]},
            tags = {"EXISTENTIAL"},
            weight = 1,
            enabled = false
        },
        {
            desc_part = "It is classified as Dangerous; it is an active threat to other organisms and will deliberately harm or kill those it comes across, and is capable of and willing to target sophonts. ",
            tok = {[[
            [LARGE_PREDATOR][AMBUSHPREDATOR]
            
            [CREATURE_CLASS:DANGEROUS]
            [FREQUENCY:10]
            ]]},
            tags = {"DANGEROUS"},
            weight = 10,
            enabled = false
        },
        {
            desc_part = "It is classified as Hazardous; it does not deliberately prey on other organisms but will attack any that come near, and may come into conflict with sophonts over mutual food or energy sources. ",
            tok = {[[
            [CURIOUSBEAST_GUZZLER][CURIOUSBEAST_EATER]
            
            [CREATURE_CLASS:HAZARDOUS]
            [FREQUENCY:20]
            ]]},
            tags = {"HAZARDOUS"},
            weight = 20,
            enabled = false
        },
        {
            desc_part = "It is classified as Benign; it avoids conflict and generally does not pose a danger unless in an extreme situation, and will generally avoid the attention of sophonts. ",
            tok = {[[
            [BENIGN]
            [CREATURE_CLASS:BENIGN]
            [FREQUENCY:50]
            ]]},
            tags = {"BENIGN"},
            weight = 40,
            enabled = false
        },
        {
            desc_part = "It is classified as Problematic; it generally avoids violence but may steal supplies, food, or energy stores, and can infiltrate poorly maintained settlements and otherwise cause minor issues. ",
            tok = {[[
            [CURIOUSBEAST_GUZZLER][CURIOUSBEAST_EATER][CURIOUSBEAST_ITEM]
            [TRAPAVOID][MISCHIEVOUS][BENIGN]
            
            [CREATURE_CLASS:PROBLEMATIC]
            [FREQUENCY:30]
            ]]},
            tags = {"PROBLEMATIC"},
            weight = 20,
            enabled = false
        },
        {
            desc_part = "It is classified as Vermin; it is very small but can infest settlements or otherwise inconvenience other organisms. ",
            tok = {[[
            [FISHITEM]
            [CREATURE_CLASS:VERMIN]
            [FREQUENCY:100]
            ]]},
            tags = {"VERMIN"},
            weight = 10,
            enabled = false
        },
        {
            desc_part = "It is classified as Ambient; it is very small and mostly benign. ",
            tok = {[[
            [FISHITEM]
            [CREATURE_CLASS:AMBIENT]
            [FREQUENCY:100]
            ]]},
            tags = {"AMBIENT"},
            weight = 10,
            enabled = false
        }
    },

    generic_body_size_variants = {
        {
            name_part = "MCR",
            desc_part = "APPROX_MASS= %su. ",
            min_raw_size_factor = 1,
            base_adult_size_for_random = 1,
            body_size_index_and_child_count = 0,
            eligible_rating_tags = {"AMBIENT", "VERMIN"},
            size_tags = {"MICRO"}, 
            tok = {[[
            [VERMIN_MICRO]
            [SMALL_REMAINS][VERMIN_HATEABLE]
            [CREATURE_TILE:250]
            [POPULATION_NUMBER:5000:10000]
            ]]}, 
            weight = 10, 
            enabled = false
        },
        {
            name_part = "MNL", 
            desc_part = "APPROX_MASS= %su. ",
            min_raw_size_factor = 10,
            base_adult_size_for_random = 10, 
            body_size_index_and_child_count = 0, 
            eligible_rating_tags = {"AMBIENT", "VERMIN"},
            size_tags = {"MINIMAL"}, 
            tok = {[[
            [VERMIN_GROUNDER]
            [NOT_BUTCHERABLE][SMALL_REMAINS][VERMIN_HATEABLE]
            [CREATURE_TILE:250]
            [POPULATION_NUMBER:1000:2000]
            ]]}, 
            weight = 10, 
            enabled = false
        },
        {
            name_part = "SML", 
            desc_part = "APPROX_MASS= %su. ",
            min_raw_size_factor = 100,
            base_adult_size_for_random = 100,
            body_size_index_and_child_count = 0,
            eligible_rating_tags = {"AMBIENT", "VERMIN", "BENIGN", "PROBLEMATIC"},
            size_tags = {"SMALL"}, 
            tok = {[[
            [VERMIN_GROUNDER]
            [NOT_BUTCHERABLE][SMALL_REMAINS][VERMIN_HATEABLE]
            [CREATURE_TILE:249]
            [POPULATION_NUMBER:500:1000]
            ]]}, 
            weight = 10, 
            enabled = false
        },
        {
            name_part = "LSR", 
            desc_part = "APPROX_MASS= %su. ",
            min_raw_size_factor = 10,
            base_adult_size_for_random = 1000,
            body_size_index_and_child_count = 1,
            eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "SOPHONT", "HOSTILE"},
            size_tags = {"LESSER"}, 
            tok = {[[
            [CREATURE_TILE:'u'][CREATURE_CLASS:SIZE_LESSER]
            
            [POPULATION_NUMBER:250:500]
            ]]}, 
            weight = 30, 
            enabled = false
        },
        {
            name_part = "MDM",
            desc_part = "APPROX_MASS= %su. ",
            min_raw_size_factor = 4000,
            base_adult_size_for_random = 10000,
            body_size_index_and_child_count = 13,
            eligible_rating_tags = {"SOPHONT", "HOSTILE"},
            size_tags = {"MEDIUM"}, 
            weight = 60, 
            favored_size_multiplier_enabled = true, 
			rating_specific_weights = {
				["SOPHONT"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=10, [6]=10, [7]=40, [8]=20, [9]=10 }, 
				["DEVIANT"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=10, [6]=10, [7]=40, [8]=20, [9]=10 }, 
				["HOSTILE"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=10, [6]=10, [7]=40, [8]=20, [9]=10 }, 
				["VESSEL"] =  { [1]=0, [2]=0, [3]=0, [4]=0, [5]=10, [6]=10, [7]=40, [8]=20, [9]=10 }, 
				},
            tok = {[[
            [CREATURE_TILE:'u'][CREATURE_CLASS:SIZE_MEDIUM]
			[CREATURE_SOLDIER_TILE:129]
            
            [POPULATION_NUMBER:50:200]
            [CREATURE_CLASS:NORMALHEAD]
            [CREATURE_CLASS:NORMALARMS]
            [CREATURE_CLASS:NORMALSHOULDERS]
            [CREATURE_CLASS:NORMALHIPS]
            [CREATURE_CLASS:NORMALLEGS]
            [CREATURE_CLASS:NORMALBODY]
            ]]}, 
            enabled = true
        },
        {
            name_part = "LRG", 
            desc_part = "APPROX_MASS= %su. ",
            min_raw_size_factor = 1000,
            base_adult_size_for_random = 100000,
            body_size_index_and_child_count = 10,
            eligible_rating_tags = {"SOPHONT", "HOSTILE"},
            size_tags = {"LARGE"}, 
            weight = 20, 
        favored_size_multiplier_enabled = true,
			rating_specific_weights = {
				["SOPHONT"] = { [1]=90, [2]=80, [3]=70, [4]=60, [5]=50, [6]=40, [7]=30, [8]=20, [9]=10 }, 
				["DEVIANT"] = { [1]=90, [2]=80, [3]=70, [4]=60, [5]=50, [6]=40, [7]=30, [8]=20, [9]=10 }, 
				["HOSTILE"] = { [1]=90, [2]=80, [3]=70, [4]=60, [5]=50, [6]=40, [7]=30, [8]=20, [9]=10 }, 
				["VESSEL"] =  { [1]=90, [2]=80, [3]=70, [4]=60, [5]=50, [6]=40, [7]=30, [8]=20, [9]=10 }, 
				},
            tok = {[[
            [CREATURE_TILE:'U'][CREATURE_CLASS:SIZE_LARGE]
            
            [POPULATION_NUMBER:20:100]
            [CREATURE_CLASS:LARGEHEAD]
            [CREATURE_CLASS:LARGEARMS]
            [CREATURE_CLASS:LARGESHOULDERS]
            [CREATURE_CLASS:LARGEHIPS]
            [CREATURE_CLASS:LARGELEGS]
            [CREATURE_CLASS:LARGEBODY]
            ]]}, 
            enabled = true
        },
        {
            name_part = "HGE",
            desc_part = "APPROX_MASS= %su. ",
            min_raw_size_factor = 10000,
            base_adult_size_for_random = 1000000,
            body_size_index_and_child_count = 15,
            eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "SOPHONT", "HOSTILE", "BENIGN", "EXISTENTIAL"},
            size_tags = {"HUGE"}, 
            tok = {[[
            [CREATURE_TILE:'N'][CREATURE_CLASS:SIZE_HUGE][SAVAGE]
            
            [POPULATION_NUMBER:10:50]
            [CREATURE_CLASS:HUGEHEAD]
            [CREATURE_CLASS:HUGEARMS]
            [CREATURE_CLASS:HUGESHOULDERS]
            [CREATURE_CLASS:HUGEHIPS]
            [CREATURE_CLASS:HUGELEGS]
            [CREATURE_CLASS:HUGEBODY]
            ]]}, 
            weight = 10, 
        favored_size_multiplier_enabled = true,
			rating_specific_weights = {
				["SOPHONT"] = { [1]=90, [2]=80, [3]=70, [4]=60, [5]=50, [6]=40, [7]=30, [8]=20, [9]=10 }, 
				["DEVIANT"] = { [1]=90, [2]=80, [3]=70, [4]=60, [5]=50, [6]=40, [7]=30, [8]=20, [9]=10 }, 
				["HOSTILE"] = { [1]=90, [2]=80, [3]=70, [4]=60, [5]=50, [6]=40, [7]=30, [8]=20, [9]=10 }, 
				["VESSEL"] =  { [1]=90, [2]=80, [3]=70, [4]=60, [5]=50, [6]=40, [7]=30, [8]=20, [9]=10 }, 
				},
            enabled = true
        },
        {
            name_part = "GNT", 
            desc_part = "APPROX_MASS= %su. ",
            min_raw_size_factor = 10000,
            base_adult_size_for_random = 10000000,
            body_size_index_and_child_count = 20,
            eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "HOSTILE", "BENIGN", "EXISTENTIAL"},
            size_tags = {"GIANT"}, 
            tok = {[[
            [CREATURE_TILE:'N'][CREATURE_CLASS:SIZE_GIANT]
            
            [POPULATION_NUMBER:5:10]
            [CREATURE_CLASS:HUGEHEAD]
            [CREATURE_CLASS:HUGEARMS]
            [CREATURE_CLASS:HUGESHOULDERS]
            [CREATURE_CLASS:HUGEHIPS]
            [CREATURE_CLASS:HUGELEGS]
            [CREATURE_CLASS:HUGEBODY]
            ]]}, 
            weight = 2,
            enabled = false
        },
        {
            name_part = "TTN", 
            desc_part = "APPROX_MASS= %su. ",
            min_raw_size_factor = 10000,
            base_adult_size_for_random = 100000000,
            body_size_index_and_child_count = 20,
            eligible_rating_tags = {"EXISTENTIAL"},
            size_tags = {"TITANIC"}, 
            tok = {[[
            [CREATURE_TILE:'N'][CREATURE_CLASS:SIZE_TITAN]
            ]]}, 
            weight = 1,
            enabled = false
        }
    },

    procgen_addon_table_1 = {
        {
            body_token = "HUMANOID_NECK:2EYES:2EARS:NOSE:2LUNGS:HEART:GUTS:ORGANS:HUMANOID_JOINTS:THROAT:NECK:SPINE:BRAIN:SKULL:5FINGERS:5TOES:RIBCAGE:",
            transcendent_body_token = "HUMANOID_NECK:2EYES:HUMANOID_JOINTS:5FINGERS:5TOES:NOSE:2EARS:CORE:", 
            desc_part = "A partially cyberized human with a sickly, near-baseline body with no benefits or detriments, kept alive by the implants which regulate and repair its damaged organs and DNA. ",
            transcendent_desc_part = "A postbiological organism resembling a human in body plan, comprised entirely synthetic tissues derived from N-matter, merging the regenerative powers of biology with the durability and strength of machinery. It has a set of mechanical ports along its spine that can interface with vehicles or cybernetic enhancements, and its body is partially covered with metal plating and cybernetics, density and configuration varying by individual. ",
            eligible_rating_tags = {"SOPHONT", "HOSTILE"},
            eligible_size_tags = {"MEDIUM", "LARGE"}, 
            tok = {[[]]}, 
            weight = 10
        },
        {
            body_token = "HUMANOID_NECK:2EYES:2EARS:NOSE:2LUNGS:HEART:GUTS:ORGANS:HUMANOID_JOINTS:THROAT:NECK:SPINE:BRAIN:SKULL:5FINGERS:5TOES:RIBCAGE:",
            transcendent_body_token = "HUMANOID_NECK:2EYES:HUMANOID_JOINTS:5FINGERS:5TOES:NOSE:2EARS:CORE:", 
            desc_part = "A partially cyberized human with a tumorous, near-baseline body with considerable healing ability but susceptibility to disease, kept alive by the implants which regulate and repair its damaged organs and DNA. ",
            transcendent_desc_part = "A postbiological organism resembling a human in body plan, comprised entirely synthetic tissues derived from N-matter, merging the regenerative powers of biology with the durability and strength of machinery. It has a set of mechanical ports along its spine that can interface with vehicles or cybernetic enhancements, and its body is partially covered with metal plating and cybernetics, density and configuration varying by individual. ",
            eligible_rating_tags = {"SOPHONT", "HOSTILE"},
            eligible_size_tags = {"MEDIUM", "LARGE"}, 
            tok = {[[
			[PHYS_ATT_RANGE:RECUPERATION:450:950:1150:1250:1350:1550:2250]  +
			[PHYS_ATT_RANGE:DISEASE_RESISTANCE:150:600:800:900:1000:1100:1500]  -
			]]}, 
			transcendent_tok = {[[]]}, 
            weight = 5
        },
        {
            body_token = "HUMANOID_NECK:2EYES:2EARS:NOSE:2LUNGS:HEART:GUTS:ORGANS:HUMANOID_JOINTS:THROAT:NECK:SPINE:BRAIN:SKULL:5FINGERS:5TOES:RIBCAGE:",
            transcendent_body_token = "HUMANOID_NECK:2EYES:HUMANOID_JOINTS:5FINGERS:5TOES:NOSE:2EARS:CORE:", 
            desc_part = "A partially cyberized human with a half-decayed, near-baseline body numb to pain but highly fragile, kept alive by the implants which regulate and repair its damaged organs and DNA. ",
            transcendent_desc_part = "A postbiological organism resembling a slim, delicately-bodied baseline human in body plan, comprised entirely synthetic tissues derived from N-matter, merging the regenerative powers of biology with the durability and strength of machinery. It has a set of mechanical ports along its spine that can interface with vehicles or cybernetic enhancements, and its body is partially covered with metal plating and cybernetics, density and configuration varying by individual. ",
            eligible_rating_tags = {"SOPHONT", "HOSTILE"},
            eligible_size_tags = {"MEDIUM", "LARGE"}, 
            tok = {[[
			[NOPAIN]
			[PHYS_ATT_RANGE:AGILITY:150:600:800:900:1000:1100:1500]   -
			[PHYS_ATT_RANGE:TOUGHNESS:150:600:800:900:1000:1100:1500]   -
			]]}, 
			transcendent_tok = {[[]]}, 
            weight = 5
        }
    },

    procgen_addon_table_2 = {         
			{
                body_token = "",
                desc_part = "It has the body of a homeworlder human, descending from those minimally modified by the Solar Empire. Metal studs, tubes, and plates are grafted onto its body, part of the cybernetic organ system keeping it alive. ",
				transcendent_desc_part = "It is riddled with asymmetrical studs and plates, decorative remnants of its past life. ",
                eligible_rating_tags = {"SOPHONT", "HOSTILE"},
                eligible_size_tags = {"MEDIUM", "LARGE"}, 
				tok = {[[
				[SWIMS_LEARNED]
				[PHYS_ATT_RANGE:RECUPERATION:450:950:1150:1250:1350:1550:2250]
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900]
				]]}, 
				transcendent_tok = {[[]]}, 
                weight = 50
            },
            {
                body_token = "",
                desc_part = "It has a barrel chest and strong lungs, with high endurance; the descendant of those grown for low-oxygen environments on partially terraformed moons and planets, such as Mars or Venus. Metal studs, tubes, and plates are grafted onto its body, part of the cybernetic organ system keeping it alive. ",
				transcendent_desc_part = "It has a barrel chest and thick abdominal plating. It is riddled with asymmetrical studs and plates, decorative remnants of its past life.",
                eligible_rating_tags = {"SOPHONT", "HOSTILE"},
                eligible_size_tags = {"MEDIUM", "LARGE"}, 
				tok = {[[
				[SWIMS_LEARNED]
				[PHYS_ATT_RANGE:ENDURANCE:450:950:1150:1250:1350:1550:2250]
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900]
				]]}, 
				transcendent_tok = {[[]]}, 
                weight = 5
            },
            {
                body_token = "",
                desc_part = "It has an elongated, thin body and has excellent sense of space and direction; the descendant of those grown for low or zero-G environments such as space stations or asteroid colonies. Metal studs, tubes, and plates are grafted onto its body, part of the cybernetic organ system keeping it alive. ",
				transcendent_desc_part = "It has an elongated, graceful body and limbs. It is riddled with asymmetrical studs and plates, decorative remnants of its past life.",
                eligible_rating_tags = {"SOPHONT", "HOSTILE"},
                eligible_size_tags = {"MEDIUM", "LARGE"}, 
                tok = {[[
				[SWIMS_LEARNED]
				[MENT_ATT_RANGE:SPATIAL_SENSE:450:950:1150:1250:1350:1550:2250]
				[MENT_ATT_RANGE:KINESTHETIC_SENSE:450:950:1150:1250:1350:1550:2250]
				[PHYS_ATT_RANGE:STRENGTH:150:600:800:900:1000:1100:1500]
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900]
				]]},
				transcendent_tok = {[[]]}, 
                weight = 5
            },
            {
                body_token = "",
                desc_part = "It is squat, muscular, and thick-bodied; the descendant of those grown for harsh gravity or cramped environments. Metal studs, tubes, and plates are grafted onto its body, part of the cybernetic organ system keeping it alive. ",
				transcendent_desc_part = "It is short and thick-bodied, with broad limbs. It is riddled with asymmetrical studs and plates, decorative remnants of its past life.",
                eligible_rating_tags = {"SOPHONT", "HOSTILE"},
                eligible_size_tags = {"MEDIUM", "LARGE"}, 
                tok = {[[
				[SWIMS_LEARNED]
				[PHYS_ATT_RANGE:STRENGTH:450:950:1150:1250:1350:1550:2250]
				[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:5341:4723:4112:1254:6433:7900]
				]]},
				transcendent_tok = {[[]]}, 
                weight = 5
            }
    },
    
    procgen_addon_table_3 = {         
			{
                body_token = "MOUTH:TONGUE:FACIAL_FEATURES:TEETH:", 
                transcendent_body_token = "MOUTH:TONGUE:FACIAL_FEATURES:TEETH2:", 
                desc_part = "It has no particular enhancements, relying on its basic systems to survive without any major benefits or drawbacks. ",
				transcendent_desc_part = "",
                eligible_rating_tags = {"SOPHONT", "HOSTILE"},
                eligible_size_tags = {"MEDIUM", "LARGE"}, 
                tok = {[[
                   [DIURNAL]
				   [APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:711:521:293:1900:2900]  30 kph
        [ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
            [ATTACK_SKILL:BITE]
            [ATTACK_VERB:bite:bites]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
            [ATTACK_FLAG_CANLATCH]
			
        [SET_BP_GROUP:BY_CATEGORY:TOOTH]
            [BP_APPEARANCE_MODIFIER:GAPS:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:teeth:PLURAL]
        [SET_BP_GROUP:BY_CATEGORY:LIP]
            [BP_APPEARANCE_MODIFIER:THICKNESS:50:70:90:100:110:130:200]
                [APP_MOD_NOUN:lips:PLURAL]
                [APP_MOD_DESC_RANGE:55:70:90:110:150:190]
                ]]},
                transcendent_tok = {[[]]}, 
                weight = 50 
            },
            {
                body_token = "MOUTH:TONGUE:FACIAL_FEATURES:TEETH:", 
                transcendent_body_token = "MOUTH:TONGUE:FACIAL_FEATURES:TEETH2:", 
                desc_part = "Additional filtration augments allow it to survive off of alcohol alone, though it invariably becomes addicted. ",
				transcendent_desc_part = "Short cylinders emerge from its back, storing excess energy. ",
                eligible_rating_tags = {"SOPHONT", "HOSTILE"},
                eligible_size_tags = {"MEDIUM", "LARGE"}, 
                tok = {[[
                   [DIURNAL]
                    [ALCOHOL_DEPENDENT]
				   [APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:711:521:293:1900:2900]  30 kph
        [ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
            [ATTACK_SKILL:BITE]
            [ATTACK_VERB:bite:bites]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
            [ATTACK_FLAG_CANLATCH]
			
        [SET_BP_GROUP:BY_CATEGORY:TOOTH]
            [BP_APPEARANCE_MODIFIER:GAPS:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:teeth:PLURAL]
        [SET_BP_GROUP:BY_CATEGORY:LIP]
            [BP_APPEARANCE_MODIFIER:THICKNESS:50:70:90:100:110:130:200]
                [APP_MOD_NOUN:lips:PLURAL]
                [APP_MOD_DESC_RANGE:55:70:90:110:150:190]
                ]]},
                transcendent_tok = {[[]]}, 
                weight = 10 
            },
            {
                body_token = "EYELIDS:CHEEKS", 
                transcendent_body_token = "EYELIDS:CHEEKS:MOUTH:TEETH2", 
                desc_part = "The lower part of its face is replaced by a grafted filtration mask, allowing it to survive without air and granting immunity to toxic chemicals. ",
				transcendent_desc_part = "Its lower face is a lipless metal skull. ",
                eligible_rating_tags = {"SOPHONT", "HOSTILE"},
                eligible_size_tags = {"MEDIUM", "LARGE"}, 
                tok = {[[
                   [DIURNAL]
                    [NOBREATHE]
                [PHYS_ATT_RANGE:DISEASE_RESISTANCE:0:100:200:300:400:450:500]
				   [APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:711:521:293:1900:2900]  30 kph
                ]]},
                transcendent_tok = {[[]]}, 
                weight = 10 
            },
            {
                body_token = "MOUTH:TONGUE:FACIAL_FEATURES:TEETH:", 
                transcendent_body_token = "MOUTH:TONGUE:FACIAL_FEATURES:TEETH2:", 
                desc_part = "A spindly powered exoskeleton is grafted to its limbs, spine, and joints, growing out of its skin like metallic bones, granting considerable strength but greatly lowering agility. ",
				transcendent_desc_part = "It possesses a powerful, muscular frame. ",
                eligible_rating_tags = {"SOPHONT", "HOSTILE"},
                eligible_size_tags = {"MEDIUM", "LARGE"}, 
                tok = {[[
					[PHYS_ATT_RANGE:STRENGTH:700:1200:1400:1500:1600:1800:2500]    ++
					[PHYS_ATT_RANGE:AGILITY:0:100:200:300:400:450:500]
                   [DIURNAL]
				   [APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:711:521:293:1900:2900]  30 kph
        [ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
            [ATTACK_SKILL:BITE]
            [ATTACK_VERB:bite:bites]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
            [ATTACK_FLAG_CANLATCH]
			
        [SET_BP_GROUP:BY_CATEGORY:TOOTH]
            [BP_APPEARANCE_MODIFIER:GAPS:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:teeth:PLURAL]
        [SET_BP_GROUP:BY_CATEGORY:LIP]
            [BP_APPEARANCE_MODIFIER:THICKNESS:50:70:90:100:110:130:200]
                [APP_MOD_NOUN:lips:PLURAL]
                [APP_MOD_DESC_RANGE:55:70:90:110:150:190]
                ]]},
                transcendent_tok = {[[]]}, 
                weight = 10 
            },
            {
                body_token = "MOUTH:TONGUE:FACIAL_FEATURES:TEETH:", 
                transcendent_body_token = "MOUTH:TONGUE:FACIAL_FEATURES:TEETH2:", 
                desc_part = "It has glowing mechanical eyes which allow it to see in the dark. ",
				transcendent_desc_part = "Prominent pinpricks of light flicker in its pupils. ",
                eligible_rating_tags = {"SOPHONT", "HOSTILE"},
                eligible_size_tags = {"MEDIUM", "LARGE"}, 
                tok = {[[
                    [NOCTURNAL][CAVE_ADAPT]
                    [LOW_LIGHT_VISION:10000]
				   [APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:711:521:293:1900:2900]  30 kph
        [ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
            [ATTACK_SKILL:BITE]
            [ATTACK_VERB:bite:bites]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
            [ATTACK_FLAG_CANLATCH]
			
        [SET_BP_GROUP:BY_CATEGORY:TOOTH]
            [BP_APPEARANCE_MODIFIER:GAPS:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:teeth:PLURAL]
        [SET_BP_GROUP:BY_CATEGORY:LIP]
            [BP_APPEARANCE_MODIFIER:THICKNESS:50:70:90:100:110:130:200]
                [APP_MOD_NOUN:lips:PLURAL]
                [APP_MOD_DESC_RANGE:55:70:90:110:150:190]
                ]]},
                transcendent_tok = {[[]]}, 
                weight = 10
            },
            {
                body_token = "MOUTH:TONGUE:FACIAL_FEATURES:TEETH:", 
                transcendent_body_token = "MOUTH:TONGUE:FACIAL_FEATURES:TEETH2:", 
                desc_part = "It has disproportionately long limbs, granting greater swiftness. ",
				transcendent_desc_part = "Its limbs are disproportionately long. ",
                eligible_rating_tags = {"SOPHONT", "HOSTILE"},
                eligible_size_tags = {"MEDIUM", "LARGE"}, 
                tok = {[[
                    [DIURNAL]
				   [APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:657:438:219:1900:2900]  40 kph
        [ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
            [ATTACK_SKILL:BITE]
            [ATTACK_VERB:bite:bites]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
            [ATTACK_FLAG_CANLATCH]
			
        [SET_BP_GROUP:BY_CATEGORY:TOOTH]
            [BP_APPEARANCE_MODIFIER:GAPS:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:teeth:PLURAL]
        [SET_BP_GROUP:BY_CATEGORY:LIP]
            [BP_APPEARANCE_MODIFIER:THICKNESS:50:70:90:100:110:130:200]
                [APP_MOD_NOUN:lips:PLURAL]
                [APP_MOD_DESC_RANGE:55:70:90:110:150:190]
                ]]},
                transcendent_tok = {[[]]}, 
                weight = 10
            },
            {
                body_token = "MOUTH:TONGUE:FACIAL_FEATURES:TEETH:", 
                transcendent_body_token = "MOUTH:TONGUE:FACIAL_FEATURES:TEETH2:", 
                desc_part = "Additional computing software is grafted to its spine and the back of its skull, granting additional mental ability at the cost of physical weakness. ",
				transcendent_desc_part = "It possesses a powerful, muscular frame. ",
                eligible_rating_tags = {"SOPHONT", "HOSTILE"},
                eligible_size_tags = {"MEDIUM", "LARGE"}, 
                tok = {[[
				[MENT_ATT_RANGE:ANALYTICAL_ABILITY:450:950:1150:1250:1350:1550:2250]               +
				[MENT_ATT_RANGE:FOCUS:450:950:1150:1250:1350:1550:2250]               +
				[MENT_ATT_RANGE:MEMORY:450:950:1150:1250:1350:1550:2250]               +
				[MENT_ATT_RANGE:INTUITION:450:950:1150:1250:1350:1550:2250]               +
				[MENT_ATT_RANGE:FOCUS:450:950:1150:1250:1350:1550:2250]               +
				[MENT_ATT_RANGE:LINGUISTIC_ABILITY:450:950:1150:1250:1350:1550:2250]               +
				[PHYS_ATT_RANGE:STRENGTH:0:400:600:750:800:900:1100]                   --
				[PHYS_ATT_RANGE:ENDURANCE:0:400:600:750:800:900:1100]                   -- 
                   [DIURNAL]
				   [APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:711:521:293:1900:2900]  30 kph
        [ATTACK:BITE:CHILD_BODYPART_GROUP:BY_CATEGORY:HEAD:BY_CATEGORY:TOOTH]
            [ATTACK_SKILL:BITE]
            [ATTACK_VERB:bite:bites]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
            [ATTACK_FLAG_CANLATCH]
			
        [SET_BP_GROUP:BY_CATEGORY:TOOTH]
            [BP_APPEARANCE_MODIFIER:GAPS:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:teeth:PLURAL]
        [SET_BP_GROUP:BY_CATEGORY:LIP]
            [BP_APPEARANCE_MODIFIER:THICKNESS:50:70:90:100:110:130:200]
                [APP_MOD_NOUN:lips:PLURAL]
                [APP_MOD_DESC_RANGE:55:70:90:110:150:190]
                ]]},
                transcendent_tok = {[[]]}, 
                weight = 10 
            }
        },
		
    -- ============================================================================
    -- Flowchart Data
    -- ============================================================================
    flowchart_data = {
   
      
    },
    
    -- ============================================================================
    -- RESTRUCTURED: Non-Sophont Caste Data
    -- ============================================================================
    non_sophont_caste_groups = {
        {
            castes = {
                {
                    tokens = [[
					[CASTE:FEMALE][FEMALE][CREATURE_CLASS:NUCASTE_FEMALE]
					]],
                    description_addon = ""
                },
                {
                    tokens = [[
					[CASTE:MALE][MALE][CREATURE_CLASS:NUCASTE_MALE]
					]],
                    description_addon = ""
                }
            },
            shared_tokens = [[
			[SELECT_CASTE:ALL][POP_RATIO:100]
			[SET_BP_GROUP:BY_TYPE:LOWERBODY][BP_ADD_TYPE:GELDABLE]
			]],
            weight = 100,
				eligible_rating_tags = {"SOPHONT", "HOSTILE"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
                }
            },
			
	-- ============================================================================
    -- CASTE FUNCTION RULES
    -- ============================================================================
    generate_caste_raws = function(config, components, lines, final_mass, utils)

        local compatible_castes = utils.filter_components_by_tags(
            config.non_sophont_caste_groups, 
            components.creature_tags, 
            components.size_variant.size_tags or {}
        )
        local chosen_caste_group = utils.pick_random(compatible_castes)
        
        if chosen_caste_group and chosen_caste_group.castes then
            -- This is your NEW logic. It is being preserved.
            -- A specific caste group was found (e.g., for Sophonts or a specific non-sophont)
            local body_str = utils.body_string_constructor(config, components, "non_sophont")
            for _, caste_def in ipairs(chosen_caste_group.castes) do
                local caste_desc = utils.description_constructor(config, components, final_mass, caste_def.description_addon, true, "non_sophont")
                utils.split_to_lines(lines, caste_def.tokens)
                utils.split_to_lines(lines, "[DESCRIPTION:" .. caste_desc .. "]")
                utils.split_to_lines(lines, body_str)
            end
            if chosen_caste_group.shared_tokens then
                utils.split_to_lines(lines, chosen_caste_group.shared_tokens)
            end

            -- This is part of your NEW logic.
            return chosen_caste_group.shared_descriptor_tokens
        else
            -- [[ START: FIXED FALLBACK BLOCK WITH WARNING ]]
            
            -- Grab the log function (print if _G.log isn't available)
            local log_func = _G.log or print
            
            -- Build the specific warning message
            local rating_tag = (components.rating and components.rating.tags and components.rating.tags[1]) or "UNKNOWN_RATING"
            local size_tags = (components.size_variant and components.size_variant.size_tags and table.concat(components.size_variant.size_tags, ", ")) or "NO_SIZE_TAGS"
            local log_prefix = (config and config.ARCHETYPE_CLASS or "UNKNOWN_CONFIG") .. "_GENERATOR_LOG"
            
            log_func(log_prefix .. ": CASTE WARNING - Using fallback caste generation. No specific caste group was found for Rating: [" .. rating_tag .. "] and Size Tags: [" .. size_tags .. "].")

            -- This is the working fallback code from your older config_biomachine.lua file.
            -- It will now correctly generate a male/female pair.
            local body_str = utils.body_string_constructor(config, components, "non_sophont")
            local female_desc = utils.description_constructor(config, components, final_mass, "", true, "non_sophont")
            utils.split_to_lines(lines, "[CASTE:FEMALE][FEMALE]")
            utils.split_to_lines(lines, "[DESCRIPTION:" .. female_desc .. "]")
            utils.split_to_lines(lines, body_str)

            local male_desc = utils.description_constructor(config, components, final_mass, "", true, "non_sophont")
            utils.split_to_lines(lines, "[CASTE:MALE][MALE]")
            utils.split_to_lines(lines, "[DESCRIPTION:" .. male_desc .. "]")
            utils.split_to_lines(lines, body_str)
            -- [[ END: FIXED FALLBACK BLOCK ]]
        end

        -- This is part of your NEW logic.
        return nil
    end,
}