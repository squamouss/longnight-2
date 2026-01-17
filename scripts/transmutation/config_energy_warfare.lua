local shared = require("transmutation.config_transmutation_shared")

  local M = {
      -- =========================================================================
      -- SCHOOL IDENTITY
      -- =========================================================================
      SCHOOL_NAME = "Energy Warfare",
      INNATE_CLASS = "ENERGY",             -- Checks INNATE_ENERGY_0 through INNATE_ENERGY_6
      FIREWALL_CLASS_PREFIX = "SHIELDED",  -- Syndrome class prefix for this school's defense
      SILENCE_CLASS = "DISRUPTED",         -- Energy-specific silence effect
      SCHOOL_THEME = "Energy",             -- Used in descriptions
      CATEGORY_PREFIX = "ENERGY_WARFARE",  -- Crafting category prefix

      -- =========================================================================
      -- IMPORT SHARED CONSTANTS
      -- =========================================================================
      MAX_POWER_LEVEL = shared.MAX_POWER_LEVEL,
      WORLDGEN_RARITY_CONSTANT = shared.WORLDGEN_RARITY_CONSTANT,
      TARGET_TYPES = shared.TARGET_TYPES,
      SEVERITY_ADJECTIVES = shared.SEVERITY_ADJECTIVES,
      SEVERITY_SYMBOLS = shared.SEVERITY_SYMBOLS,
      COLORS = { OFFENSE = "0:0:1", DEFENSE = "7:0:1" },

      -- =========================================================================
      -- ABILITIES
      -- =========================================================================
      ABILITY_TYPES = {
	  
		  COUNTERFORCE = {
			  name = "Counterforce",
			  token_prefix = "COUNTERFORCE",
			  role = "DEFENSE",
			  target_types = {"SELF", "FIELD", "SPREAD", "TOTAL"},
			  duration = 300,

			  target_verbs = {
				  [1] = "are surrounded by a faint shimmer of energy:is surrounded by a faint shimmer of energy:NA",
				  [2] = "are surrounded by a thin aura of energy:is surrounded by a thin aura of energy:NA",
				  [3] = "are surrounded by a bright aura of energy:is surrounded by a bright aura of energy:NA",
				  [4] = "are surrounded by a blazing aura of energy:is surrounded by a blazing aura of energy:NA",
				  [5] = "are surrounded by an intense field of energy:is surrounded by an intense field of energy:NA",
				  [6] = "are surrounded by a blinding corona of energy:is surrounded by a blinding corona of energy:NA",
			  }
		  },
	  
          FORCE_PUSH = {
              name = "Blast",
              token_prefix = "BLAST",
              role = "OFFENSE",
              target_types = {"MELEE", "RANGED", "FIELD", "SPREAD", "TOTAL"},
              propel_force_base = 100000,
              target_verbs = {
                  [1] = "are struck by a bullet of force:is struck by a bullet of force:NA",
                  [2] = "are struck by a bolt of force:is struck by a bolt of force:NA",
                  [3] = "are struck by a wave of force:is struck by a wave of force:NA",
                  [4] = "are struck by a wall of force:is struck by a wall of force:NA",
                  [5] = "are struck by an eruption of energy:is struck by an eruption of energy:NA",
                  [6] = "are struck by an storm of energy:is struck by an storm of energy:NA",
              }
          },

          DESTABILIZE = {
              name = "Destabilize",
              token_prefix = "DESTABILIZE",
              role = "OFFENSE",
              target_types = {"MELEE", "RANGED", "FIELD", "SPREAD", "TOTAL"},
              duration = 300,
              material_force_mult = {
                  material = "NONE:NONE",
                  base_a = 11,
                  base_b = 10,
                  per_sev_a = 2,
              },
              target_verbs = {
                  [1] = "are enveloped by a faint outline of distorted energy:is enveloped by a faint outline of distorted energy:NA",
                  [2] = "are enveloped by a thin outline of distorted energy:is enveloped by a thin outline of distorted energy:NA",
                  [3] = "are enveloped by a dense outline of distorted energy:is enveloped by a dense outline of distorted energy:NA",
                  [4] = "are enveloped by a writhing outline of distorted energy:is enveloped by a writhing outline of distorted energy:NA",
                  [5] = "are enveloped by a thrashing outline of distorted energy:is enveloped by a thrashing outline of distorted energy:NA",
                  [6] = "are enveloped by a roiling outline of distorted energy:is enveloped by a roiling outline of distorted energy:NA",
              }
          },

          ANCHOR = {
              name = "Anchor",
              token_prefix = "ANCHOR",
              role = "DEFENSE",
              target_types = {"SELF", "FIELD", "SPREAD", "TOTAL"},
              duration = 300,
              material_force_mult = {
                  material = "NONE:NONE",
                  values_a = {9, 7, 6, 4, 3, 1},
                  base_b = 10,
              },
              target_verbs = {
                  [1] = "are enveloped by a faint outline of shimmering energy:is enveloped by a faint outline of shimmering energy:NA",
                  [2] = "are enveloped by a thin outline of shimmering energy:is enveloped by a thin outline of shimmering energy:NA",
                  [3] = "are enveloped by a dense outline of shimmering energy:is enveloped by a dense outline of shimmering energy:NA",
                  [4] = "are enveloped by a writhing outline of shimmering energy:is enveloped by a writhing outline of shimmering energy:NA",
                  [5] = "are enveloped by a thrashing outline of shimmering energy:is enveloped by a thrashing outline of shimmering energy:NA",
                  [6] = "are enveloped by a roiling outline of shimmering energy:is enveloped by a roiling outline of shimmering energy:NA",
              }
          },

          EC_SHIELD = {
              name = "EC Shield",
              token_prefix = "EC_SHIELD",
              role = "DEFENSE",
              target_types = {"SELF", "FIELD", "SPREAD", "TOTAL"},
              duration = 90,
              material_force_mult = {
                  materials = {
				  "INORGANIC:ALLOY",
				  "INORGANIC:ALLOY2"
				  },
                  base_a = 1,
                  values_b = {4, 10, 25, 50, 75, 100},
              },
              target_verbs = {
                  [1] = "are surrounded by a faint sphere of crackling energy:is surrounded by a faint sphere of crackling energy:NA",
                  [2] = "are surrounded by a thin sphere of crackling energy:is surrounded by a thin sphere of crackling energy:NA",
                  [3] = "are surrounded by a dense sphere of crackling energy:is surrounded by a dense sphere of crackling energy:NA",
                  [4] = "are surrounded by a writhing sphere of crackling energy:is surrounded by a writhing sphere of crackling energy:NA",
                  [5] = "are surrounded by a thrashing sphere of crackling energy:is surrounded by a thrashing sphere of crackling energy:NA",
                  [6] = "are surrounded by a roiling sphere of crackling energy:is surrounded by a roiling sphere of crackling energy:NA",
              }
          },

          HT_SHIELD = {
              name = "HT Shield",
              token_prefix = "HT_SHIELD",
              role = "DEFENSE",
              target_types = {"SELF", "FIELD", "SPREAD", "TOTAL"},
              duration = 90,
              material_force_mult = {
                  materials = {
				  "INORGANIC:ENERGETIC_COMPOUND",
				  "INORGANIC:BULLET",
				  "INORGANIC:MAGROD_COILGUN",
				  "INORGANIC:MICROMISSILE",
				  "INORGANIC:SABOT_LIGHT",
				  "INORGANIC:SHELL",
				  "INORGANIC:MISSILE",
				  "INORGANIC:MAGROD_RAILGUN",
				  "INORGANIC:SABOT_HEAVY"
				  },
                  base_a = 1,
                  values_b = {4, 10, 25, 50, 75, 100},
              },
              target_verbs = {
                  [1] = "are surrounded by a faint sphere of distorted space:is surrounded by a faint sphere of distorted space:NA",
                  [2] = "are surrounded by a thin sphere of distorted space:is surrounded by a thin sphere of distorted space:NA",
                  [3] = "are surrounded by a dense sphere of distorted space:is surrounded by a dense sphere of distorted space:NA",
                  [4] = "are surrounded by a writhing sphere of distorted space:is surrounded by a writhing sphere of distorted space:NA",
                  [5] = "are surrounded by a thrashing sphere of distorted space:is surrounded by a thrashing sphere of distorted space:NA",
                  [6] = "are surrounded by a roiling sphere of distorted space:is surrounded by a roiling sphere of distorted space:NA",
              }
          }
      },

      -- =========================================================================
      -- TELEGRAPHS (Minimal - just enough for one ability)
      -- =========================================================================
     FLAVOR_TEXT = {
          OFFENSE = {
              [1] = {  -- severity 1
                  MELEE  = { VERB_1ST="generate a writhing strand of distorted space", VERB_3RD="generates a writhing strand of distorted space" },
                  RANGED = { VERB_1ST="generate a writhing strand of distorted space", VERB_3RD="generates a writhing strand of distorted space" },
                  FIELD  = { VERB_1ST="generate a cluster of writhing strands of distorted space", VERB_3RD="generates a cluster of writhing strands of distorted space" },
                  SPREAD = { VERB_1ST="generate a cluster of writhing strands of distorted space", VERB_3RD="generates a cluster of writhing strands of distorted space" },
                  TOTAL  = { VERB_1ST="generate a swarm of writhing strands of distorted space", VERB_3RD="generates a swarm of writhing strands of distorted space" },
              },
              [2] = {  -- severity 2
                  MELEE  = { VERB_1ST="generate a writhing cord of distorted space", VERB_3RD="generates a writhing cord of distorted space" },
                  RANGED = { VERB_1ST="generate a writhing cord of distorted space", VERB_3RD="generates a writhing cord of distorted space" },
                  FIELD  = { VERB_1ST="generate a cluster of writhing cords of distorted space", VERB_3RD="generates a cluster of writhing cords of distorted space" },
                  SPREAD = { VERB_1ST="generate a cluster of writhing cords of distorted space", VERB_3RD="generates a cluster of writhing cords of distorted space" },
                  TOTAL  = { VERB_1ST="generate a swarm of writhing cords of distorted space", VERB_3RD="generates a swarm of writhing cords of distorted space" },
              },
              [3] = {  -- severity 3
                  MELEE  = { VERB_1ST="generate a writhing tear of distorted space", VERB_3RD="generates a writhing tear of distorted space" },
                  RANGED = { VERB_1ST="generate a writhing tear of distorted space", VERB_3RD="generates a writhing tear of distorted space" },
                  FIELD  = { VERB_1ST="generate a cluster of writhing tears of distorted space", VERB_3RD="generates a cluster of writhing tears of distorted space" },
                  SPREAD = { VERB_1ST="generate a cluster of writhing tears of distorted space", VERB_3RD="generates a cluster of writhing tears of distorted space" },
                  TOTAL  = { VERB_1ST="generate a swarm of writhing tears of distorted space", VERB_3RD="generates a swarm of writhing tears of distorted space" },
              },
              [4] = {  -- severity 4
                  MELEE  = { VERB_1ST="generate a writhing gash of distorted space", VERB_3RD="generates a writhing gash of distorted space" },
                  RANGED = { VERB_1ST="generate a writhing gash of distorted space", VERB_3RD="generates a writhing gash of distorted space" },
                  FIELD  = { VERB_1ST="generate a cluster of writhing gashes of distorted space", VERB_3RD="generates a cluster of writhing gashes of distorted space" },
                  SPREAD = { VERB_1ST="generate a cluster of writhing gashes of distorted space", VERB_3RD="generates a cluster of writhing gashes of distorted space" },
                  TOTAL  = { VERB_1ST="generate a swarm of writhing gashes of distorted space", VERB_3RD="generates a swarm of writhing gashes of distorted space" },
              },
              [5] = {  -- severity 5
                  MELEE  = { VERB_1ST="generate a writhing pit of distorted space", VERB_3RD="generates a writhing pit of distorted space" },
                  RANGED = { VERB_1ST="generate a writhing pit of distorted space", VERB_3RD="generates a writhing pit of distorted space" },
                  FIELD  = { VERB_1ST="generate a cluster of writhing pits of distorted space", VERB_3RD="generates a cluster of writhing pits of distorted space" },
                  SPREAD = { VERB_1ST="generate a cluster of writhing pits of distorted space", VERB_3RD="generates a cluster of writhing pits of distorted space" },
                  TOTAL  = { VERB_1ST="generate a swarm of writhing pits of distorted space", VERB_3RD="generates a swarm of writhing pits of distorted space" },
              },
              [6] = {  -- severity 6
                  MELEE  = { VERB_1ST="generate a writhing chasm of distorted space", VERB_3RD="generates a writhing chasm of distorted space" },
                  RANGED = { VERB_1ST="generate a writhing chasm of distorted space", VERB_3RD="generates a writhing chasm of distorted space" },
                  FIELD  = { VERB_1ST="generate a cluster of writhing chasms of distorted space", VERB_3RD="generates a cluster of writhing chasms of distorted space" },
                  SPREAD = { VERB_1ST="generate a cluster of writhing chasms of distorted space", VERB_3RD="generates a cluster of writhing chasms of distorted space" },
                  TOTAL  = { VERB_1ST="generate a swarm of writhing chasms of distorted space", VERB_3RD="generates a swarm of writhing chasms of distorted space" },
              },
          },

          DEFENSE = {
              [1] = {  -- severity 1
                  SELF   = { VERB_1ST="generate a pulsing bead of distorted space", VERB_3RD="generates a pulsing bead of distorted space" },
                  MELEE  = { VERB_1ST="generate a pulsing bead of distorted space", VERB_3RD="generates a pulsing bead of distorted space" },
                  RANGED = { VERB_1ST="generate a pulsing bead of distorted space", VERB_3RD="generates a pulsing bead of distorted space" },
                  FIELD  = { VERB_1ST="generate a cluster of pulsing beads of distorted space", VERB_3RD="generates a cluster of pulsing beads of distorted space" },
                  SPREAD = { VERB_1ST="generate a cluster of pulsing beads of distorted space", VERB_3RD="generates a cluster of pulsing beads of distorted space" },
                  TOTAL  = { VERB_1ST="generate a swarm of pulsing beads of distorted space", VERB_3RD="generates a swarm of pulsing beads of distorted space" },
              },
              [2] = {  -- severity 2
                  SELF   = { VERB_1ST="generate a small pulsing orb of distorted space", VERB_3RD="generates a small pulsing orb of distorted space" },
                  MELEE  = { VERB_1ST="generate a small pulsing orb of distorted space", VERB_3RD="generates a small pulsing orb of distorted space" },
                  RANGED = { VERB_1ST="generate a small pulsing orb of distorted space", VERB_3RD="generates a small pulsing orb of distorted space" },
                  FIELD  = { VERB_1ST="generate a cluster of small pulsing orbs of distorted space", VERB_3RD="generates a cluster of small pulsing orbs of distorted space" },
                  SPREAD = { VERB_1ST="generate a cluster of small pulsing orbs of distorted space", VERB_3RD="generates a cluster of small pulsing orbs of distorted space" },
                  TOTAL  = { VERB_1ST="generate a swarm of small pulsing orbs of distorted space", VERB_3RD="generates a swarm of small pulsing orbs of distorted space" },
              },
              [3] = {  -- severity 3
                  SELF   = { VERB_1ST="generate a large pulsing orb of distorted space", VERB_3RD="generates a large pulsing orb of distorted space" },
                  MELEE  = { VERB_1ST="generate a large pulsing orb of distorted space", VERB_3RD="generates a large pulsing orb of distorted space" },
                  RANGED = { VERB_1ST="generate a large pulsing orb of distorted space", VERB_3RD="generates a large pulsing orb of distorted space" },
                  FIELD  = { VERB_1ST="generate a cluster of large pulsing orbs of distorted space", VERB_3RD="generates a cluster of large pulsing orbs of distorted space" },
                  SPREAD = { VERB_1ST="generate a cluster of large pulsing orbs of distorted space", VERB_3RD="generates a cluster of large pulsing orbs of distorted space" },
                  TOTAL  = { VERB_1ST="generate a swarm of large pulsing orbs of distorted space", VERB_3RD="generates a swarm of large pulsing orbs of distorted space" },
              },
              [4] = {  -- severity 4
                  SELF   = { VERB_1ST="generate a huge pulsing orb of distorted space", VERB_3RD="generates a huge pulsing orb of distorted space" },
                  MELEE  = { VERB_1ST="generate a huge pulsing orb of distorted space", VERB_3RD="generates a huge pulsing orb of distorted space" },
                  RANGED = { VERB_1ST="generate a huge pulsing orb of distorted space", VERB_3RD="generates a huge pulsing orb of distorted space" },
                  FIELD  = { VERB_1ST="generate a cluster of huge pulsing orbs of distorted space", VERB_3RD="generates a cluster of huge pulsing orbs of distorted space" },
                  SPREAD = { VERB_1ST="generate a cluster of huge pulsing orbs of distorted space", VERB_3RD="generates a cluster of huge pulsing orbs of distorted space" },
                  TOTAL  = { VERB_1ST="generate a swarm of huge pulsing orbs of distorted space", VERB_3RD="generates a swarm of huge pulsing orbs of distorted space" },
              },
              [5] = {  -- severity 5
                  SELF   = { VERB_1ST="generate a giant pulsing orb of distorted space", VERB_3RD="generates a giant pulsing orb of distorted space" },
                  MELEE  = { VERB_1ST="generate a giant pulsing orb of distorted space", VERB_3RD="generates a giant pulsing orb of distorted space" },
                  RANGED = { VERB_1ST="generate a giant pulsing orb of distorted space", VERB_3RD="generates a giant pulsing orb of distorted space" },
                  FIELD  = { VERB_1ST="generate a cluster of giant pulsing orbs of distorted space", VERB_3RD="generates a cluster of giant pulsing orbs of distorted space" },
                  SPREAD = { VERB_1ST="generate a cluster of giant pulsing orbs of distorted space", VERB_3RD="generates a cluster of giant pulsing orbs of distorted space" },
                  TOTAL  = { VERB_1ST="generate a swarm of giant pulsing orbs of distorted space", VERB_3RD="generates a swarm of giant pulsing orbs of distorted space" },
              },
              [6] = {  -- severity 6
                  SELF   = { VERB_1ST="generate a titanic pulsing orb of distorted space", VERB_3RD="generates a titanic pulsing orb of distorted space" },
                  MELEE  = { VERB_1ST="generate a titanic pulsing orb of distorted space", VERB_3RD="generates a titanic pulsing orb of distorted space" },
                  RANGED = { VERB_1ST="generate a titanic pulsing orb of distorted space", VERB_3RD="generates a titanic pulsing orb of distorted space" },
                  FIELD  = { VERB_1ST="generate a cluster of titanic pulsing orbs of distorted space", VERB_3RD="generates a cluster of titanic pulsing orbs of distorted space" },
                  SPREAD = { VERB_1ST="generate a cluster of titanic pulsing orbs of distorted space", VERB_3RD="generates a cluster of titanic pulsing orbs of distorted space" },
                  TOTAL  = { VERB_1ST="generate a swarm of titanic pulsing orbs of distorted space", VERB_3RD="generates a swarm of titanic pulsing orbs of distorted space" },
              },
          }
      },

      -- =========================================================================
      -- CRAFTING
      -- =========================================================================
      CRAFTING = {
          FREE_RECIPES = true,
          FORT_BUILDING = "N_MATTER_REFINERY",
          FORT_REAGENT_MAT = "INORGANIC:N_MATTER",
          FORT_TOOL_PREFIX = "ITEM_TOOL_TABLET_INCOMPLETE_WARFARE",
          ADV_TOOL_MAT = "INORGANIC:N_MATTER",
          ADV_SCRAP_MAT = "INORGANIC:N_MATTER",
          ADV_TOOL_ID = "ITEM_TOOL_PORTABLE_SYNTH",
          COST_BASE = 5,
          COST_MULT = 5,
          COST_TARGET_MULT = 2,
          CATEGORY_ID_PREFIX = "ENERGY_WARFARE",
      },
  }

  return M