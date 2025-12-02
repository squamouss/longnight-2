
return {
    -- ============================================================================
    -- Basic Configuration
    -- ============================================================================
    ARCHETYPE_CLASS = "NANOMACHINE",
    MIN_CREATURES = 50,
    MAX_CREATURES = 100,
    BASE_CREATURE_NAME_PREFIX = "nanomech ID",
    OUTPUT_FILENAME = "generated_nanomech_creatures.txt",
    SAVE_TO_FILE_TOGGLE = true,
    SAVE_PARTIAL_OUTPUT_ON_ERROR = true,
    ENABLE_SIZE_AND_CHILD_GENERATION = true,    
	USE_SPECIAL_PLURAL = true,
    SPECIAL_PLURAL_NAME = "nanomechs ID",

    -- ============================================================================
    -- Name & Component Configuration
    -- ============================================================================
    TRANSCENDENT_NAME_ROOT_SINGULAR = "nanomech",
    TRANSCENDENT_NAME_ROOT_PLURAL = "nanomechs",

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
        [CREATURE_TILE:'t']
            
        [CREATURE_CLASS:NANITE]
        [CREATURE_CLASS:UNPET]
        [CREATURE_CLASS:NOPOWER]
        [GENERATED][LISP][BLOODSUCKER]

		
    ]],
    
    COMMON_BODY_DETAIL_RAWS = [[
	[SELECT_CASTE:ALL]
	[NO_THOUGHT_CENTER_FOR_MOVEMENT]
	[NO_CONNECTIONS_FOR_MOVEMENT]
	[BLOODSUCKER]
      	[BODY_DETAIL_PLAN:NANITE_MATERIALS]
			[BODY_DETAIL_PLAN:NANITE_TISSUES]

			[BODY_DETAIL_PLAN:NANITE_TISSUE_LAYERS:NANOFLUID:SKIN:BONE]
			
			
        [SMELL_TRIGGER:90]
        [HOMEOTHERM:10067]
        [MUNDANE]
        [ALL_ACTIVE]
    ]],

    COMMON_APPEARANCE_RAWS = [[
        [BODY_APPEARANCE_MODIFIER:HEIGHT:75:95:98:100:102:105:125]
            [APP_MOD_IMPORTANCE:500]
        [BODY_APPEARANCE_MODIFIER:BROADNESS:75:95:98:100:102:105:125]
            [APP_MOD_IMPORTANCE:500]
			
			
        [SET_BP_GROUP:BY_CATEGORY:HEAD]
            [BP_APPEARANCE_MODIFIER:DEEP_VOICE:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:RASPY_VOICE:0:70:90:100:110:130:200]
        [SET_BP_GROUP:BY_CATEGORY:HEAD]
            [BP_APPEARANCE_MODIFIER:BROADNESS:90:95:98:100:102:105:110]
                [APP_MOD_IMPORTANCE:700]
                [APP_MOD_DESC_RANGE:91:94:98:102:106:109]
            [BP_APPEARANCE_MODIFIER:HEIGHT:90:95:98:100:102:105:110]
                [APP_MOD_IMPORTANCE:700]
                [APP_MOD_DESC_RANGE:91:94:98:102:106:109]
				
        [SET_TL_GROUP:BY_CATEGORY:ALL:NANOFLUID]
		[TL_COLOR_MODIFIER:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1:BLACK:1]
                [TLCM_NOUN:innards:PLURAL]
			[TL_COLOR_MODIFIER:RED:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
        [SET_TL_GROUP:BY_CATEGORY:ALL:SKIN]
            [TL_COLOR_MODIFIER:LIGHT_GRAY:1:GRAY:1:DARK_GRAY:1:LIGHT_GRAY:1:GRAY:1:DARK_GRAY:1:LIGHT_GRAY:1:GRAY:1:DARK_GRAY:1:LIGHT_GRAY:1]
                [TLCM_NOUN:skin:SINGULAR]
			[TL_COLOR_MODIFIER:BLUE:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
            [TISSUE_LAYER_APPEARANCE_MODIFIER:WRINKLY:0:0:0:0:0:0:0]
                [APP_MOD_RATE:1:YEARLY:0:100:60:0:NO_END]
                [APP_MOD_NOUN:skin:SINGULAR]
                [APP_MOD_DESC_RANGE:0:0:0:1:25:50]
				
				

				
    ]],

    -- ============================================================================
    -- Data Tables
    -- ============================================================================
    generic_creature_lore_snippets = {
        "Nanomechs are organisms derived from unstable nanite clusters, nurtured by chance or deliberate intent into coherent bodyplans and psyches. Most are feral, unique conglomerations of nanomass coagulated into a stable form by chance and evolution, their imbalanced physiologies granting them a reputation for unpredictability and danger. Of all 'mechlife, they are perhaps the most alien, their minds unknowable and morphologies divorced from intelligent design. Those few that gain sophonce may find acceptance and some few may tame them, but most are the cryptids of the technosystem; illogical monsters, lurking in the dark. ",
    },

    interaction_rating = {
        {
            desc_part = "It is classified as Sophontic; it is an intelligent being capable of reason and metacognition, aligned with human values and psychology. ",
            tok = {[[
            [INTELLIGENT][EQUIPS][CANOPENDOORS][OUTSIDER_CONTROLLABLE][LOCAL_POPS_PRODUCE_HEROES]
            [COLOR:3:0:0]
            [CREATURE_CLASS:SOPHONT]
            ]]},
            tags = {"SOPHONT"},
            weight = 5,
            enabled = true,
            minimum_number = 1
        },
        {
            desc_part = "It is classified as Hostile; while effectively sapient in terms of problem solving skill, its behaviors are dictated by deep-set programming which align it against other sophonts. ",
            tok = {[[
            [INTELLIGENT][EQUIPS][CANOPENDOORS][COLOR:1:0:0]
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
            [FREQUENCY:5]
		   [BIOME:ANY_LAND]
			
		[CAN_DO_INTERACTION:DIGITAL_DEFENSE1_UNLOCK]
			[CDI:ADV_NAME:Unlock Digital Defenses]
			[CDI:USAGE_HINT:DEFEND]
			[CDI:TARGET:C:SELF_ONLY]
			[CDI:WAIT_PERIOD:120000]
			
			[CAN_DO_INTERACTION:DIGITAL_ATTACK2_UNLOCK]
		[CDI:ADV_NAME:Unlock Digital Attacks]
		[CDI:USAGE_HINT:DEFEND]
		[CDI:TARGET:C:SELF_ONLY]
		[CDI:WAIT_PERIOD:120000]	
            ]]},
            tags = {"HOSTILE"},
            weight = 5,
            enabled = true,
            minimum_number = 0 
        },
        {
            desc_part = "It is classified as Existential; It represents a threat to entire settlements or even civilizations and cannot be reasoned with. ",
            tok = {[[
            [ATTACK_TRIGGER:3:3:3][COLOR:1:0:0]
            [BUILDINGDESTROYER:2]
            [FEATURE_BEAST]
            [CREATURE_CLASS:EXISTENTIAL]
		   [BIOME:ANY_LAND]
			
		[CAN_DO_INTERACTION:DIGITAL_DEFENSE3_UNLOCK]
			[CDI:ADV_NAME:Unlock Digital Defenses]
			[CDI:USAGE_HINT:DEFEND]
			[CDI:TARGET:C:SELF_ONLY]
			[CDI:WAIT_PERIOD:120000]
			
			[CAN_DO_INTERACTION:DIGITAL_ATTACK2_UNLOCK]
		[CDI:ADV_NAME:Unlock Digital Attacks]
		[CDI:USAGE_HINT:DEFEND]
		[CDI:TARGET:C:SELF_ONLY]
		[CDI:WAIT_PERIOD:120000]	
            ]]},
            tags = {"EXISTENTIAL"},
            weight = 1,
            enabled = false,
            minimum_number = 0 
        },
        {
            desc_part = "It is classified as Dangerous; it is an active threat to other organisms and will deliberately harm or kill those it comes across, and is capable of and willing to target sophonts. ",
            tok = {[[
            [LARGE_PREDATOR][CRAZED][AMBUSHPREDATOR][COLOR:1:0:0]
            
            [CREATURE_CLASS:DANGEROUS]
		   [BIOME:ANY_LAND][BIOME:SUBTERRANEAN_WATER][BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:0:3]
            [FREQUENCY:10]
		[CAN_DO_INTERACTION:DIGITAL_DEFENSE1_UNLOCK]
			[CDI:ADV_NAME:Unlock Digital Defenses]
			[CDI:USAGE_HINT:DEFEND]
			[CDI:TARGET:C:SELF_ONLY]
			[CDI:WAIT_PERIOD:120000]
			
			[CAN_DO_INTERACTION:DIGITAL_ATTACK1_UNLOCK]
		[CDI:ADV_NAME:Unlock Digital Attacks]
		[CDI:USAGE_HINT:DEFEND]
		[CDI:TARGET:C:SELF_ONLY]
		[CDI:WAIT_PERIOD:120000]	
            ]]},
            tags = {"DANGEROUS"},
            weight = 10,
            enabled = true,
            minimum_number = 0 
        },
        {
            desc_part = "It is classified as Hazardous; it does not deliberately prey on other organisms but will attack any that come near, and may come into conflict with sophonts over mutual food or energy sources. ",
            tok = {[[
            [CURIOUSBEAST_GUZZLER][CURIOUSBEAST_EATER][COLOR:1:0:0]
            
            [CREATURE_CLASS:HAZARDOUS][PRONE_TO_RAGE:30]
		   [BIOME:ANY_LAND][BIOME:SUBTERRANEAN_WATER][BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:0:3]
            [FREQUENCY:20][CLUSTER_NUMBER:1:3][LOOSE_CLUSTERS]
		[CAN_DO_INTERACTION:DIGITAL_DEFENSE1_UNLOCK]
			[CDI:ADV_NAME:Unlock Digital Defenses]
			[CDI:USAGE_HINT:DEFEND]
			[CDI:TARGET:C:SELF_ONLY]
			[CDI:WAIT_PERIOD:120000]
			
            ]]},
            tags = {"HAZARDOUS"},
            weight = 40,
            enabled = true,
            minimum_number = 0 
        },
        {
            desc_part = "It is classified as Benign; it avoids conflict and generally does not pose a danger unless in an extreme situation, and will generally avoid the attention of sophonts. ",
            tok = {[[
            [BENIGN][COLOR:1:0:0]
            [CREATURE_CLASS:BENIGN]
		   [BIOME:ANY_LAND][BIOME:SUBTERRANEAN_WATER][BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:0:3]
            [FREQUENCY:50][CLUSTER_NUMBER:1:5][LOOSE_CLUSTERS]
				
            ]]},
            tags = {"BENIGN"},
            weight = 30,
            enabled = false,
            minimum_number = 0 
        },
        {
            desc_part = "It is classified as Problematic; it generally avoids violence but may steal supplies, food, or energy stores, and can infiltrate poorly maintained settlements and otherwise cause minor issues. ",
            tok = {[[
            [CURIOUSBEAST_GUZZLER][CURIOUSBEAST_EATER][CURIOUSBEAST_ITEM][COLOR:1:0:0]
            [TRAPAVOID][MISCHIEVOUS][BENIGN]
            
            [CREATURE_CLASS:PROBLEMATIC]
		   [BIOME:ANY_LAND][BIOME:SUBTERRANEAN_WATER][BIOME:SUBTERRANEAN_CHASM]
			[UNDERGROUND_DEPTH:0:3]
            [FREQUENCY:30][CLUSTER_NUMBER:1:5][LOOSE_CLUSTERS]
            ]]},
            tags = {"PROBLEMATIC"},
            weight = 20,
            enabled = true,
            minimum_number = 0 
        },
        {
            desc_part = "It is classified as Vermin; it is very small but can infest settlements or otherwise inconvenience other organisms. ",
            tok = {[[
            [CREATURE_CLASS:VERMIN][COLOR:1:0:0]
            [FREQUENCY:100]
	[LIGHT_GEN]
            ]]},
            tags = {"VERMIN"},
            weight = 10,
            enabled = true
        },
        {
            desc_part = "It is classified as Ambient; it is very small and mostly benign. ",
            tok = {[[
            [CREATURE_CLASS:AMBIENT]
            [FREQUENCY:100][COLOR:1:0:0]
	[LIGHT_GEN]
            ]]},
            tags = {"AMBIENT"},
            weight = 10,
            enabled = false
        },
        {
            desc_part = "It is classified as Deviant; it is an intelligent being capable of reason and metacognition, but has abandoned or lost human values and psychology in favor of competitiveness within the technosystem. ",
            tok = {[[
            [INTELLIGENT][EQUIPS][CANOPENDOORS][OUTSIDER_CONTROLLABLE][LOCAL_POPS_PRODUCE_HEROES]
            
            [CREATURE_CLASS:DEVIANT]            [COLOR:3:0:0]

            ]]},
            tags = {"DEVIANT"},
            weight = 5,
            enabled = false,
            minimum_number = 1
        },
        {
            desc_part = "It is classified as an Avatar; it is a host body of an immense hyperintelligence within the Datasphere. ",
            tok = {[[
            [INTELLIGENT][EQUIPS][CANOPENDOORS]
            [CREATURE_CLASS:AVATAR][POWER]            [COLOR:3:0:0]
			[POWER]

            ]]},
            tags = {"AVATAR"},
            weight = 1,
            enabled = false
        },
        {
            desc_part = "It is classified as a Vessel; it is a node of a distributed system or intelligence, bound to the will of its creator. ",
            tok = {[[
            [CAN_LEARN][EQUIPS][CANOPENDOORS]
            
            [CREATURE_CLASS:VESSEL]            [COLOR:3:0:0]

            ]]},
            tags = {"VESSEL"},
            weight = 1,
            enabled = false,
            minimum_number = 1
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
		[NOT_BUTCHERABLE]
		[VERMIN_MICRO]
		[SMALL_REMAINS][VERMIN_HATEABLE]
		[CREATURE_TILE:250]
		[POPULATION_NUMBER:5000:10000]
		]]},
        weight = 10,
        enabled = true
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
            [FISHITEM]
		[VERMIN_GROUNDER]
		[NOT_BUTCHERABLE][SMALL_REMAINS][VERMIN_HATEABLE]
		[CREATURE_TILE:250]
		[POPULATION_NUMBER:1000:2000]
		]]},
        weight = 10,
        enabled = true
    },
    {
        name_part = "SML",
        desc_part = "APPROX_MASS= %su. ",
        min_raw_size_factor = 100,
        base_adult_size_for_random = 100,
        body_size_index_and_child_count = 0,
        eligible_rating_tags = {"AMBIENT", "VERMIN"},
        size_tags = {"SMALL"},
        tok = {[[
            [FISHITEM]
		[VERMIN_GROUNDER]
		[NOT_BUTCHERABLE][SMALL_REMAINS][VERMIN_HATEABLE]
		[CREATURE_TILE:249]
		[POPULATION_NUMBER:500:1000]
		]]},
        weight = 10,
        enabled = true
    },
    {
        name_part = "LSR",
        desc_part = "APPROX_MASS= %su. ",
        min_raw_size_factor = 10,
        base_adult_size_for_random = 1000,
        body_size_index_and_child_count = 1,
        eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS"},
        size_tags = {"LESSER"},
        tok = {[[
		[CREATURE_TILE:'t'][CREATURE_CLASS:SIZE_LESSER]
		
		[POPULATION_NUMBER:250:500]
		]]},
        weight = 30,
        enabled = true
    },
    {
        name_part = "MDM",
        desc_part = "APPROX_MASS= %su. ",
        min_raw_size_factor = 100,
        base_adult_size_for_random = 10000,
        body_size_index_and_child_count = 5,
        eligible_rating_tags = {"HAZARDOUS", "BENIGN", "PROBLEMATIC", "HOSTILE", "DANGEROUS"},
        size_tags = {"MEDIUM"},
        weight = 50,
        favored_size_multiplier_enabled = true,
			rating_specific_weights = {
				["SOPHONT"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				["DEVIANT"] = { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				["HOSTILE"] = { [1]=0, [2]=0, [3]=5, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				["VESSEL"] =  { [1]=0, [2]=0, [3]=0, [4]=0, [5]=0, [6]=0, [7]=50, [8]=30, [9]=20 }, 
				},
        tok = {[[
		[CREATURE_TILE:'t'][CREATURE_CLASS:SIZE_MEDIUM]
		
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
        name_part = "MDM",
        desc_part = "APPROX_MASS= %su. ",
        min_raw_size_factor = 100,
        base_adult_size_for_random = 10000,
        body_size_index_and_child_count = 5,
        eligible_rating_tags = {"SOPHONT"},
        size_tags = {"MEDIUM"},
        weight = 50,
        tok = {[[
		[CREATURE_TILE:'t'][CREATURE_CLASS:SIZE_MEDIUM]
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
        eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "HOSTILE", "BENIGN"},
        size_tags = {"LARGE"},
        weight = 20,
        tok = {[[
		[CREATURE_TILE:'T'][CREATURE_CLASS:SIZE_LARGE]
		
		[POPULATION_NUMBER:10:50]
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
        name_part = "LRG",
        desc_part = "APPROX_MASS= %su. ",
        min_raw_size_factor = 1000,
        base_adult_size_for_random = 100000,
        body_size_index_and_child_count = 10,
        eligible_rating_tags = {"SOPHONT"},
        size_tags = {"LARGE"},
        weight = 20,
        tok = {[[
		[CREATURE_TILE:'T'][CREATURE_CLASS:SIZE_LARGE]
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
        body_size_index_and_child_count = 20,
        eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "HOSTILE", "EXISTENTIAL"},
        size_tags = {"HUGE"},
        weight = 10,
        tok = {[[
		[CREATURE_TILE:'T'][CREATURE_CLASS:SIZE_HUGE][SAVAGE]
		
		[POPULATION_NUMBER:5:20]
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
        name_part = "HGE",
        desc_part = "APPROX_MASS= %su. ",
        min_raw_size_factor = 10000,
        base_adult_size_for_random = 1000000,
        body_size_index_and_child_count = 20,
        eligible_rating_tags = {"SOPHONT"},
        size_tags = {"HUGE"},
        weight = 10,
        tok = {[[
		[CREATURE_TILE:'T'][CREATURE_CLASS:SIZE_HUGE][SAVAGE]
		[CREATURE_CLASS:HUGEHEAD]
		[CREATURE_CLASS:HUGEARMS]
		[CREATURE_CLASS:HUGESHOULDERS]
		[CREATURE_CLASS:HUGEHIPS]
		[CREATURE_CLASS:HUGELEGS]
		[CREATURE_CLASS:HUGEBODY]
		]]},
        enabled = false
    },
    {
        name_part = "GNT",
        desc_part = "APPROX_MASS= %su. ",
        min_raw_size_factor = 100000,
        base_adult_size_for_random = 10000000,
        body_size_index_and_child_count = 30,
        eligible_rating_tags = {"DANGEROUS", "HAZARDOUS", "SOPHONT", "HOSTILE", "EXISTENTIAL"},
        size_tags = {"GIANT"},
        weight = 5,
        tok = {[[
		[CREATURE_TILE:'T'][CREATURE_CLASS:SIZE_GIANT]
		
		[POPULATION_NUMBER:1:5]
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
        desc_part = "APPROX_MASS= %su. ",
        min_raw_size_factor = 1000000,
        base_adult_size_for_random = 100000000,
        body_size_index_and_child_count = 40,
        eligible_rating_tags = {"EXISTENTIAL"},
        size_tags = {"TITANIC"},
        weight = 1,
        tok = {[[
		[CREATURE_TILE:'T'][CREATURE_CLASS:SIZE_TITANIC]
		
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

    procgen_addon_table_1 = {
          {
        body_token = "BODY_WITH_HEAD_FLAG:",
        desc_part = "A mass of metallic flesh that splits and opens to reveal writhing black fluid inside, veins snaking under its exterior as it constantly shifts its form. ",
        eligible_rating_tags = {"VERMIN", "PROBLEMATIC", "HAZARDOUS"},
        eligible_size_tags = {"MICRO", "MINIMAL", "SMALL", "LESSER", "MEDIUM", "LARGE"}, 
        tok = {}, 
        weight = 10,
			next_tables = {"procgen_subchart_table_blob"}
    },
    {
        body_token = "HUMANOID_LIMBLESS:",
        transcendent_body_token = "HUMANOID_LIMBLESS:CORE:",
        desc_part = "A mass of metallic flesh that splits and opens to reveal writhing black fluid inside, veins snaking under its exterior as it constantly shifts its form. ",
        mundane_desc_part = "A humanoid mass of metallic flesh that splits and opens to reveal writhing black fluid inside, veins snaking under its exterior as it constantly shifts its form. ",
        core_desc_part = "A humanoid mass of metallic flesh that splits and opens to reveal writhing black fluid inside, veins snaking under its exterior as it constantly shifts its form, its only constant feature being the eerily human face on its head. ",
        transcendent_desc_part = "A humanoid mass of incredibly sophisticated nanomachinery that splits and opens to reveal writhing black fluid inside, veins snaking under its exterior as it constantly shifts its form, its only constant feature being the eerily human face on its head. ",
        eligible_rating_tags = {"SOPHONT", "HOSTILE", "PROBLEMATIC", "DANGEROUS", "EXISTENTIAL"},
        eligible_size_tags = {"LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
        tok = {
		[[
		
        [SET_BP_GROUP:BY_CATEGORY:HEAD]
            [BP_APPEARANCE_MODIFIER:HIGH_CHEEKBONES:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:BROAD_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:JUTTING_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:SQUARE_CHIN:0:70:90:100:110:130:200]
		]]
		
		}, 
        mundane_tok = {
		[[
		[NOFEAR]
        [SET_BP_GROUP:BY_CATEGORY:HEAD]
            [BP_APPEARANCE_MODIFIER:HIGH_CHEEKBONES:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:BROAD_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:JUTTING_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:SQUARE_CHIN:0:70:90:100:110:130:200]
		
		]]
		
		}, 
        core_tok = {
		[[
        [SET_BP_GROUP:BY_CATEGORY:HEAD]
            [BP_APPEARANCE_MODIFIER:HIGH_CHEEKBONES:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:BROAD_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:JUTTING_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:SQUARE_CHIN:0:70:90:100:110:130:200]
	
			[PHYS_ATT_RANGE:RECUPERATION:1250:1500:1750:2000:2500:3000:5000]  +++
			[PHYS_ATT_RANGE:DISEASE_RESISTANCE:1250:1500:1750:2000:2500:3000:5000]  +++
			[PHYS_ATT_RANGE:STRENGTH:1250:1500:1750:2000:2500:3000:5000]  +++
			[PHYS_ATT_RANGE:AGILITY:1250:1500:1750:2000:2500:3000:5000]  +++
			[PHYS_ATT_RANGE:ENDURANCE:1250:1500:1750:2000:2500:3000:5000]  +++
			[PHYS_ATT_RANGE:TOUGHNESS:1250:1500:1750:2000:2500:3000:5000]  +++
		
		]]
		
		},
        transcendent_tok = {
		[[
        [SET_BP_GROUP:BY_CATEGORY:HEAD]
            [BP_APPEARANCE_MODIFIER:HIGH_CHEEKBONES:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:BROAD_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:JUTTING_CHIN:0:70:90:100:110:130:200]
            [BP_APPEARANCE_MODIFIER:SQUARE_CHIN:0:70:90:100:110:130:200]
	
			[PHYS_ATT_RANGE:RECUPERATION:1250:1500:1750:2000:2500:3000:5000]  +++
			[PHYS_ATT_RANGE:DISEASE_RESISTANCE:1250:1500:1750:2000:2500:3000:5000]  +++
			[PHYS_ATT_RANGE:STRENGTH:1250:1500:1750:2000:2500:3000:5000]  +++
			[PHYS_ATT_RANGE:AGILITY:1250:1500:1750:2000:2500:3000:5000]  +++
			[PHYS_ATT_RANGE:ENDURANCE:1250:1500:1750:2000:2500:3000:5000]  +++
			[PHYS_ATT_RANGE:TOUGHNESS:1250:1500:1750:2000:2500:3000:5000]  +++
		
		]]
		
		}, 
        weight = 10,
			next_tables = {"procgen_subchart_table_humanoid"}
   
    }
    },
    
	
    procgen_addon_table_2 = {
           {
        body_token = "PROBOSCIS",
        desc_part = "It has a long, jointed metallic proboscis on an eyeless body. ",
        eligible_rating_tags = {"VERMIN", "HAZARDOUS", "PROBLEMATIC"},
        eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
        tok = {
		[[
			]]
        }, 
        weight = 5 
    },
    {
        body_token = "PROBOSCIS:2EYES",
        core_body_token = "2EYES:FACIAL_FEATURES:PROBOSCIS",
        transcendent_body_token = "2EYES:FACIAL_FEATURES:PROBOSCIS",
        desc_part = "It has a long, jointed metallic proboscis and two crude mechanical eyes growing from its head. ",
        mundane_desc_part = "It has a long, jointed metallic proboscis and two crude mechanical eyes growing from its head. ",
        core_desc_part = "Its humanoid head has a long metallic proboscis instead of a mouth. ",
        transcendent_desc_part = "Its humanoid head has a long metallic proboscis instead of a mouth. ",
        eligible_rating_tags = {"VERMIN", "PROBLEMATIC", "HAZARDOUS", "SOPHONT"},
        eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
        tok = {
		[[
		[ATTACK:STING:BODYPART:BY_CATEGORY:PROBOSCIS]
			[ATTACK_SKILL:BITE]
			[ATTACK_VERB:stab:stabs]
			[ATTACK_CONTACT_PERC:100]
			[ATTACK_PENETRATION_PERC:100]
			[ATTACK_FLAG_EDGE]
			[ATTACK_PREPARE_AND_RECOVER:3:3]
			[ATTACK_PRIORITY:SECOND]
			[ATTACK_FLAG_CANLATCH]
			
        [SET_TL_GROUP:BY_CATEGORY:EYE:NANOFLUID]
            [TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eye lights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
			]]
        }, 
        weight = 5 
    },
    {
        body_token = "2EYES:MOUTH",
        munane_body_token = "2EYES:MOUTH",
        core_body_token = "2EYES:NOSE:FACIAL_FEATURES:MOUTH",
        transcendent_body_token = "2EYES:NOSE:FACIAL_FEATURES:MOUTH",
        desc_part = "It has a gaping maw of many jointed, metallic teeth and two crude mechanical eyes growing from its head. ",
        mundane_desc_part = "It has a gaping maw of many jointed, metallic teeth and two crude mechanical eyes growing from its head. ",
        core_desc_part = "Its humanoid head can distend and split open to reveal a gaping maw of metallic, jointed teeth. ",
        transcendent_desc_part = "Its humanoid head can distend and split open to reveal a gaping maw of metallic, jointed teeth. ",
        eligible_rating_tags = {"SOPHONT", "DANGEROUS", "HAZARDOUS", "HOSTILE"},
        eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
        tok = {
		[[
		[ATTACK:STING:BODYPART:BY_CATEGORY:MOUTH]
			[ATTACK_SKILL:BITE]
			[ATTACK_VERB:bite:bites]
			[ATTACK_CONTACT_PERC:100]
			[ATTACK_PENETRATION_PERC:100]
			[ATTACK_FLAG_EDGE]
			[ATTACK_PREPARE_AND_RECOVER:3:3]
			[ATTACK_PRIORITY:SECOND]
			[ATTACK_FLAG_CANLATCH]
       [SET_TL_GROUP:BY_CATEGORY:EYE:NANOFLUID]
            [TL_COLOR_MODIFIER:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1:WHITE:1]
                [TLCM_NOUN:eye lights:PLURAL]
			[TL_COLOR_MODIFIER:GRAY:1]
				[TLCM_NOUN:crash avoiding placeholder:SINGULAR]
				[TLCM_TIMING:ROOT:50000:0:90000:0]
				
			]]
        }, 
        weight = 5 
    },
    {
        body_token = "MOUTH",
        desc_part = "It has a gigantic maw of many jointed, metallic teeth and many small, mechanical eyes growing from its head. ",
        eligible_rating_tags = {"EXISTENTIAL", "HOSTILE"},
        eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"}, 
        tok = {
		[[
		[EXTRAVISION]
		[ATTACK:STING:BODYPART:BY_CATEGORY:MOUTH]
			[ATTACK_SKILL:BITE]
			[ATTACK_VERB:bite:bites]
			[ATTACK_CONTACT_PERC:200]
			[ATTACK_PENETRATION_PERC:200]
			[ATTACK_FLAG_EDGE]
			[ATTACK_PREPARE_AND_RECOVER:3:3]
			[ATTACK_PRIORITY:SECOND]
			[ATTACK_FLAG_CANLATCH]
			]]
        }, 
        weight = 5 
    }
    },

	
	
    procgen_addon_table_3 = {
           {
        body_token = "",
        desc_part = "It is covered with sporadic dermal plating growing from its nanomechanical tissues. ",
        eligible_rating_tags = {"DANGEROUS", "HOSTILE", "EXISTENTIAL", "SOPHONT"},
        eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
        tok = {
		[[
		
		
                [TISSUE:DERMAL]
                    [TISSUE_NAME:dermal plating:NP]
                    [TISSUE_MATERIAL:INORGANIC:ALLOY]
                    [HEALING_RATE:100]
                    [RELATIVE_THICKNESS:1]
                    [CONNECTS]
                    [TISSUE_SHAPE:LAYER]
                [TISSUE_LAYER_OVER:BY_CATEGORY:ALL:DERMAL]
					
	[SET_TL_GROUP:BY_CATEGORY:ALL:DERMAL]
	[BP_APPEARANCE_MODIFIER:THICKNESS:0:70:90:100:110:130:200]
		[APP_MOD_IMPORTANCE:10000]
			[APP_MOD_NOUN:dermal plating:SINGULAR]

	[SET_TL_GROUP:BY_TOKEN:HD:DERMAL]
	[BP_APPEARANCE_MODIFIER:DENSE:0:70:90:100:110:130:200]
		[APP_MOD_IMPORTANCE:10000]
			[APP_MOD_NOUN:upper facial plating:SINGULAR]

	[SET_TL_GROUP:BY_TOKEN:HD:DERMAL]
	[BP_APPEARANCE_MODIFIER:DENSE:0:70:90:100:110:130:200]
		[APP_MOD_IMPORTANCE:10000]
			[APP_MOD_NOUN:lower facial plating:SINGULAR]

	[SET_TL_GROUP:BY_CATEGORY:HAND:DERMAL]
	[BP_APPEARANCE_MODIFIER:DENSE:0:70:90:100:110:130:200]
		[APP_MOD_IMPORTANCE:10000]
			[APP_MOD_NOUN:right arm plating:SINGULAR]

	[SET_TL_GROUP:BY_CATEGORY:HAND:DERMAL]
	[BP_APPEARANCE_MODIFIER:DENSE:0:70:90:100:110:130:200]
		[APP_MOD_IMPORTANCE:10000]
			[APP_MOD_NOUN:left arm plating:SINGULAR]

	[SET_TL_GROUP:BY_TOKEN:UB:DERMAL]
	[BP_APPEARANCE_MODIFIER:DENSE:0:70:90:100:110:130:200]
		[APP_MOD_IMPORTANCE:10000]
			[APP_MOD_NOUN:leg plating:SINGULAR]

	[SET_TL_GROUP:BY_TOKEN:UB:DERMAL]
	[BP_APPEARANCE_MODIFIER:DENSE:0:70:90:100:110:130:200]
		[APP_MOD_IMPORTANCE:10000]
			[APP_MOD_NOUN:upper body plating:SINGULAR]

	[SET_TL_GROUP:BY_TOKEN:LB:DERMAL]
	[BP_APPEARANCE_MODIFIER:DENSE:0:70:90:100:110:130:200]
		[APP_MOD_IMPORTANCE:10000]
			[APP_MOD_NOUN:lower body plating:SINGULAR]
		
			]]
        }, 
        weight = 5 
    },
    {
        body_token = "",
        desc_part = "A lethally corrosive nanomachine fluid leaks from tears and holes in its body. ",
        eligible_rating_tags = {"VERMIN", "HAZARDOUS", "PROBLEMATIC"},
        eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
        tok = {
		[[
		
				[SECRETION:CREATURE_MAT:NANITE:FLUID:LIQUID:BY_CATEGORY:ALL:SKIN]
			]]
        }, 
        weight = 5 
   
    }
    },

	
	
	
    -- ============================================================================
    -- Flowchart Data
    -- ============================================================================
    flowchart_data = {
    
        procgen_subchart_table_blob = {
			{
                body_token = "",
                desc_part = "It crawls on the ground as an amorphous, shapeless mass. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
			[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
			[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
			[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
			[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				]]}, 
                weight = 50
            },
			{
                body_token = "",
                desc_part = "It slithers along the ground with an elongated, tubular body. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[  
			[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
			[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
			[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
			[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				]]}, 
                weight = 50
            },
			{
                body_token = "",
                desc_part = "It slithers along the ground with an elongated, flattened body pulled by many small, jointed legs on its sides. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[  
			[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
			[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
			[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
			[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				]]}, 
                weight = 50
            },
			{
                body_token = "",
                desc_part = "It has a teardrop-shaped body pulled by many small, jointed legs at its front. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[  
			[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
			[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
			[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
			[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
				]]}, 
                weight = 50
            }
			},
			
        procgen_subchart_table_humanoid = {
			{
                body_token = "BIORIGHTARM:BIOLEFTARM:BIORIGHTLEG:BIOLEFTLEG:5FINGERS:5TOES:",
                desc_part = "It has humanoid limbs and an upright posture, its hands and feet ending in long digits of metallic bone. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"SOPHONT", "HOSTILE"},
				eligible_size_tags = { "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
				tok = {[[ 
				
				[FLIER]
			[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:657:438:219:1900:2900] 40 kph
			[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:657:438:219:1900:2900] 40 kph
			[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:900:657:438:219:1900:2900] 40 kph
			[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
			[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:657:438:219:1900:2900] 40 kph
				
	[ATTACK:PUNCH:BODYPART:BY_TYPE:GRASP]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:punch:punches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:kick:kicks]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]	
	[ATTACK:PUNCH:BODYPART:BY_TYPE:GRASP]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:claw:claws]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
				]]}, 
                weight = 50
            },
			{
                body_token = "2WINGS:BIORIGHTARM:BIOLEFTARM:BIORIGHTLEG:BIOLEFTLEG:5FINGERS:5TOES:",
                desc_part = "It has an upright posture, with digitigrade legs, long arms, and ragged wings, its hands and feet ending in long digits of metallic bone. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "AMBIENT", "VERMIN"},
				eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[ 
				
				[FLIER]
			[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:657:438:219:1900:2900] 40 kph
			[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:657:438:219:1900:2900] 40 kph
			[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:900:657:438:219:1900:2900] 40 kph
			[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
			[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:657:438:219:1900:2900] 40 kph
				
	[ATTACK:PUNCH:BODYPART:BY_TYPE:GRASP]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:punch:punches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:kick:kicks]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]	
	[ATTACK:PUNCH:BODYPART:BY_TYPE:GRASP]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:claw:claws]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
	[ATTACK:PUNCH:BODYPART:BY_TYPE:GRASP]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:claw:claws]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
		
				]]}, 
                weight = 50
            },
			{
                body_token = "4LEG:BIORIGHTARM:BIOLEFTARM:5FINGERS:5TOES:",
                desc_part = "It has an elongated, bestial body with four splayed legs and two arms, its hands and feet ending in long digits of metallic bone. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = { "MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[  
			[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:657:438:219:1900:2900] 40 kph
			[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:900:657:438:219:1900:2900] 40 kph
			[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
			[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:657:438:219:1900:2900] 40 kph
				
	[ATTACK:PUNCH:BODYPART:BY_TYPE:GRASP]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:punch:punches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:kick:kicks]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]	
	[ATTACK:PUNCH:BODYPART:BY_TYPE:GRASP]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:claw:claws]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
	[ATTACK:PUNCH:BODYPART:BY_TYPE:GRASP]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:claw:claws]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
				]]}, 
                weight = 50
            },
			{
                body_token = "4LEG:BIORIGHTARM:BIOLEFTARM:5FINGERS:5TOES:",
                desc_part = "It has an elongated, bestial body with four splayed legs, a pair of ragged wings, and two arms, its hands and feet ending in long digits of metallic bone. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "DANGEROUS"},
				eligible_size_tags = { "MEDIUM", "LARGE", "HUGE"}, 
				tok = {[[  
				[FLIER]
			[APPLY_CREATURE_VARIATION:STANDARD_FLYING_GAITS:900:657:438:219:1900:2900] 40 kph
			[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:657:438:219:1900:2900] 40 kph
			[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:900:657:438:219:1900:2900] 40 kph
			[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
			[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:657:438:219:1900:2900] 40 kph
				
	[ATTACK:PUNCH:BODYPART:BY_TYPE:GRASP]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:punch:punches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:kick:kicks]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]	
	[ATTACK:PUNCH:BODYPART:BY_TYPE:GRASP]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:claw:claws]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
	[ATTACK:PUNCH:BODYPART:BY_TYPE:GRASP]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:claw:claws]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
				]]}, 
                weight = 50
            },
			{
                body_token = "6LEG:BIORIGHTARM:BIOLEFTARM:5FINGERS:5TOES:",
                desc_part = "It has an elongated, bestial body with six splayed legs and two arms, its hands and feet ending in long digits of metallic bone. ",
				transcendent_desc_part = "",
				eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "HAZARDOUS", "DANGEROUS"},
				eligible_size_tags = { "LARGE", "HUGE"}, 
				tok = {[[  
			[APPLY_CREATURE_VARIATION:STANDARD_BIPED_GAITS:900:657:438:219:1900:2900] 40 kph
			[APPLY_CREATURE_VARIATION:STANDARD_CLIMBING_GAITS:900:657:438:219:1900:2900] 40 kph
			[APPLY_CREATURE_VARIATION:STANDARD_SWIMMING_GAITS:6561:6115:5683:1755:7456:8567] 5 kph
			[APPLY_CREATURE_VARIATION:STANDARD_CRAWLING_GAITS:900:657:438:219:1900:2900] 40 kph
				
	[ATTACK:PUNCH:BODYPART:BY_TYPE:GRASP]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:punch:punches]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
	[ATTACK:KICK:BODYPART:BY_TYPE:STANCE]
		[ATTACK_SKILL:STANCE_STRIKE]
		[ATTACK_VERB:kick:kicks]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:4:4]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:SECOND]
		[ATTACK_FLAG_BAD_MULTIATTACK]	
	[ATTACK:PUNCH:BODYPART:BY_TYPE:GRASP]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:claw:claws]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
	[ATTACK:PUNCH:BODYPART:BY_TYPE:GRASP]
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:claw:claws]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
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
					[CASTE:FEMALE][FEMALE][CREATURE_CLASS:NANOMACHINE_FEMALE]
					]],
                    description_addon = ""
                },
                {
                    tokens = [[
					[CASTE:MALE][MALE][CREATURE_CLASS:NANOMACHINE_MALE]
					]],
                    description_addon = ""
                }
            },
            shared_tokens = [[
			[SELECT_CASTE:ALL][POP_RATIO:100]
			[SET_BP_GROUP:BY_TYPE:LOWERBODY][BP_ADD_TYPE:GELDABLE]
			]],
            weight = 100,
				eligible_rating_tags = {"SOPHONT"},
				eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT"}, 
        },
        {
            castes = {
                {
                    tokens = [[
					[CASTE:CASTE1]
					]],
                    description_addon = ""
                }
            },
            shared_tokens = [[
			[SELECT_CASTE:ALL][POP_RATIO:100]
			]],
            weight = 100,
			eligible_rating_tags = {"BENIGN", "PROBLEMATIC", "DANGEROUS", "HAZARDOUS", "AMBIENT", "VERMIN"},
			eligible_size_tags = {"SMALL", "LESSER", "MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"}, 
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