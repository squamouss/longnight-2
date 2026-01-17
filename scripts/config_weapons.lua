return {
    THEME_CONFLICTS = {
        ["CHEM"]   = { "RAIL", "RAMJET" },
        ["RAIL"]   = { "CHEM", "RAMJET" },
        ["RAMJET"] = { "CHEM", "RAIL"   },
        ["TECHARM"] = { "SIMPLEARM", "FREAKARM" },
        ["SIMPLEARM"] = { "TECHARM", "FREAKARM" },
        ["FREAKARM"] = { "TECHARM", "SIMPLEARM"   }
    },

    WEAPON_THEME_MAP = {
        ["CHEMGUN"] = "CHEM",
        ["RAILGUN"] = "RAIL",  
        ["RAMJET"]  = "RAMJET"
    },
	
UNIVERSAL_THEME_DATA = {
        ["CHEM"]   = "[NATURAL_SKILL:THROW:1]",
        ["RAIL"]   = "[NATURAL_SKILL:THROW:3]",
        ["RAMJET"] = "[NATURAL_SKILL:THROW:2]"
    },

    WEAPONS = {
	
			
        TURRET_NOTHING_DANGER = {
			priority = 10,
            description = "NULL",
            body = "",
            interaction = [[
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "SCRAP", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM"},
            eligible_rating_tags = {"DANGEROUS", "HAZARDOUS" },
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 2.0
        },
		
        TURRET_NOTHING_HAZARD = {
			priority = 10,
            description = "NULL",
            body = "",
            interaction = [[
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "SCRAP", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM"},
            eligible_rating_tags = {"HAZARDOUS"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 10.0
        },
	
        CHEMGUN_TURRET = {
			priority = 10,
            theme = "CHEM", 
            description = "1CHEMGUN_TURRET",
            body = "[BODY:TURRET]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:15]
					[CDI:VERB:fire your turret:fires its turret:NA]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE" },
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "HAZARDOUS", "EXISTENTIAL"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 0.8
        },
        COILGUN_TURRET = {
			priority = 10,
            theme = "RAIL", 
            description = "1COILGUN_TURRET",
            body = "[BODY:TURRET]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE" },
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "HAZARDOUS", "EXISTENTIAL"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 0.8
        },
        RAMJET_TURRET = {
			priority = 10,
            theme = "RAMJET", 
            description = "1RAMJETGUN_TURRET",
            body = "[BODY:TURRET]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:45]
					[CDI:VERB:fire your turret:fires its turret:NA]
            ]],
        
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE" },
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "HAZARDOUS", "EXISTENTIAL"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 0.8
        },
        CHEMGUN_2TURRET = {
			priority = 10,
            theme = "CHEM", 
            description = "2CHEMGUN_TURRET",
            body = "[BODY:2TURRETLR]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"LARGE", "HUGE", "GIANT"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "HAZARDOUS", "EXISTENTIAL"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 0.6
        },
        COILGUN_2TURRET = {
			priority = 10,
            theme = "RAIL", 
            description = "2COILGUN_TURRET",
            body = "[BODY:2TURRETLR]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"LARGE", "HUGE", "GIANT"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "HAZARDOUS", "EXISTENTIAL"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 0.8
        },
        RAMJET_2TURRET = {
			priority = 10,
            theme = "RAMJET", 
            description = "2RAMJETGUN_TURRET",
            body = "[BODY:2TURRETLR]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
            ]],
        
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"LARGE", "HUGE", "GIANT"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "HAZARDOUS", "EXISTENTIAL"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 0.8
        },
        CHEMGUN_4TURRET = {
			priority = 10,
            theme = "CHEM", 
            description = "4CHEMGUN_TURRET",
            body = "[BODY:4TURRET]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT3]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT4]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:12]
					[CDI:VERB:fire your turret:fires its turret:NA]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "HAZARDOUS", "EXISTENTIAL"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 0.4
        },
        COILGUN_4TURRET = {
			priority = 10,
            theme = "RAIL", 
            description = "4COILGUN_TURRET",
            body = "[BODY:4TURRET]",
            interaction = [[
			
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT3]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT4]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "HAZARDOUS", "EXISTENTIAL"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 0.4
        },
        RAMJET_4TURRET = {
			priority = 10,
            theme = "RAMJET", 
            description = "4RAMJETGUN_TURRET",
            body = "[BODY:4TURRET]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT2]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT3]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
						
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT4]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your turret:fires its turret:NA]
            ]],
        
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "HAZARDOUS", "EXISTENTIAL"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 0.4
        },
      
			
			
			
			
			
			
			
			
		CHEMGUN_MILITARY_TURRET = {
			priority = 10,
            theme = "CHEM", 
            description = "1CHEMGUN_TURRET",
            body = "[BODY:TURRET]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:15]
					[CDI:VERB:fire your turret:fires its turret:NA]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"},
            eligible_rating_tags = {"WEAPON", "MILITARY"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 0.8
        },
        COILGUN_MILITARY_TURRET = {
			priority = 10,
            theme = "RAIL", 
            description = "1COILGUN_TURRET",
            body = "[BODY:TURRET]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your turret:fires its turret:NA]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"},
            eligible_rating_tags = {"WEAPON", "MILITARY"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 0.8
        },
        RAMJET_MILITARY_TURRET = {
			priority = 10,
            theme = "RAMJET", 
            description = "1RAMJETGUN_TURRET",
            body = "[BODY:TURRET]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:TRT1]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:45]
					[CDI:VERB:fire your turret:fires its turret:NA]
            ]],
        
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"},
            eligible_rating_tags = {"WEAPON", "MILITARY"},
            exclusion_group =  "BASIC_WEAPON", 
            pop_ratio_multiplier = 0.8
        },
			
			
			
			
			
			
			
			
			
			
			
       CHEMGUN_ROTORGUN = {
			priority = 10,
            theme = "CHEM", 
            description = "1CHEMGUN_ROTORGUN",
            body = "[BODY:ROTORGUN]",
            interaction = [[
								
					[CAN_DO_INTERACTION:ROTORGUN_CHEMICAL_UNLOCK]
						[CDI:ADV_NAME:Rotorgun]
						[CDI:USAGE_HINT:DEFEND]
					[CDI:BP_REQUIRED:BY_TOKEN:RG1]
						[CDI:TARGET:A:SELF_ONLY]
						[CDI:WAIT_PERIOD:600]
					[CDI:VERB:spin your rotorgun:spins its rotorgun:NA]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL", "WEAPON", "MILITARY"},
            exclusion_group =  "SECONDARY_WEAPON", 
            pop_ratio_multiplier = 0.6
        },
        COILGUN_ROTORGUN = {
			priority = 10,
            theme = "RAIL", 
            description = "1LIGHTGAS_ROTORGUN",
            body = "[BODY:ROTORGUN]",
            interaction = [[
					[CAN_DO_INTERACTION:ROTORGUN_LIGHTGAS_UNLOCK]
						[CDI:ADV_NAME:Rotorgun]
						[CDI:USAGE_HINT:DEFEND]
					[CDI:BP_REQUIRED:BY_TOKEN:RG1]
						[CDI:TARGET:A:SELF_ONLY]
						[CDI:WAIT_PERIOD:600]
					[CDI:VERB:spin your rotorgun:spins its rotorgun:NA]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL", "WEAPON", "MILITARY"},
            exclusion_group =  "SECONDARY_WEAPON", 
            pop_ratio_multiplier = 0.6
        },
        RAMJET_ROTORGUN = {
			priority = 10,
            theme = "RAMJET", 
            description = "1LIGHTGAS_ROTORGUN",
            body = "[BODY:ROTORGUN]",
            interaction = [[
					[CAN_DO_INTERACTION:ROTORGUN_LIGHTGAS_UNLOCK]
						[CDI:ADV_NAME:Rotorgun]
						[CDI:USAGE_HINT:DEFEND]
					[CDI:BP_REQUIRED:BY_TOKEN:RG1]
						[CDI:TARGET:A:SELF_ONLY]
						[CDI:WAIT_PERIOD:600]
					[CDI:VERB:spin your rotorgun:spins its rotorgun:NA]
            ]],
        
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL", "WEAPON", "MILITARY"},
            exclusion_group =  "SECONDARY_WEAPON", 
            pop_ratio_multiplier = 0.6
        },			
			
			
		
       CHEMGUN_CANNON_SECONDARY = {
			priority = 10,
            theme = "CHEM", 
            description = "1CHEMGUN_CANNON",
            body = "[BODY:CANNON]",
            interaction = [[
								
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN1]
					[CDI:MATERIAL:INORGANIC:SHELL:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:90]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"LARGE", "HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL", "WEAPON", "MILITARY"},
            exclusion_group =  "SECONDARY_WEAPON", 
            pop_ratio_multiplier = 0.6
        },
        COILGUN_CANNON_SECONDARY = {
			priority = 10,
            theme = "RAIL", 
            description = "1RAILGUN_CANNON",
            body = "[BODY:CANNON]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN1]
					[CDI:MATERIAL:INORGANIC:MAGROD_RAILGUN:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:150]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"LARGE", "HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL", "WEAPON", "MILITARY"},
            exclusion_group =  "SECONDARY_WEAPON", 
            pop_ratio_multiplier = 0.6
        },
        RAMJET_CANNON_SECONDARY = {
			priority = 10,
            theme = "RAMJET", 
            description = "1RAMJET_CANNON",
            body = "[BODY:CANNON]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN1]
					[CDI:MATERIAL:INORGANIC:SABOT_HEAVY:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
            ]],
        
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"LARGE", "HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL", "WEAPON", "MILITARY"},
            exclusion_group =  "SECONDARY_WEAPON", 
            pop_ratio_multiplier = 0.6
        },			
			
			
		
			
			
			
       CHEMGUN_2ROTORGUN = {
			priority = 10,
            theme = "CHEM", 
            description = "1CHEMGUN_ROTORGUN",
            body = "[BODY:ROTORGUN]",
            interaction = [[
					
					[CAN_DO_INTERACTION:ROTORGUN_CHEMICAL_UNLOCK]
						[CDI:ADV_NAME:Rotorgun]
						[CDI:USAGE_HINT:DEFEND]
					[CDI:BP_REQUIRED:BY_TOKEN:RG1]
						[CDI:TARGET:A:SELF_ONLY]
						[CDI:WAIT_PERIOD:600]
					[CDI:VERB:spin your rotorgun:spins its rotorgun:NA]
								
					[CAN_DO_INTERACTION:ROTORGUN_CHEMICAL2_UNLOCK]
						[CDI:ADV_NAME:Rotorgun]
						[CDI:USAGE_HINT:DEFEND]
					[CDI:BP_REQUIRED:BY_TOKEN:RG2]
						[CDI:TARGET:A:SELF_ONLY]
						[CDI:WAIT_PERIOD:600]
					[CDI:VERB:spin your rotorgun:spins its rotorgun:NA]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL", "WEAPON", "MILITARY"},
            exclusion_group =  "SECONDARY_WEAPON", 
            pop_ratio_multiplier = 0.2
        },
        COILGUN_2ROTORGUN = {
			priority = 10,
            theme = "RAIL", 
            description = "1LIGHTGAS_ROTORGUN",
            body = "[BODY:ROTORGUN]",
            interaction = [[
					[CAN_DO_INTERACTION:ROTORGUN_LIGHTGAS_UNLOCK]
						[CDI:ADV_NAME:Rotorgun]
						[CDI:USAGE_HINT:DEFEND]
					[CDI:BP_REQUIRED:BY_TOKEN:RG1]
						[CDI:TARGET:A:SELF_ONLY]
						[CDI:WAIT_PERIOD:600]
					[CDI:VERB:spin your rotorgun:spins its rotorgun:NA]
								
					[CAN_DO_INTERACTION:ROTORGUN_LIGHTGAS2_UNLOCK]
						[CDI:ADV_NAME:Rotorgun]
						[CDI:USAGE_HINT:DEFEND]
					[CDI:BP_REQUIRED:BY_TOKEN:RG2]
						[CDI:TARGET:A:SELF_ONLY]
						[CDI:WAIT_PERIOD:600]
					[CDI:VERB:spin your rotorgun:spins its rotorgun:NA]
					
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL", "WEAPON", "MILITARY"},
            exclusion_group =  "SECONDARY_WEAPON", 
            pop_ratio_multiplier = 0.2
        },
        RAMJET_2ROTORGUN = {
			priority = 10,
            theme = "RAMJET", 
            description = "1LIGHTGAS_ROTORGUN",
            body = "[BODY:ROTORGUN]",
            interaction = [[
					[CAN_DO_INTERACTION:ROTORGUN_LIGHTGAS_UNLOCK]
						[CDI:ADV_NAME:Rotorgun]
						[CDI:USAGE_HINT:DEFEND]
					[CDI:BP_REQUIRED:BY_TOKEN:RG1]
						[CDI:TARGET:A:SELF_ONLY]
						[CDI:WAIT_PERIOD:600]
					[CDI:VERB:spin your rotorgun:spins its rotorgun:NA]
								
					[CAN_DO_INTERACTION:ROTORGUN_LIGHTGAS2_UNLOCK]
						[CDI:ADV_NAME:Rotorgun]
						[CDI:USAGE_HINT:DEFEND]
					[CDI:BP_REQUIRED:BY_TOKEN:RG2]
						[CDI:TARGET:A:SELF_ONLY]
						[CDI:WAIT_PERIOD:600]
					[CDI:VERB:spin your rotorgun:spins its rotorgun:NA]
					
            ]],
        
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL", "WEAPON", "MILITARY"},
            exclusion_group =  "SECONDARY_WEAPON", 
            pop_ratio_multiplier = 0.2
        },			
			
			
			
			
       MICROMISSILE = {
			priority = 10, 
            description = "MICROMISSILE_POD",
            body = "[BODY:MISSILE_POD]",
            interaction = [[
													
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:pod]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:MP1]
					[CDI:MATERIAL:INORGANIC:MICROMISSILE:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:6]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:launch micromissiles:launches micromissiles:NA]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"LARGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL", "WEAPON", "MILITARY"},
            exclusion_group =  "SECONDARY_WEAPON", 
            pop_ratio_multiplier = 0.6
        },
			
				
			
			
			
       MICROMISSILE = {
			priority = 10, 
            description = "MICROMISSILE_POD",
            body = "[BODY:MISSILE_POD]",
            interaction = [[
													
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:pod]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:MP1]
					[CDI:MATERIAL:INORGANIC:MICROMISSILE:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:6]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:launch micromissiles:launches micromissiles:NA]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL", "WEAPON", "MILITARY"},
            exclusion_group =  "MISSILE_WEAPON", 
            pop_ratio_multiplier = 0.6
        },
        MICROMISSILE_2 = {
			priority = 10,
            description = "MICROMISSILE_POD",
            body = "[BODY:MISSILE_POD]",
            interaction = [[
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:pod]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:MP1]
					[CDI:MATERIAL:INORGANIC:MICROMISSILE:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:6]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:launch micromissiles:launches micromissiles:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:pod]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:MP2]
					[CDI:MATERIAL:INORGANIC:MICROMISSILE:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:6]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:launch micromissiles:launches micromissiles:NA]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL", "WEAPON", "MILITARY"},
            exclusion_group =  "MISSILE_WEAPON", 
            pop_ratio_multiplier = 0.6
        },
        MICROMISSILE_4 = {
			priority = 10,
            description = "1LIGHTGAS_ROTORGUN",
            body = "[BODY:ROTORGUN]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:pod]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:MP1]
					[CDI:MATERIAL:INORGANIC:MICROMISSILE:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:6]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:launch micromissiles:launches micromissiles:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:pod]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:MP2]
					[CDI:MATERIAL:INORGANIC:MICROMISSILE:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:6]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:launch micromissiles:launches micromissiles:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:pod]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:MP1]
					[CDI:MATERIAL:INORGANIC:MICROMISSILE:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:6]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:launch micromissiles:launches micromissiles:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:pod]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:MP2]
					[CDI:MATERIAL:INORGANIC:MICROMISSILE:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:6]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:launch micromissiles:launches micromissiles:NA]
            ]],
        
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL", "WEAPON", "MILITARY"},
            exclusion_group =  "MISSILE_WEAPON", 
            pop_ratio_multiplier = 0.6
        },			
			
			
			
			
			
			
			
			
			
			
			
			
		
       CHEMGUN_CANNON_SECONDARY = {
			priority = 10,
            theme = "CHEM", 
            description = "1CHEMGUN_CANNON",
            body = "[BODY:CANNON]",
            interaction = [[
								
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN1]
					[CDI:MATERIAL:INORGANIC:SHELL:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:90]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"LARGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL", "WEAPON", "MILITARY"},
            exclusion_group =  "SECONDARY_WEAPON", 
            pop_ratio_multiplier = 0.6
        },
        COILGUN_CANNON_SECONDARY = {
			priority = 10,
            theme = "RAIL", 
            description = "1RAILGUN_CANNON",
            body = "[BODY:CANNON]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN1]
					[CDI:MATERIAL:INORGANIC:MAGROD_RAILGUN:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:150]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"LARGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL", "WEAPON", "MILITARY"},
            exclusion_group =  "SECONDARY_WEAPON", 
            pop_ratio_multiplier = 0.6
        },
        RAMJET_CANNON_SECONDARY = {
			priority = 10,
            theme = "RAMJET", 
            description = "1RAMJET_CANNON",
            body = "[BODY:CANNON]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN1]
					[CDI:MATERIAL:INORGANIC:SABOT_HEAVY:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
            ]],
        
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"LARGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL", "WEAPON", "MILITARY"},
            exclusion_group =  "SECONDARY_WEAPON", 
            pop_ratio_multiplier = 0.6
        },			
			
			
		
       CHEMGUN_CANNON = {
			priority = 10,
            theme = "CHEM", 
            description = "1CHEMGUN_CANNON",
            body = "[BODY:CANNON]",
            interaction = [[
								
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN1]
					[CDI:MATERIAL:INORGANIC:SHELL:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:90]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL", "WEAPON", "MILITARY"},
            exclusion_group =  "MAIN_WEAPON", 
            pop_ratio_multiplier = 0.6
        },
        COILGUN_CANNON = {
			priority = 10,
            theme = "RAIL", 
            description = "1RAILGUN_CANNON",
            body = "[BODY:CANNON]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN1]
					[CDI:MATERIAL:INORGANIC:MAGROD_RAILGUN:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:150]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL", "WEAPON", "MILITARY"},
            exclusion_group =  "MAIN_WEAPON", 
            pop_ratio_multiplier = 0.6
        },
        RAMJET_CANNON = {
			priority = 10,
            theme = "RAMJET", 
            description = "1RAMJET_CANNON",
            body = "[BODY:CANNON]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN1]
					[CDI:MATERIAL:INORGANIC:SABOT_HEAVY:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
            ]],
        
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL", "WEAPON", "MILITARY"},
            exclusion_group =  "MAIN_WEAPON", 
            pop_ratio_multiplier = 0.6
        },			
			
		
       CHEMGUN_CANNON2 = {
			priority = 10,
            theme = "CHEM", 
            description = "2CHEMGUN_CANNON",
            body = "[BODY:CANNON]",
            interaction = [[
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN1]
					[CDI:MATERIAL:INORGANIC:MAGROD_RAILGUN:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:150]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN2]
					[CDI:MATERIAL:INORGANIC:SHELL:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:90]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL", "WEAPON", "MILITARY"},
            exclusion_group =  "MAIN_WEAPON", 
            pop_ratio_multiplier = 0.6
        },
        COILGUN_CANNON2 = {
			priority = 10,
            theme = "RAIL", 
            description = "2RAILGUN_CANNON",
            body = "[BODY:2CANNON]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN1]
					[CDI:MATERIAL:INORGANIC:MAGROD_RAILGUN:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:150]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN2]
					[CDI:MATERIAL:INORGANIC:MAGROD_RAILGUN:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:150]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL", "WEAPON", "MILITARY"},
            exclusion_group =  "MAIN_WEAPON", 
            pop_ratio_multiplier = 0.6
        },
        RAMJET_CANNON2 = {
			priority = 10,
            theme = "RAMJET", 
            description = "2RAMJET_CANNON",
            body = "[BODY:2CANNON]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN1]
					[CDI:MATERIAL:INORGANIC:SABOT_HEAVY:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
					
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:cannon]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:CN2]
					[CDI:MATERIAL:INORGANIC:SABOT_HEAVY:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:300]
					[CDI:VERB:fire your cannon:fires its cannon:NA]
            ]],
        
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL", "WEAPON", "MILITARY"},
            exclusion_group =  "MAIN_WEAPON", 
            pop_ratio_multiplier = 0.6
        },			
			
			
		
       MISSILE_BATTERY = {
			priority = 10, 
            description = "MISSILE_BATTERY",
            body = "[BODY:MISSILE_BATTERY]",
            interaction = [[
													
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:pod]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:MP1]
					[CDI:MATERIAL:INORGANIC:MISSILE:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:50]
					[CDI:WAIT_PERIOD:1200]
					[CDI:VERB:launch missiles:launches missiles:NA]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "HORROR", "OGRE", "HUMAN", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "SKINWALKER", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC" },
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL", "WEAPON", "MILITARY"},
            exclusion_group =  "MAIN_WEAPON", 
            pop_ratio_multiplier = 0.2
        },
			
				
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
	
		
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================		
			
			
			
			
			
			
			
			
			
			
			
        RIGHTARM_NOTHING = {
			priority = 20,
            description = "NULL",
            body = "",
            interaction = [[
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON", 
            pop_ratio_multiplier = 1.0
        },
        LEFTARM_NOTHING = {
			priority = 30,
            description = "NULL",
            body = "",
            interaction = [[
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON", 
            pop_ratio_multiplier = 1.0
        },
			
			
        RIGHTARM_NOTHING2 = {
			priority = 40,
            description = "NULL",
            body = "",
            interaction = [[
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON2", 
            pop_ratio_multiplier = 1.0
        },
        LEFTARM_NOTHING2 = {
			priority = 50,
            description = "NULL",
            body = "",
            interaction = [[
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON2", 
            pop_ratio_multiplier = 1.0
        },
		
			
			
			
			
			
			
			
        RIGHTARM_CHEMGUN = {
			priority = 20,
            theme = "CHEM", 
            description = "CHEMGUN_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM:RIGHTGUN]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:RGUN]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your arm-gun:fires its arm-gun:NA]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"LARGE", "HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_CHEMGUN = {
			priority = 30,
            theme = "CHEM", 
            description = "CHEMGUN_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM:LEFTGUN]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:LGUN]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your arm-gun:fires its arm-gun:NA]
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"LARGE", "HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
			
        RIGHTARM_CHEMGUN2 = {
			priority = 40,
            theme = "CHEM", 
            description = "CHEMGUN_2ND_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM2:RIGHTGUN2]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:RGUN2]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your arm-gun:fires its arm-gun:NA]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_CHEMGUN2 = {
			priority = 50,
            theme = "CHEM", 
            description = "CHEMGUN_2ND_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM2:LEFTGUN2]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:LGUN2]
					[CDI:MATERIAL:INORGANIC:BULLET:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:30]
					[CDI:VERB:fire your arm-gun:fires its arm-gun:NA]	
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
			
			
			
			
        RIGHTARM_RAILGUN = {
			priority = 20,
            theme = "RAIL", 
            description = "COILGUN_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM:RIGHTGUN]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:RGUN]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your arm-gun:fires its arm-gun:NA]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"LARGE", "HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_RAILGUN = {
			priority = 30,
            theme = "RAIL", 
            description = "COILGUN_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM:LEFTGUN]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:LGUN]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your arm-gun:fires its arm-gun:NA]
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"LARGE", "HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
			
        RIGHTARM_RAILGUN2 = {
			priority = 40,
            theme = "RAIL", 
            description = "COILGUN_2ND_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM2:RIGHTGUN2]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:RGUN2]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your arm-gun:fires its arm-gun:NA]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_RAILGUN2 = {
			priority = 50,
            theme = "RAIL", 
            description = "COILGUN_2ND_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM2:LEFTGUN2]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:LGUN2]
					[CDI:MATERIAL:INORGANIC:MAGROD_COILGUN:SOLID_GLOB]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:60]
					[CDI:VERB:fire your arm-gun:fires its arm-gun:NA]	
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
			
			
			
	
        RIGHTARM_RAMJETGUN = {
			priority = 20,
            theme = "RAMJET", 
            description = "RAMJETGUN_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM:RIGHTGUN]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:RGUN]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:90]
					[CDI:VERB:fire your arm-gun:fires its arm-gun:NA]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"LARGE", "HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_RAMJETGUN = {
			priority = 30,
            theme = "RAMJET", 
            description = "RAMJETGUN_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM:LEFTGUN]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:LGUN]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:90]
					[CDI:VERB:fire your arm-gun:fires its arm-gun:NA]
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"LARGE", "HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
			
        RIGHTARM_RAMJETGUN2 = {
			priority = 40,
            theme = "RAMJET", 
            description = "RAMJETGUN_2ND_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM2:RIGHTGUN2]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:RGUN2]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:90]
					[CDI:VERB:fire your arm-gun:fires its arm-gun:NA]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_RAMJETGUN2 = {
			priority = 50,
            theme = "RAMJET", 
            description = "RAMJETGUN_2ND_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM2:LEFTGUN2]",
            interaction = [[
					[CAN_DO_INTERACTION:MATERIAL_EMISSION]
					[CDI:ADV_NAME:turret]
					[CDI:USAGE_HINT:ATTACK]
					[CDI:BP_REQUIRED:BY_TOKEN:LGUN2]
					[CDI:MATERIAL:INORGANIC:SABOT_LIGHT:SHARP_ROCK]
					[CDI:TARGET:C:LINE_OF_SIGHT]
					[CDI:TARGET_RANGE:C:500]
					[CDI:MAX_TARGET_NUMBER:C:1]
					[CDI:WAIT_PERIOD:90]
					[CDI:VERB:fire your arm-gun:fires its arm-gun:NA]	
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "HYBRID", "BLINDSIGHT", "CYBORG", "FULLBODY" },
            eligible_size_tags = {"HUGE"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
			
				
				

		
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================						
				
				
			
        RIGHTARM_BLADE = {
			priority = 20,
            theme = "SIMPLEARM", 
            description = "BLADE_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM:RIGHTBLADE]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:RBLADE]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:slash:slashes]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:10]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
	[ATTACK:KICK:BODYPART:BY_TOKEN:RBLADE]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:stab:stabs]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "OGRE", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "PRISTINE", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_BLADE = {
			priority = 30,
            theme = "SIMPLEARM", 
            description = "BLADE_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM:LEFTBLADE]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:LBLADE]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:slash:slashes]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:10]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
	[ATTACK:KICK:BODYPART:BY_TOKEN:LBLADE]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:stab:stabs]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "OGRE", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "PRISTINE", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
			
        RIGHTARM_BLADE2 = {
			priority = 40,
            theme = "SIMPLEARM", 
            description = "BLADE_2ND_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM2:RIGHTBLADE2]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:RBLADE2]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:slash:slashes]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:10]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
	[ATTACK:KICK:BODYPART:BY_TOKEN:RBLADE2]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:stab:stabs]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "OGRE", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "PRISTINE", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_BLADE2 = {
			priority = 50,
            theme = "SIMPLEARM", 
            description = "BLADE_2ND_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM2:LEFTBLADE2]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:LBLADE2]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:slash:slashes]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:10]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
	[ATTACK:KICK:BODYPART:BY_TOKEN:LBLADE2]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:stab:stabs]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "OGRE", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "PRISTINE", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
		
		
        RIGHTARM_LANCE = {
			priority = 20,
            theme = "SIMPLEARM", 
            description = "LANCE_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM:RIGHTLANCE]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:RLANCE]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:stab:stabs]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "OGRE", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "PRISTINE", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_LANCE = {
			priority = 30,
            theme = "SIMPLEARM", 
            description = "LANCE_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM:LEFTLANCE]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:LLANCE]	
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:stab:stabs]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "OGRE", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "PRISTINE", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
			
        RIGHTARM_LANCE2 = {
			priority = 40,
            theme = "SIMPLEARM", 
            description = "LANCE_2ND_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM2:RIGHTLANCE2]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:RLANCE2]			
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:stab:stabs]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "OGRE", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "PRISTINE", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_LANCE2 = {
			priority = 50,
            theme = "SIMPLEARM", 
            description = "LANCE_2ND_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM2:LEFTLANCE2]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:LLANCE2]			
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:stab:stabs]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "OGRE", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "PRISTINE", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
		
		
		
        RIGHTARM_AXE = {
			priority = 20,
            theme = "SIMPLEARM", 
            description = "AXE_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM:RIGHTAXE]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:RAXE]				
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:hack:hacks]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:10]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "OGRE", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "PRISTINE", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_AXE = {
			priority = 30,
            theme = "SIMPLEARM", 
            description = "AXE_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM:LEFTAXE]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:LAXE]				
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:hack:hacks]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:10]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "OGRE", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "PRISTINE", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
			
        RIGHTARM_AXE2 = {
			priority = 40,
            theme = "SIMPLEARM", 
            description = "AXE_2ND_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM2:RIGHTAXE2]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:RAXE2]					
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:hack:hacks]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:10]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "OGRE", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "PRISTINE", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_AXE2 = {
			priority = 50,
            theme = "SIMPLEARM", 
            description = "AXE_2ND_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM2:LEFTAXE2]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:LAXE2]			
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:hack:hacks]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:10]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "OGRE", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "PRISTINE", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
		
		
		
        RIGHTARM_MAUL = {
			priority = 20,
            theme = "SIMPLEARM", 
            description = "MAUL_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM:RIGHTMAUL]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:RMAUL]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:strike:strike]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "OGRE", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "PRISTINE", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_MAUL = {
			priority = 30,
            theme = "SIMPLEARM", 
            description = "MAUL_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM:LEFTMAUL]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:LMAUL]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:strike:strike]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "OGRE", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "PRISTINE", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
			
        RIGHTARM_MAUL2 = {
			priority = 40,
            theme = "SIMPLEARM", 
            description = "MAUL_2ND_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM2:RIGHTMAUL2]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:RMAUL2]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:strike:strike]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "OGRE", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "PRISTINE", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_MAUL2 = {
			priority = 50,
            theme = "SIMPLEARM", 
            description = "MAUL_2ND_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM2:LEFTMAUL2]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:LMAUL2]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:strike:strike]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "HOLOMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"DEVIL", "OGRE", "ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "SWARM", "FRANKENSTEIN", "PRISTINE", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
		
		
		
	
		
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================			
		
			
        RIGHTARM_SCYTHE = {
			priority = 20,
            theme = "FREAKARM", 
            description = "SCYTHE_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM:RIGHTSCYTHE]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:RSCYTHE]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:slash:slashes]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:10]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
	[ATTACK:KICK:BODYPART:BY_TOKEN:RSCYTHE]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:stab:stabs]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"HORROR", "DOLL", "SCRAP", "SKINWALKER", "SWARM", "FRANKENSTEIN", "CORRUPT", "HYBRID", "CHAOS", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_SCYTHE = {
			priority = 30,
            theme = "FREAKARM", 
            description = "SCYTHE_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM:LEFTSCYTHE]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:LSCYTHE]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:slash:slashes]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:10]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
	[ATTACK:KICK:BODYPART:BY_TOKEN:LSCYTHE]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:stab:stabs]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"HORROR", "DOLL", "SCRAP", "SKINWALKER", "SWARM", "FRANKENSTEIN", "CORRUPT", "HYBRID", "CHAOS", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
			
        RIGHTARM_SCYTHE2 = {
			priority = 40,
            theme = "FREAKARM", 
            description = "SCYTHE_2ND_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM2:RIGHTSCYTHE2]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:RSCYTHE2]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:slash:slashes]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:10]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
	[ATTACK:KICK:BODYPART:BY_TOKEN:RSCYTHE2]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:stab:stabs]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"HORROR", "DOLL", "SCRAP", "SKINWALKER", "SWARM", "FRANKENSTEIN", "CORRUPT", "HYBRID", "CHAOS", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_SCYTHE2 = {
			priority = 50,
            theme = "FREAKARM", 
            description = "SCYTHE_2ND_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM2:LEFTSCYTHE2]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:LSCYTHE2]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:slash:slashes]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:10]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
	[ATTACK:KICK:BODYPART:BY_TOKEN:LSCYTHE2]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:stab:stabs]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"HORROR", "DOLL", "SCRAP", "SKINWALKER", "SWARM", "FRANKENSTEIN", "CORRUPT", "HYBRID", "CHAOS", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
		
		
		
			
        RIGHTARM_STINGER = {
			priority = 20,
            theme = "FREAKARM", 
            description = "STINGER_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM:RIGHTSTINGER]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:RSTINGER]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:stab:stabs]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"HORROR", "DOLL", "SCRAP", "SKINWALKER", "SWARM", "FRANKENSTEIN", "CORRUPT", "HYBRID", "CHAOS", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_STINGER = {
			priority = 30,
            theme = "FREAKARM", 
            description = "STINGER_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM:LEFTSTINGER]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:LSTINGER]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:stab:stabs]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"HORROR", "DOLL", "SCRAP", "SKINWALKER", "SWARM", "FRANKENSTEIN", "CORRUPT", "HYBRID", "CHAOS", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
			
        RIGHTARM_STINGER2 = {
			priority = 40,
            theme = "FREAKARM", 
            description = "STINGER_2ND_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM2:RIGHTSTINGER2]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:RSTINGER2]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:stab:stabs]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"HORROR", "DOLL", "SCRAP", "SKINWALKER", "SWARM", "FRANKENSTEIN", "CORRUPT", "HYBRID", "CHAOS", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_STINGER2 = {
			priority = 50,
            theme = "FREAKARM", 
            description = "STINGER_2ND_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM2:LEFTSTINGER2]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:LSTINGER2]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:stab:stabs]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"HORROR", "DOLL", "SCRAP", "SKINWALKER", "SWARM", "FRANKENSTEIN", "CORRUPT", "HYBRID", "CHAOS", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
		
		
			
        RIGHTARM_PINCER = {
			priority = 20,
            theme = "FREAKARM", 
            description = "PINCER_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM:RIGHTPINCER]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:RPINCER]	
            [ATTACK_SKILL:BITE]
            [ATTACK_VERB:snatch at:snatches at]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
            [ATTACK_FLAG_CANLATCH]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"HORROR", "DOLL", "SCRAP", "SKINWALKER", "SWARM", "FRANKENSTEIN", "CORRUPT", "HYBRID", "CHAOS", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_PINCER = {
			priority = 30,
            theme = "FREAKARM", 
            description = "PINCER_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM:LEFTPINCER]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:LPINCER]	
            [ATTACK_SKILL:BITE]
            [ATTACK_VERB:snatch at:snatches at]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
            [ATTACK_FLAG_CANLATCH]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"HORROR", "DOLL", "SCRAP", "SKINWALKER", "SWARM", "FRANKENSTEIN", "CORRUPT", "HYBRID", "CHAOS", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
			
        RIGHTARM_PINCER2 = {
			priority = 40,
            theme = "FREAKARM", 
            description = "PINCER_2ND_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM2:RIGHTPINCER2]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:RPINCER2]		
            [ATTACK_SKILL:BITE]
            [ATTACK_VERB:snatch at:snatches at]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
            [ATTACK_FLAG_CANLATCH]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"HORROR", "DOLL", "SCRAP", "SKINWALKER", "SWARM", "FRANKENSTEIN", "CORRUPT", "HYBRID", "CHAOS", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_PINCER2 = {
			priority = 50,
            theme = "FREAKARM", 
            description = "PINCER_2ND_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM2:LEFTPINCER2]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:LPINCER2]		
            [ATTACK_SKILL:BITE]
            [ATTACK_VERB:snatch at:snatches at]
            [ATTACK_CONTACT_PERC:100]
            [ATTACK_PENETRATION_PERC:100]
            [ATTACK_FLAG_EDGE]
            [ATTACK_PREPARE_AND_RECOVER:3:3]
            [ATTACK_PRIORITY:SECOND]
            [ATTACK_FLAG_CANLATCH]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"HORROR", "DOLL", "SCRAP", "SKINWALKER", "SWARM", "FRANKENSTEIN", "CORRUPT", "HYBRID", "CHAOS", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
		
		
			
        RIGHTARM_CLUB = {
			priority = 20,
            theme = "FREAKARM", 
            description = "CLUB_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM:RIGHTCLUB]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:RCLUB]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:strike:strike]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"HORROR", "DOLL", "SCRAP", "SKINWALKER", "SWARM", "FRANKENSTEIN", "CORRUPT", "HYBRID", "CHAOS", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_CLUB = {
			priority = 30,
            theme = "FREAKARM", 
            description = "CLUB_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM:LEFTCLUB]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:LCLUB]				
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:strike:strike]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"HORROR", "DOLL", "SCRAP", "SKINWALKER", "SWARM", "FRANKENSTEIN", "CORRUPT", "HYBRID", "CHAOS", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
			
        RIGHTARM_CLUB2 = {
			priority = 40,
            theme = "FREAKARM", 
            description = "CLUB_2ND_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM2:RIGHTCLUB2]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:RCLUB2]			
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:strike:strike]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"HORROR", "DOLL", "SCRAP", "SKINWALKER", "SWARM", "FRANKENSTEIN", "CORRUPT", "HYBRID", "CHAOS", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_CLUB2 = {
			priority = 50,
            theme = "FREAKARM", 
            description = "CLUB_2ND_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM2:LEFTCLUB2]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:LCLUB2]				
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:strike:strike]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"HORROR", "DOLL", "SCRAP", "SKINWALKER", "SWARM", "FRANKENSTEIN", "CORRUPT", "HYBRID", "CHAOS", "BLINDSIGHT", "CYBORG", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
		
		
		
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================	
--=================================================================================================================		
		
		
			
        RIGHTARM_PILEBUNKER = {
			priority = 20,
            theme = "TECHARM", 
            description = "PILEBUNKER_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM:RIGHTPILEBUNKER]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:RPILEBUNKER]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:strike:strike]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PREPARE_AND_RECOVER:1:6]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_PILEBUNKER = {
			priority = 30,
            theme = "TECHARM", 
            description = "PILEBUNKER_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM:LEFTPILEBUNKER]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:LPILEBUNKER]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:strike:strike]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PREPARE_AND_RECOVER:1:6]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
			
        RIGHTARM_PILEBUNKER2 = {
			priority = 40,
            theme = "TECHARM", 
            description = "PILEBUNKER_2ND_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM2:RIGHTPILEBUNKER2]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:RPILEBUNKER2]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:strike:strike]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PREPARE_AND_RECOVER:1:6]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_PILEBUNKER2 = {
			priority = 50,
            theme = "TECHARM", 
            description = "PILEBUNKER_2ND_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM2:LEFTPILEBUNKER2]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:LPILEBUNKER2]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:strike:strike]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PREPARE_AND_RECOVER:1:6]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
		
		
			
        RIGHTARM_DRILL = {
			priority = 20,
            theme = "TECHARM", 
            description = "DRILL_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM:RIGHTDRILL]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:RDRILL]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:drill:drills]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_DRILL = {
			priority = 30,
            theme = "TECHARM", 
            description = "DRILL_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM:LEFTDRILL]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:LDRILL]	
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:drill:drills]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
			
        RIGHTARM_DRILL2 = {
			priority = 40,
            theme = "TECHARM", 
            description = "DRILL_2ND_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM2:RIGHTDRILL2]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:RDRILL2]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:drill:drills]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_DRILL2 = {
			priority = 50,
            theme = "TECHARM", 
            description = "DRILL_2ND_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM2:LEFTDRILL2]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:LDRILL2]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:drill:drills]
		[ATTACK_CONTACT_PERC:10]
		[ATTACK_PENETRATION_PERC:100]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
		
		
        RIGHTARM_SAW = {
			priority = 20,
            theme = "TECHARM", 
            description = "SAW_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM:RIGHTSAW]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:RSAW]	
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:saw:saws]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:10]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_SAW = {
			priority = 30,
            theme = "TECHARM", 
            description = "SAW_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM:LEFTSAW]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:LSAW]	
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:saw:saws]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:10]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
			
        RIGHTARM_SAW2 = {
			priority = 40,
            theme = "TECHARM", 
            description = "SAW_2ND_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM2:RIGHTSAW2]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:RSAW2]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:saw:saws]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:10]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_SAW2 = {
			priority = 50,
            theme = "TECHARM", 
            description = "SAW_2ND_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM2:LEFTSAW2]",
            interaction = [[
	[ATTACK:KICK:BODYPART:BY_TOKEN:LSAW2]		
		[ATTACK_SKILL:GRASP_STRIKE]
		[ATTACK_VERB:saw:saws]
		[ATTACK_CONTACT_PERC:100]
		[ATTACK_PENETRATION_PERC:10]
		[ATTACK_FLAG_EDGE]
		[ATTACK_PREPARE_AND_RECOVER:3:3]
		[ATTACK_FLAG_WITH]
		[ATTACK_PRIORITY:MAIN]
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
			
			
			
        RIGHTARM_FORCEEMITTER = {
			priority = 20,
            theme = "TECHARM", 
            description = "SHOCK_EMITTER_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM:RIGHTFORCEEMITTER]",
            interaction = [[
	[CAN_DO_INTERACTION:SHOCK_UNLOCKR]
		[CDI:ADV_NAME:Charge Emitter]
		[CDI:USAGE_HINT:DEFEND]
		[CDI:BP_REQUIRED:BY_TOKEN:RFORCE]
		[CDI:TARGET:A:SELF_ONLY]
		[CDI:WAIT_PERIOD:1200]
		[CDI:VERB:charge your shockwave emitter:charges its shockwave emitter:NA]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_FORCEEMITTER = {
			priority = 30,
            theme = "TECHARM", 
            description = "SHOCK_EMITTER_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM:LEFTFORCEEMITTER]",
            interaction = [[
	[CAN_DO_INTERACTION:SHOCK_UNLOCKL]
		[CDI:ADV_NAME:Charge Emitter]
		[CDI:USAGE_HINT:DEFEND]
		[CDI:BP_REQUIRED:BY_TOKEN:LFORCE]
		[CDI:TARGET:A:SELF_ONLY]
		[CDI:WAIT_PERIOD:1200]
		[CDI:VERB:charge your shockwave emitter:charges its shockwave emitter:NA]
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON", 
            pop_ratio_multiplier = 0.5
        },
		
        RIGHTARM_FORCEEMITTER2 = {
			priority = 40,
            theme = "TECHARM", 
            description = "SHOCK_EMITTER_2ND_ARM_RIGHT",
            body = "[BODY:RIGHTWEAPONARM2:RIGHTFORCEEMITTER2]",
            interaction = [[
	[CAN_DO_INTERACTION:SHOCK_UNLOCKR2]
		[CDI:ADV_NAME:Charge Emitter]
		[CDI:USAGE_HINT:DEFEND]
		[CDI:BP_REQUIRED:BY_TOKEN:RFORCE2]
		[CDI:INTERACTION:SHOCK_UNLOCKR2]
		[CDI:TARGET:A:SELF_ONLY]
		[CDI:WAIT_PERIOD:1200]
		[CDI:VERB:charge your shockwave emitter:charges its shockwave emitter:NA]
            ]],
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "RIGHTWEAPON2", 
            pop_ratio_multiplier = 0.5
        },
        LEFTARM_FORCEEMITTER2 = {
			priority = 50,
            theme = "TECHARM", 
            description = "SHOCK_EMITTER_2ND_ARM_LEFT",
            body = "[BODY:LEFTWEAPONARM2:LEFTFORCEEMITTER2]",
            interaction = [[
	[CAN_DO_INTERACTION:SHOCK_UNLOCKL2]
		[CDI:ADV_NAME:Charge Emitter]
		[CDI:USAGE_HINT:DEFEND]
		[CDI:BP_REQUIRED:BY_TOKEN:LFORCE2]
		[CDI:TARGET:A:SELF_ONLY]
		[CDI:WAIT_PERIOD:1200]
		[CDI:VERB:charge your shockwave emitter:charges its shockwave emitter:NA]
            ]],
        
            eligible_archetypes = {"CYBERMACHINE", "NANOMACHINE", "DEMIMACHINE", "XENOMACHINE", "EXCASTE", "NUCASTE", "CYCASTE" },
			eligible_sub_archetypes = {"ANDROID", "INDUSTRIAL", "DOLL", "SCRAP", "MECHA", "FRANKENSTEIN", "HYBRID", "CONTROL", "BLINDSIGHT", "CYBORG", "BULK", "SLEEK", "SKELETON" },
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group =  "LEFTWEAPON2", 
            pop_ratio_multiplier = 0.5
		
		
        }
    }
}