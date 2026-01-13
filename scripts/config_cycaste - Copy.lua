
return {
    -- ============================================================================
    -- Basic Configuration
    -- ============================================================================
    ARCHETYPE_CLASS = "CYCASTE",
    MIN_CREATURES = 20,
    MAX_CREATURES = 50,
    BASE_CREATURE_NAME_PREFIX = "cycaste ID",
    OUTPUT_FILENAME = "generated_cycaste_creatures.txt",
    SAVE_TO_FILE_TOGGLE = true,
    SAVE_PARTIAL_OUTPUT_ON_ERROR = true,
    ENABLE_SIZE_AND_CHILD_GENERATION = true,

    -- ============================================================================
    -- Name & Component Configuration
    -- ============================================================================
    TRANSCENDENT_NAME_ROOT_SINGULAR = "cycaste",
    TRANSCENDENT_NAME_ROOT_PLURAL = "cycastes",

    TRAIT_NAME_MODIFIERS = {
        ["SOPHONT"] = "SPNT",
        ["HOSTILE"] = "HSTL", 
        ["VESSEL"] = "VSSL", 
        ["DEVIANT"] = "DVNT", 
        ["AVATAR"] = "AVTR", 
        ["INCURSION"] = "NCUR", 
		
    },

    COMPONENT_TABLES = {
        { name = "component_sub_archetype", table_key = "procgen_table_sub_archetype" }
    },

    -- ============================================================================
    -- RAW String Blocks
    -- ============================================================================
    BASE_RAWS = [[
            [COLOR:3:0:0]
        [CREATURE_CLASS:CYCASTE]
        [CREATURE_CLASS:UNPET]
        [CREATURE_CLASS:NOPOWER]
        

    ]],
    
    COMMON_BODY_DETAIL_RAWS = [[
	[SELECT_CASTE:ALL]

          [BODY_DETAIL_PLAN:STANDARD_MATERIALS]
        [BODY_DETAIL_PLAN:STANDARD_TISSUES]
        [BODY_DETAIL_PLAN:VERTEBRATE_TISSUE_LAYERS:SKIN:FAT:MUSCLE:BONE:CARTILAGE]
        [BODY_DETAIL_PLAN:CYBORG_MATERIALS]
        [BODY_DETAIL_PLAN:CYBORG_TISSUES]
        [BODY_DETAIL_PLAN:CYBORG_TISSUE_LAYERS:ENDOSKELETON:TUBE:EXTERIOR]
	
        [BODY_DETAIL_PLAN:STANDARD_HEAD_POSITIONS]
        [BODY_DETAIL_PLAN:HUMANOID_HEAD_POSITIONS]
        [BODY_DETAIL_PLAN:HUMANOID_RIBCAGE_POSITIONS]
        [BODY_DETAIL_PLAN:HUMANOID_RELSIZES]
		
        [USE_MATERIAL_TEMPLATE:BLOOD:COOLANT_TEMPLATE]
        [BLOOD:LOCAL_CREATURE_MAT:BLOOD:LIQUID]
		
		[AMPHIBIOUS]
			[LOW_LIGHT_VISION:10000]
			
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
			
        [SMELL_TRIGGER:90]
        [HOMEOTHERM:10067]
        [MUNDANE]
        [DIURNAL]
    ]],

    COMMON_APPEARANCE_RAWS = [[
        [BODY_APPEARANCE_MODIFIER:HEIGHT:75:95:98:100:102:105:125]
            [APP_MOD_IMPORTANCE:500]
        [BODY_APPEARANCE_MODIFIER:BROADNESS:75:95:98:100:102:105:125]
            [APP_MOD_IMPORTANCE:500]
			
        [SET_BP_GROUP:BY_CATEGORY:HEAD_ROBOT]
            [BP_APPEARANCE_MODIFIER:HIGH_CHEEKBONES:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:BROAD_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:JUTTING_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:SQUARE_CHIN:0:70:90:100:110:130:200]
			
        [SET_BP_GROUP:BY_CATEGORY:HEAD_ROBOT]
            [BP_APPEARANCE_MODIFIER:DEEP_VOICE:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:RASPY_VOICE:0:70:90:100:110:130:200]
				
				
        [SET_TL_GROUP:BY_CATEGORY:EYE_ROBOT:ENDOSKELETON]
			[TL_COLOR_MODIFIER:IRIS_EYE_WHITE:1:IRIS_EYE_WHITE:1:IRIS_EYE_WHITE:1:IRIS_EYE_PINK:1:IRIS_EYE_RED:1:IRIS_EYE_BLUE:1:IRIS_EYE_YELLOW:1:IRIS_EYE_GREEN:1:IRIS_EYE_PURPLE:1:IRIS_EYE_ORANGE:1]
                [TLCM_NOUN:ocular lights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
    ]],

    -- ============================================================================
    -- Data Tables
    -- ============================================================================
    generic_creature_lore_snippets = {
        "_______________________________________________________ __________/HISTORY = The cycaste represents the pinnacle of pan-human evolution before the precipice of total assimilation with the hypertechnological transcendence of N-matter. Vestigial biology commanding mechanized bodies powerful enough to contend with the technosystem, they proliferate within caste societies as rulers, weapons, and living tools, serving as an aspiration for many who seek strength and immortality but are unwilling to discard everything in pursuit of it, or simply desire a body freed from the limitations imposed on them by their ancient designers.  _______________________________________________________ __________",
    },


    interaction_rating = {
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Sophontic; it is an intelligent being capable of reason and metacognition, aligned with human values and psychology. ",
            tok = {[[
            [INTELLIGENT][EQUIPS][CANOPENDOORS][OUTSIDER_CONTROLLABLE][LOCAL_POPS_PRODUCE_HEROES][NIGHT_CREATURE_EXPERIMENTER][BIOME:ANY_RIVER]
            
            [CREATURE_CLASS:SOPHONT]            [COLOR:3:0:0]

                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
			[BIOME:ANY_LAND]
					
            ]]},
            tags = {"SOPHONT"},
            weight = 10,
            enabled = true
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Hostile; while effectively sapient in terms of problem solving skill, its behaviors are dictated by deep-set programming which align it against other sophonts. ",
            tok = {[[
			            [COLOR:5:0:0]
            [INTELLIGENT][EQUIPS][CANOPENDOORS]
			[SAVAGE]
            [NIGHT_CREATURE_HUNTER]	
            [LAIR_HUNTER]
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
            [FREQUENCY:1]
			[SPOUSE_CONVERTER]
			[CONVERTED_SPOUSE]
			
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY2]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
                [TISSUE_LAYER_OVER:BY_CATEGORY:ALL:DERMAL]
			
            ]]},
            tags = {"HOSTILE"},
            weight = 10,
            enabled = true
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as Deviant; it is an intelligent being capable of reason and metacognition, but has abandoned or lost human values and psychology in favor of competitiveness within the technosystem. ",
				attribute_weight = { 
				WILLPOWER = "+", 
				INTUITION = "+", 
				TOUGHNESS = "+", 
				ENDURANCE = "+", 
				SOCIAL_AWARENESS = "--", 
				EMPATHY = "--", 
				LINGUISTIC_ABILITY = "--", 
				MUSICALITY = "---"
				},
            tok = {[[
            [INTELLIGENT][EQUIPS][CANOPENDOORS][OUTSIDER_CONTROLLABLE][LOCAL_POPS_PRODUCE_HEROES][NIGHT_CREATURE_EXPERIMENTER][BIOME:ANY_RIVER]
            
            [CREATURE_CLASS:DEVIANT]            [COLOR:3:0:0]
			[BIOME:ANY_LAND]
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]

            ]]},
            tags = {"DEVIANT"},
            weight = 15,
            enabled = true
        },
        {
            desc_part = "_______________________________________________________ __________/RATING = It is classified as an Avatar; it is a host body of a powerful hyperintelligence of the Datasphere or a sophont that ascended to that level. ",
				attribute_weight = { 
				WILLPOWER = "+", 
				INTUITION = "+", 
				SOCIAL_AWARENESS = "+", 
				EMPATHY = "+", 
				LINGUISTIC_ABILITY = "+"
				},
            tok = {[[
            [INTELLIGENT][CANOPENDOORS]
            [CREATURE_CLASS:AVATAR]            [COLOR:3:0:0][NIGHT_CREATURE_EXPERIMENTER]
			[BIOME:ANY_LAND]	
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]

            ]]},
            tags = {"AVATAR"},
            weight = 1,
            enabled = true
        }
    },


    generic_body_size_variants = {
    {
        name_part = "MCR",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        min_raw_size_factor = 1,
        base_adult_size_for_random = 1,
        body_size_index_and_child_count = 1,
        eligible_rating_tags = {"AMBIENT"},
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
        name_part = "MCR",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        min_raw_size_factor = 1,
        base_adult_size_for_random = 1,
        body_size_index_and_child_count = 1,
        eligible_rating_tags = {"VERMIN"},
        size_tags = {"MICRO"},
        tok = {[[
		[VERMIN_MICRO]
		[NOT_BUTCHERABLE][SMALL_REMAINS][VERMIN_HATEABLE]
		[CREATURE_TILE:250]
		[POPULATION_NUMBER:2500:5000]
		]]},
        weight = 10,
        enabled = false
    },
    {
        name_part = "MNL",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        min_raw_size_factor = 10,
        base_adult_size_for_random = 10,
        body_size_index_and_child_count = 1,
        eligible_rating_tags = {"AMBIENT"},
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
        name_part = "MNL",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        min_raw_size_factor = 10,
        base_adult_size_for_random = 10,
        body_size_index_and_child_count = 1,
        eligible_rating_tags = {"VERMIN"},
        size_tags = {"MINIMAL"},
        tok = {[[
		
		[NOT_BUTCHERABLE][SMALL_REMAINS][VERMIN_HATEABLE]
		[CREATURE_TILE:250]
		[POPULATION_NUMBER:500:1000]
		]]},
        weight = 10,
        enabled = false
    },
    {
        name_part = "SML",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        min_raw_size_factor = 100,
        base_adult_size_for_random = 100,
        body_size_index_and_child_count = 1,
        eligible_rating_tags = {"VERMIN"},
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
        name_part = "SML",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        min_raw_size_factor = 100,
        base_adult_size_for_random = 100,
        body_size_index_and_child_count = 1,
        eligible_rating_tags = {"AMBIENT"},
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
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        min_raw_size_factor = 1000,
        base_adult_size_for_random = 1000,
        body_size_index_and_child_count = 1,
        eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS"},
        size_tags = {"LESSER"},
        tok = {[[
		[CREATURE_TILE:'s'][CREATURE_CLASS:SIZE_LESSER]
		
		[POPULATION_NUMBER:250:500]
		]]},
        weight = 30,
        enabled = false
    },
    {
        name_part = "MDM",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        base_adult_size_for_random = 10000,
        body_size_index_and_child_count = 13,
        eligible_rating_tags = {"HAZARDOUS", "BENIGN", "PROBLEMATIC", "SOPHONT", "HOSTILE", "DANGEROUS"},
        size_tags = {"MEDIUM"},
        weight = 50,
        favored_size_multiplier_enabled = true,
			rating_specific_weights = {
				["SOPHONT"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				["DEVIANT"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				["HOSTILE"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				["VESSEL"] =  { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				},
			gaits = { 
        STANDARD_BIPED_GAITS = 30, 
        STANDARD_CRAWLING_GAITS = 10, 
        STANDARD_CLIMBING_GAITS = 5, 
        STANDARD_SWIMMING_GAITS = 10
			},
        tok = {[[
		[CREATURE_TILE:'y'][CREATURE_CLASS:SIZE_MEDIUM]
		[CREATURE_SOLDIER_TILE:152]
		
		[POPULATION_NUMBER:20:50]
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
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        base_adult_size_for_random = 100000,
        body_size_index_and_child_count = 13,
        eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "SOPHONT", "HOSTILE", "BENIGN", "PROBLEMATIC"},
        size_tags = {"LARGE"},
        weight = 30,
        favored_size_multiplier_enabled = true,
			rating_specific_weights = {
				["SOPHONT"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				["DEVIANT"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				["HOSTILE"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				["VESSEL"] =  { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				},
			gaits = { 
        STANDARD_BIPED_GAITS = 30, 
        STANDARD_CRAWLING_GAITS = 10, 
        STANDARD_CLIMBING_GAITS = 5, 
        STANDARD_SWIMMING_GAITS = 10
			},
        tok = {[[
		[CREATURE_TILE:'Y'][CREATURE_CLASS:SIZE_LARGE]
		
		[POPULATION_NUMBER:10:20]
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
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        base_adult_size_for_random = 1000000,
        body_size_index_and_child_count = 13,
        eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "SOPHONT", "HOSTILE"},
        size_tags = {"HUGE"},
        weight = 19,
        favored_size_multiplier_enabled = true,
			rating_specific_weights = {
				["SOPHONT"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				["DEVIANT"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				["HOSTILE"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				["VESSEL"] =  { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				},
			gaits = { 
        STANDARD_BIPED_GAITS = 30, 
        STANDARD_CRAWLING_GAITS = 10, 
        STANDARD_CLIMBING_GAITS = 5, 
        STANDARD_SWIMMING_GAITS = 10
			},
        tok = {[[
		[CREATURE_TILE:'Y'][CREATURE_CLASS:SIZE_HUGE][SAVAGE]
		
		[POPULATION_NUMBER:5:10]
		[CREATURE_CLASS:HUGEHEAD]
		[CREATURE_CLASS:HUGEARMS]
		[CREATURE_CLASS:HUGESHOULDERS]
		[CREATURE_CLASS:HUGEHIPS]
		[CREATURE_CLASS:HUGELEGS]
		[CREATURE_CLASS:HUGEBODY]
		]]},
        enabled = true
    },
    {
        name_part = "GNT",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        base_adult_size_for_random = 10000000,
        body_size_index_and_child_count = 13,
        eligible_rating_tags = {"EXISTENTIAL"},
        size_tags = {"GIANT"},
        weight = 1,
        favored_size_multiplier_enabled = true,
			rating_specific_weights = {
				["SOPHONT"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				["DEVIANT"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				["HOSTILE"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				["VESSEL"] =  { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				},
			gaits = { 
        STANDARD_BIPED_GAITS = 30, 
        STANDARD_CRAWLING_GAITS = 10, 
        STANDARD_CLIMBING_GAITS = 5, 
        STANDARD_SWIMMING_GAITS = 10
			},
        tok = {[[
		[CREATURE_TILE:'Y'][CREATURE_CLASS:SIZE_GIANT]
		
		[POPULATION_NUMBER:1:1]
		[CREATURE_CLASS:GIANTHEAD]
		[CREATURE_CLASS:GIANTARMS]
		[CREATURE_CLASS:GIANTSHOULDERS]
		[CREATURE_CLASS:GIANTHIPS]
		[CREATURE_CLASS:GIANTLEGS]
		[CREATURE_CLASS:GIANTBODY]
		]]},
        enabled = true
    },
    {
        name_part = "TTN",
        desc_part = " _______________________________________________________ __________/APPROX_MASS = %ssu ",
        base_adult_size_for_random = 100000000,
        body_size_index_and_child_count = 13,
        eligible_rating_tags = {"EXISTENTIAL"},
        size_tags = {"TITANIC"},
        weight = 1,
        favored_size_multiplier_enabled = true,
			rating_specific_weights = {
				["SOPHONT"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				["DEVIANT"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				["HOSTILE"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				["VESSEL"] =  { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				},
			gaits = { 
        STANDARD_BIPED_GAITS = 30, 
        STANDARD_CRAWLING_GAITS = 10, 
        STANDARD_CLIMBING_GAITS = 5, 
        STANDARD_SWIMMING_GAITS = 10
			},
        tok = {[[
		[CREATURE_TILE:'Y'][CREATURE_CLASS:SIZE_TITANIC]
		
		[POPULATION_NUMBER:1:1]
		[CREATURE_CLASS:TITANICHEAD]
		[CREATURE_CLASS:TITANICARMS]
		[CREATURE_CLASS:TITANICSHOULDERS]
		[CREATURE_CLASS:TITANICHIPS]
		[CREATURE_CLASS:TITANICLEGS]
		[CREATURE_CLASS:TITANICBODY]
		]]},
        enabled = false
    }
    },
	
	
	
	
    procgen_table_sub_archetype = {
    {
        body_token = "MACHINE_LIMBLESS_UPPER:MACHINE_HEAD_NECK:2LUNGS:HEART:ORGANS:SPINE:BRAIN:SKULL",
        desc_part = "_______________________________________________________ __________/TYPE = A mass of human organs contained within a mechanical shell of hereditary augmentations, nearly fully divorced from conventional biology. This variant is a common design familiar to the most ancient civilization; a robust, physically powerful frame protecting its owner's precious innards, reminiscent of a military vehicle or industrial equipment.  _______________________________________________________ __________/DESC = ",
        eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE"},
        eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
		attribute_weight = { 
		STRENGTH = "++", 
		TOUGHNESS = "++", 
		},
		sub_archetype = {"BULK"},
        tok = {
		[[
		[CREATURE_CLASS:CYCASTE_BULK]
			
		]]
		}, 
        weight = 20,
		next_tables = {
		"procgen_subchart_table_bulk_body"
		}
    },
    {
        body_token = "MACHINE_LIMBLESS_UPPER:MACHINE_HEAD_NECK:2LUNGS:HEART:ORGANS:SPINE:BRAIN:SKULL",
        desc_part = "_______________________________________________________ __________/TYPE = A mass of human organs contained within a mechanical shell of hereditary augmentations, nearly fully divorced from conventional biology. This variant is a sophisticated design born from the Transitional Era, making up the populations which ruled that era before being displaced by true posthumanity.  _______________________________________________________ __________/DESC = ",
        eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE"},
        eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
		sub_archetype = {"SLEEK"},
        tok = {
		[[
		[CREATURE_CLASS:CYCASTE_SLEEK]
			
		]]
		}, 
        weight = 20,
		next_tables = {
		"procgen_subchart_table_sleek_body"
		}
    },
    {
        body_token = "MACHINE_LIMBLESS_UPPER:MACHINE_HEAD_NECK:2LUNGS:HEART:ORGANS:SPINE:BRAIN:SKULL",
        desc_part = "_______________________________________________________ __________/TYPE = A mass of human organs contained within a mechanical shell of hereditary augmentations, nearly fully divorced from conventional biology. This variant is an alien, stripped-down design of the Atrophic Era's desperate efforts at survival; a skeletal frame of exposed pneumatics, wires, and bulbous containers packed into a ribcage-like container, cradling the biological organs that command it.  _______________________________________________________ __________/DESC = ",
        eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE"},
        eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
		attribute_weight = { 
		AGILITY = "++", 
		},
		gaits = { 
        STANDARD_BIPED_GAITS = 40, 
        STANDARD_CRAWLING_GAITS = 15, 
        STANDARD_CLIMBING_GAITS = 10, 
        STANDARD_SWIMMING_GAITS = 15
		},		
		sub_archetype = {"SKELETON"},
        tok = {
		[[
		[CREATURE_CLASS:CYCASTE_SKELETON]
			
		]]
		}, 
        weight = 20,
		next_tables = {
		"procgen_subchart_table_skeleton_body"
		}
    }
    },
	
	
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	
	
    flowchart_data = {
    
        procgen_subchart_table_bulk_body = {
            {    
                body_token = "", 
                desc_part = "It has an upright humanoid body, with  ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE"},
                eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
                tok = {[[
				
				

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_dermal",
		"procgen_subchart_table_bulk_head",
		"procgen_subchart_table_bulk_arms",
		"procgen_subchart_table_bulk_legs",
		"procgen_subchart_table_bulk_other"
		}
            },
            {     
                body_token = "", 
                desc_part = "It has an upright lower body but a broad, horizontally oriented upper body, with ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE"},
                eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[


                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_dermal",
		"procgen_subchart_table_bulk_head",
		"procgen_subchart_table_bulk_arms",
		"procgen_subchart_table_bulk_legs",
		"procgen_subchart_table_bulk_other"
		}
            },
            {     
                body_token = "", 
                desc_part = "It has an upright lower body but a long, horizontally oriented upper body, with ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE"},
                eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

			
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_dermal",
		"procgen_subchart_table_bulk_head",
		"procgen_subchart_table_bulk_arms",
		"procgen_subchart_table_bulk_legs",
		"procgen_subchart_table_bulk_other"
		}
            },
            {     
                body_token = "", 
                desc_part = "It has a horizontally oriented body, with ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT", "HOSTILE"},
                eligible_size_tags = {"HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_dermal",
		"procgen_subchart_table_bulk_head",
		"procgen_subchart_table_bulk_arms",
		"procgen_subchart_table_bulk_legs",
		"procgen_subchart_table_bulk_other"
		}
            }
			},
			
	
	
        procgen_subchart_table_bulk_head = {
            {    
                body_token = ":2MACHINEEYE:MACHINEMOUTH:MACHINETEETH:", 
                desc_part = "It has a simple faceplate with ",
                eligible_rating_tags = {"SOPHONT", "HOSTILE", "DEVIANT"},
                eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT"}, 
                tok = {[[
				
	[SET_BP_GROUP:BY_CATEGORY:HEAD]
		[BP_APPEARANCE_MODIFIER:DEEP_VOICE:0:70:90:100:110:130:200]
		[BP_APPEARANCE_MODIFIER:RASPY_VOICE:0:70:90:100:110:130:200]
		
		[SET_TL_GROUP:BY_CATEGORY:ALL:ENDOSKELETON]
	[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
				[TLCM_NOUN:faceplate:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
	
                ]]},
                weight = 50,
		next_tables = {
		"procgen_subchart_table_bulk_eyes",
		"procgen_subchart_table_bulk_mouth",
		"procgen_subchart_table_bulk_neck",
		}
            },
            {     
                body_token = ":2MACHINEEYE:MACHINEMOUTH:MACHINETEETH:", 
                desc_part = "It has a lifelike faceplate with ",
                eligible_rating_tags = {"SOPHONT", "HOSTILE", "DEVIANT"},
                eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT"}, 
                tok = {[[
				
    	[SET_BP_GROUP:BY_CATEGORY:HEAD]
		[BP_APPEARANCE_MODIFIER:CLOSE_SET:0:70:90:100:110:130:200]
			[APP_MOD_NOUN:eyes:PLURAL]
		[BP_APPEARANCE_MODIFIER:DEEP_SET:0:70:90:100:110:130:200]
			[APP_MOD_NOUN:eyes:PLURAL]
		[BP_APPEARANCE_MODIFIER:ROUND_VS_NARROW:0:70:90:100:110:130:200]
			[APP_MOD_NOUN:eyes:PLURAL]
		[BP_APPEARANCE_MODIFIER:LARGE_IRIS:25:70:90:100:110:130:200]
			[APP_MOD_NOUN:eyes:PLURAL]
			[APP_MOD_DESC_RANGE:30:60:90:110:150:190]

	[SET_BP_GROUP:BY_CATEGORY:HEAD]
		[BP_APPEARANCE_MODIFIER:THICKNESS:50:70:90:100:110:130:200]
			[APP_MOD_NOUN:lips:PLURAL]
			[APP_MOD_DESC_RANGE:55:70:90:110:150:190]

	[SET_BP_GROUP:BY_CATEGORY:HEAD]
		[BP_APPEARANCE_MODIFIER:BROADNESS:25:70:90:100:110:130:200]
			[APP_MOD_DESC_RANGE:30:60:90:110:150:190]
		[BP_APPEARANCE_MODIFIER:LENGTH:25:70:90:100:110:130:200]
			[APP_MOD_DESC_RANGE:30:60:90:110:150:190]
		[BP_APPEARANCE_MODIFIER:UPTURNED:0:70:90:100:110:130:200]
		[BP_APPEARANCE_MODIFIER:CONVEX:0:70:90:100:110:130:200]
			[APP_MOD_NOUN:nose bridge:SINGULAR]

	[SET_BP_GROUP:BY_CATEGORY:HEAD]
		[BP_APPEARANCE_MODIFIER:HIGH_CHEEKBONES:0:70:90:100:110:130:200]
		[BP_APPEARANCE_MODIFIER:BROAD_CHIN:0:70:90:100:110:130:200]
		[BP_APPEARANCE_MODIFIER:JUTTING_CHIN:0:70:90:100:110:130:200]
		[BP_APPEARANCE_MODIFIER:SQUARE_CHIN:0:70:90:100:110:130:200]

	[SET_BP_GROUP:BY_CATEGORY:HEAD]
		[BP_APPEARANCE_MODIFIER:DEEP_VOICE:0:70:90:100:110:130:200]
		[BP_APPEARANCE_MODIFIER:RASPY_VOICE:0:70:90:100:110:130:200]
		
		[SET_TL_GROUP:BY_CATEGORY:ALL:ENDOSKELETON]
	[TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
				[TLCM_NOUN:faceplate:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
	
                ]]},
                weight = 50,
		next_tables = {
		"procgen_subchart_table_bulk_eyes",
		"procgen_subchart_table_bulk_mouth",
		"procgen_subchart_table_bulk_neck",
		}
            },
            {     
                body_token = ":HEADNECK_MODULAR:2EARS:2NOSEHOLE:THROAT:NECK:SKULL", 
                desc_part = "Its head is bestial, its brow and forehead humanoid but below that its jaw and snout protrude into a long, distended muzzle, with ",
				eligible_rating_tags = {"HOSTILE", "EXISTENTIAL", "DANGEROUS", "WEAPON", "MILITARY", "NOMAD", "DOMESTIC"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
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
        [SET_BP_GROUP:BY_CATEGORY:TOOTH]
            [BP_APPEARANCE_MODIFIER:GAPS:0:70:90:100:110:130:200]
                [APP_MOD_NOUN:teeth:PLURAL]
        [SET_BP_GROUP:BY_CATEGORY:SKULL]
            [BP_APPEARANCE_MODIFIER:HIGH_CHEEKBONES:0:70:90:100:110:130:200]
        [SET_BP_GROUP:BY_CATEGORY:THROAT]
            [BP_APPEARANCE_MODIFIER:DEEP_VOICE:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:RASPY_VOICE:0:70:90:100:110:130:200]
        [SET_BP_GROUP:BY_CATEGORY:HEAD]
            [BP_APPEARANCE_MODIFIER:BROADNESS:90:95:98:100:102:105:110]
                [APP_MOD_IMPORTANCE:700]
                [APP_MOD_DESC_RANGE:91:94:98:102:106:109]
            [BP_APPEARANCE_MODIFIER:LENGTH:90:95:98:100:102:105:110]
                [APP_MOD_IMPORTANCE:700]
                [APP_MOD_DESC_RANGE:91:94:98:102:106:109]
				
                ]]},
                weight = 25,
		next_tables = {
		"procgen_subchart_table_devil_neck",
		"procgen_subchart_table_devil_eyes",
		"procgen_subchart_table_devil_mouth",
		"procgen_subchart_table_devil_hair"
		}
            }
            },
	
	
	
	
	
	
	
	
	
	
	
	
	
	


	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================
	
	-- =================================================================================================================================================================================================




        procgen_subchart_table_plastic = {
            {     
                body_token = "", 
                desc_part = "an exterior of overlapping, flexible plastic plates. ",
				eligible_rating_tags = {"SOPHONT", "DEVIANT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
			
                [TISSUE:PLASTIC]
                    [TISSUE_NAME:plastic exterior:NP]
                    [TISSUE_MATERIAL:INORGANIC:PLASTICWARE]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
                [TISSUE_LAYER_OVER:BY_CATEGORY:ALL:PLASTIC]
				
	[SET_TL_GROUP:BY_CATEGORY:ALL:DENSE]
	[BP_APPEARANCE_MODIFIER:THICKNESS:0:70:90:100:110:130:200]
		[APP_MOD_IMPORTANCE:10000]
			[APP_MOD_NOUN:plastic exterior:SINGULAR]

					
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
            [TL_COLOR_MODIFIER:WHITE:2:CLEAR:2:OPAQUE:2:WHITE:2:CLEAR:2:OPAQUE:2:WHITE:2:CLEAR:1:OPAQUE:2:CLEAR:1]
                [TLCM_NOUN:plastic:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
                ]]},
                weight = 100
            },
            {     
                body_token = "", 
                desc_part = "hyper-alloy exterior. ",
			eligible_rating_tags = {"HOSTILE", "AVATAR"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

                [TISSUE_LAYER_OVER:BY_CATEGORY:ALL:DERMAL]
				
	[SET_TL_GROUP:BY_CATEGORY:ALL:DERMAL]
	[BP_APPEARANCE_MODIFIER:THICKNESS:0:70:90:100:110:130:200]
		[APP_MOD_IMPORTANCE:10000]
			[APP_MOD_NOUN:exterior plating:SINGULAR]

	[SET_TL_GROUP:BY_CATEGORY:ALL:DERMAL]
	[BP_APPEARANCE_MODIFIER:DENSE:0:70:90:100:110:130:200]
		[APP_MOD_IMPORTANCE:10000]
			[APP_MOD_NOUN:exterior plating:SINGULAR]

		[SET_TL_GROUP:BY_CATEGORY:ALL:ENDOSKELETON]
	[TL_COLOR_MODIFIER:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1]
				[TLCM_NOUN:exterior:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
					

                ]]},
                weight = 50
            }
            },


        procgen_subchart_table_dermal = {
            {     
                body_token = "", 
                desc_part = "meta-alloy exterior. ",
			eligible_rating_tags = {"SOPHONT", "DEVIANT"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[
				
				
                [TISSUE_LAYER_OVER:BY_CATEGORY:ALL:DERMAL]
				
	[SET_TL_GROUP:BY_CATEGORY:ALL:DERMAL]
	[BP_APPEARANCE_MODIFIER:THICKNESS:0:70:90:100:110:130:200]
		[APP_MOD_IMPORTANCE:10000]
			[APP_MOD_NOUN:exterior plating:SINGULAR]

	[SET_TL_GROUP:BY_CATEGORY:ALL:DERMAL]
	[BP_APPEARANCE_MODIFIER:DENSE:0:70:90:100:110:130:200]
		[APP_MOD_IMPORTANCE:10000]
			[APP_MOD_NOUN:exterior plating:SINGULAR]

		[SET_TL_GROUP:BY_CATEGORY:ALL:ENDOSKELETON]
	[TL_COLOR_MODIFIER:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1]
				[TLCM_NOUN:exterior:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
					

                ]]},
                weight = 50
            },
            {     
                body_token = "", 
                desc_part = "hyper-alloy exterior. ",
			eligible_rating_tags = {"HOSTILE", "AVATAR"},
                eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
                tok = {[[

                [TISSUE_LAYER_OVER:BY_CATEGORY:ALL:DERMAL]
				
	[SET_TL_GROUP:BY_CATEGORY:ALL:DERMAL]
	[BP_APPEARANCE_MODIFIER:THICKNESS:0:70:90:100:110:130:200]
		[APP_MOD_IMPORTANCE:10000]
			[APP_MOD_NOUN:exterior:SINGULAR]

	[SET_TL_GROUP:BY_CATEGORY:ALL:DERMAL]
	[BP_APPEARANCE_MODIFIER:DENSE:0:70:90:100:110:130:200]
		[APP_MOD_IMPORTANCE:10000]
			[APP_MOD_NOUN:exterior:SINGULAR]

		[SET_TL_GROUP:BY_CATEGORY:ALL:ENDOSKELETON]
	[TL_COLOR_MODIFIER:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1:GRAY:1]
				[TLCM_NOUN:exterior:SINGULAR]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
					
					

                ]]},
                weight = 50
            }
		}	
	},
    -- ============================================================================
    -- RESTRUCTURED: Non-Sophont Caste Data
    -- ============================================================================
    non_sophont_caste_groups = {
        {
            castes = {
                {
                    tokens = [[
					[CASTE:FEMALE][FEMALE][CREATURE_CLASS:CYCASTE_FEMALE]
					]],
                    description_addon = ""
                },
                {
                    tokens = [[
					[CASTE:MALE][MALE][CREATURE_CLASS:CYCASTE_MALE]
					]],
                    description_addon = ""
                }
            },
            shared_tokens = [[
			[SELECT_CASTE:ALL][POP_RATIO:100]
			[SET_BP_GROUP:BY_TYPE:LOWERBODY][BP_ADD_TYPE:GELDABLE]
			]],
            weight = 100,
				eligible_rating_tags = {"SOPHONT", "EXISTENTIAL", "HOSTILE"},
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