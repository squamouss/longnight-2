return {
    -- ========================================================================
    -- WEAPON DEFINITIONS & DISTRIBUTION RULES
    -- ========================================================================
    -- Each weapon now defines its own eligibility and exclusion rules.
    -- exclusion_group: Weapons sharing a group name CANNOT exist on the same caste.
    --                  If a creature is eligible for multiple weapons in the same group,
    --                  multiple castes will be generated (one for each).
    --                  If nil, the weapon is added to ALL generated castes (Global/Secondary).
    
    WEAPONS = {
        COILGUN_TURRET = {
            description = "shoulder-mounted coilgun turret",
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
            
            -- DISTRIBUTION RULES
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE"},
            eligible_size_tags = {"MEDIUM", "LARGE", "HUGE"},
            eligible_rating_tags = {"HOSTILE", "MILITARY", "DANGEROUS", "EXISTENTIAL"},
            exclusion_group = nil, -- Secondary weapon, compatible with everything
            pop_ratio_multiplier = 0.8
        },
        
        MISSILE_POD = {
            description = "high-explosive missile pod",
            body = "[BODY:MISSILE_POD]",
            interaction = [[
                [CAN_DO_INTERACTION:MATERIAL_EMISSION]
                [CDI:ADV_NAME:pod]
                [CDI:USAGE_HINT:ATTACK]
                [CDI:BP_REQUIRED:BY_TOKEN:MPOD1]
                [CDI:MATERIAL:INORGANIC:MISSILE_HE:SOLID_GLOB]
                [CDI:TARGET:C:LINE_OF_SIGHT]
                [CDI:TARGET_RANGE:C:500]
                [CDI:MAX_TARGET_NUMBER:C:1]
                [CDI:WAIT_PERIOD:100]
                [CDI:VERB:fire your missile pod:fires its missile pod:NA]
            ]],
            
            -- DISTRIBUTION RULES
            eligible_archetypes = {"BIOMACHINE", "CYBERMACHINE"},
            eligible_size_tags = {"LARGE", "HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"HOSTILE", "MILITARY", "EXISTENTIAL", "INCURSION"},
            exclusion_group = "MAIN_WEAPON", -- Only one Main Weapon per caste
            pop_ratio_multiplier = 0.5
        },
        
        CANNON = {
            description = "heavy kinetic cannon",
            body = "[BODY:CANNON]",
            interaction = [[
                [CAN_DO_INTERACTION:MATERIAL_EMISSION]
                [CDI:ADV_NAME:cannon]
                [CDI:USAGE_HINT:ATTACK]
                [CDI:BP_REQUIRED:BY_TOKEN:CNN1]
                [CDI:MATERIAL:INORGANIC:SHELL_CANNON:SOLID_GLOB]
                [CDI:TARGET:C:LINE_OF_SIGHT]
                [CDI:TARGET_RANGE:C:500]
                [CDI:MAX_TARGET_NUMBER:C:1]
                [CDI:WAIT_PERIOD:100]
                [CDI:VERB:fire your cannon:fires its cannon:NA]
            ]],
            
            -- DISTRIBUTION RULES
            eligible_archetypes = {"CYBERMACHINE", "BIOMACHINE"},
            eligible_size_tags = {"HUGE", "GIANT", "TITANIC"},
            eligible_rating_tags = {"EXISTENTIAL", "INCURSION", "MILITARY"},
            exclusion_group = "MAIN_WEAPON", -- Conflicts with Missile Pod
            pop_ratio_multiplier = 0.1
        },
        
        ROTORGUN = {
            description = "rotary assault cannon",
            body = "[BODY:ROTORGUN]",
            interaction = [[
                [CAN_DO_INTERACTION:MATERIAL_EMISSION]
                [CDI:ADV_NAME:rotorgun]
                [CDI:USAGE_HINT:ATTACK]
                [CDI:BP_REQUIRED:BY_TOKEN:RGN1]
                [CDI:MATERIAL:INORGANIC:BULLET_ROTOR:SOLID_GLOB]
                [CDI:TARGET:C:LINE_OF_SIGHT]
                [CDI:TARGET_RANGE:C:500]
                [CDI:MAX_TARGET_NUMBER:C:1]
                [CDI:WAIT_PERIOD:5]
                [CDI:VERB:fire your rotorgun:fires its rotorgun:NA]
            ]],
            
            -- DISTRIBUTION RULES
            eligible_archetypes = {"CYBERMACHINE", "BIOMACHINE"},
            eligible_size_tags = {"LARGE", "HUGE", "GIANT"},
            eligible_rating_tags = {"HOSTILE", "MILITARY", "DANGEROUS"},
            exclusion_group = "MAIN_WEAPON", -- Conflicts with Cannon & Missile Pod
            pop_ratio_multiplier = 0.3
        },
        
        MELEE_BLADE = {
            description = "retractable molecular blade",
            body = "[BODY:MELEE_BLADE]",
            interaction = [[
                [ATTACK:SLASH:BODYPART:BY_TOKEN:BLD1]
                [ATTACK_SKILL:GRASP_STRIKE]
                [ATTACK_VERB:slash:slashes]
                [ATTACK_CONTACT_PERC:100]
                [ATTACK_PENETRATION_PERC:100]
                [ATTACK_FLAG_EDGE]
                [ATTACK_PREPARE_AND_RECOVER:3:3]
                [ATTACK_PRIORITY:MAIN]
            ]],
            
            -- DISTRIBUTION RULES
            eligible_archetypes = {"CYBERMACHINE", "BIOMACHINE"}, 
            eligible_size_tags = {"MEDIUM", "LARGE"},
            eligible_rating_tags = {"DEVIANT", "SERVANT", "WEAPON"},
            exclusion_group = "MELEE_SLOT", -- Can exist alongside Main Weapons
            pop_ratio_multiplier = 0.4
        }
    }
}