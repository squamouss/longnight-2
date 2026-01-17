 local shared = require("transmutation.config_transmutation_shared")

  local M = {
      -- =========================================================================
      -- SCHOOL IDENTITY
      -- =========================================================================
      SCHOOL_NAME = "Digital Warfare",
      INNATE_CLASS = "FIREWALL",           -- Checks INNATE_FIREWALL_0 through INNATE_FIREWALL_6
      FIREWALL_CLASS_PREFIX = "FIREWALL",  -- Syndrome class prefix for this school's defense
      SILENCE_CLASS = "HACKED",            -- School-specific silence effect
      SCHOOL_THEME = "Digital",            -- Used in descriptions
      CATEGORY_PREFIX = "DIGI_WARFARE",    -- Crafting category prefix

      -- =========================================================================
      -- IMPORT SHARED CONSTANTS
      -- =========================================================================
      MAX_POWER_LEVEL = shared.MAX_POWER_LEVEL,
      WORLDGEN_RARITY_CONSTANT = shared.WORLDGEN_RARITY_CONSTANT,
      TARGET_TYPES = shared.TARGET_TYPES,
      SEVERITY_ADJECTIVES = shared.SEVERITY_ADJECTIVES,
      SEVERITY_SYMBOLS = shared.SEVERITY_SYMBOLS,
      COLORS = shared.COLORS,

      -- =========================================================================
      -- ABILITIES
      -- =========================================================================
      ABILITY_TYPES = {
          LOCK = {
              name = "SLOWDOWN",
              token_prefix = "SLOWDOWN",
              role = "OFFENSE",
              target_types = {"MELEE", "RANGED", "FIELD", "SPREAD", "TOTAL"},
              duration = 300,
              speed_penalty_base = 80,
              injects_silence = false,
              soak = true,

              target_verbs = {
                  [1] = "are orbited by tiny glitching holographic needles:is orbited by tiny glitching holographic needles:NA",
                  [2] = "are orbited by small glitching holographic needles:is orbited by small glitching holographic needles:NA",
                  [3] = "are orbited by large glitching holographic needles:is orbited by large glitching holographic needles:NA",
                  [4] = "are encircled by a thin glitching ring of holographic shards:is encircled by a thin glitching ring of holographic shards:NA",
                  [5] = "are encircled by a thick glitching ring of holographic shards:is encircled by a thick glitching ring of holographic shards:NA",
                  [6] = "are encircled by multiple glitching rings of holographic shards:is orbited by multiple glitching rings of holographic shards:NA",
              }
          },

          HACK = {
              name = "Hack",
              token_prefix = "HACK",
              role = "OFFENSE",
              target_types = {"MELEE", "RANGED", "FIELD", "SPREAD", "TOTAL"},
              duration = 120,
              injects_silence = true,

              target_verbs = {
                  [1] = "are orbited by tiny amorphous glitching holograms:is orbited by tiny amorphous glitching holograms:NA",
                  [2] = "are orbited by small amorphous glitching holograms:is orbited by small amorphous glitching holograms:NA",
                  [3] = "are orbited by large amorphous glitching holograms:is orbited by large amorphous glitching holograms:NA",
                  [4] = "are encircled by a thin glitching ring of holographic light:is encircled by a thin glitching ring of holographic light:NA",
                  [5] = "are encircled by a thick glitching ring of holographic light:is encircled by a thick glitching ring of holographic light:NA",
                  [6] = "are encircled by multiple glitching rings of holographic light:is orbited by multiple glitching rings of holographic light:NA",
              }
          },

          GUARD = {
              name = "Firewall",
              token_prefix = "GUARD",
              role = "DEFENSE",
              target_types = {"SELF", "FIELD", "SPREAD", "TOTAL"},
              duration = 300,
              syn_class_prefix = "FIREWALL",

              target_verbs = {
                  [1] = "are crowned by a thin holographic halo:is crowned by a thin holographic halo:NA",
                  [2] = "are crowned by a thick holographic halo:is crowned by a thick holographic halo:NA",
                  [3] = "are crowned by multiple holographic halos:is crowned by multiple holographic halos:NA",
                  [4] = "are encircled by a thin ring of holographic light:is encircled by a thin ring of holographic light:NA",
                  [5] = "are encircled by a thick ring of holographic light:is encircled by a thick ring of holographic light:NA",
                  [6] = "are encircled by multiple rings of holographic light:is encircled by multiple rings of holographic light:NA",
              }
          },

          POSPROB = {
              name = "Optimizer",
              token_prefix = "POSPROB",
              role = "DEFENSE",
              target_types = {"SELF", "FIELD", "SPREAD", "TOTAL"},
              duration = 120,
              skill_roll_adj = 5,
              is_curse_style = true,
              target_verbs = {
                  [1] = "are trailed by tiny holographic beads of light:is trailed by tiny holographic beads of light:NA",
                  [2] = "are trailed by small holographic beads of light:is trailed by small holographic beads of light:NA",
                  [3] = "are trailed by large holographic beads of light:is trailed by large holographic beads of light:NA",
                  [4] = "are encircled by a thin ring of holographic orbs:is encircled by a thin ring of holographic orbs:NA",
                  [5] = "are encircled by a thick ring of holographic orbs:is encircled by a thick ring of holographic orbs:NA",
                  [6] = "are encircled by multiple rings of holographic orbs:is orbited by multiple rings of holographic orbs:NA",
              }
          },

          NEGPROB = {
              name = "Malware",
              token_prefix = "NEGPROB",
              role = "OFFENSE",
              target_types = {"MELEE", "RANGED", "FIELD", "SPREAD", "TOTAL"},
              duration = 200,
              skill_roll_adj = -5,
              soak = true,
              injects_silence = false,
              target_verbs = {
                  [1] = "are orbited by tiny glitching holographic needles:is orbited by tiny glitching holographic needles:NA",
                  [2] = "are orbited by small glitching holographic needles:is orbited by small glitching holographic needles:NA",
                  [3] = "are orbited by large glitching holographic needles:is orbited by large glitching holographic needles:NA",
                  [4] = "are encircled by a thin glitching ring of holographic shards:is encircled by a thin glitching ring of holographic shards:NA",
                  [5] = "are encircled by a thick glitching ring of holographic shards:is encircled by a thick glitching ring of holographic shards:NA",
                  [6] = "are encircled by multiple glitching rings of holographic shards:is orbited by multiple glitching rings of holographic shards:NA",
              }
          },

          MINDBREAK = {
              name = "Mindbreak",
              token_prefix = "MINDBREAK",
              role = "OFFENSE",
              target_types = {"MELEE", "RANGED", "FIELD", "SPREAD", "TOTAL"},
              duration = 200,
              soak = true,
              injects_silence = false,
              ment_att_change = {
                  "ANALYTICAL_ABILITY", "CREATIVITY", "EMPATHY", "FOCUS", "INTUITION",
                  "KINESTHETIC_SENSE", "LINGUISTIC_ABILITY", "MEMORY", "MUSICALITY",
                  "PATIENCE", "SOCIAL_AWARENESS", "SPATIAL_SENSE", "WILLPOWER"
              },
              target_verbs = {
                  [1] = "are orbited by tiny screens of glitching data:is orbited by tiny screens of glitching data:NA",
                  [2] = "are orbited by small screens of glitching data:is orbited by small screens of glitching data:NA",
                  [3] = "are orbited by large screens of glitching data:is orbited by large screens of glitching data:NA",
                  [4] = "are struck by a writhing tendril of holographic datafeeds:is struck by a writhing tendril of holographic datafeeds:NA",
                  [5] = "are struck by writhing tendrils of holographic datafeeds:is struck by writhing tendrils of holographic datafeeds:NA",
                  [6] = "are struck by an immense writhing column of holographic datafeeds:is struck by an immense writhing column of holographic datafeeds:NA",
              }
          },

          OVERCLOCK = {
              name = "Overclock",
              token_prefix = "OVERCLOCK",
              role = "DEFENSE",
              target_types = {"SELF", "FIELD", "SPREAD", "TOTAL"},
              duration = 200,
              ment_att_buff = {
                  "ANALYTICAL_ABILITY", "CREATIVITY", "EMPATHY", "FOCUS", "INTUITION",
                  "KINESTHETIC_SENSE", "LINGUISTIC_ABILITY", "MEMORY", "MUSICALITY",
                  "PATIENCE", "SOCIAL_AWARENESS", "SPATIAL_SENSE", "WILLPOWER"
              },
              target_verbs = {
                  [1] = "are orbited by tiny screens of glitching data:is orbited by tiny screens of glitching data:NA",
                  [2] = "are orbited by small screens of glitching data:is orbited by small screens of glitching data:NA",
                  [3] = "are orbited by large screens of glitching data:is orbited by large screens of glitching data:NA",
                  [4] = "are orbited by a halo of ocular datafeeds:is orbited by a halo of ocular datafeeds:NA",
                  [5] = "are orbited by a ring of ocular datafeeds:is orbited by a ring of ocular datafeeds:NA",
                  [6] = "are surrounded by a partial spherical datafeed:is surrounded by a partial spherical datafeed:NA",
              }
          },

          BODYBREAK = {
              name = "Bodybreak",
              token_prefix = "BODYBREAK",
              role = "OFFENSE",
              target_types = {"MELEE", "RANGED", "FIELD", "SPREAD", "TOTAL"},
              duration = 200,
              soak = true,
              injects_silence = false,
              phys_att_change = {
                  "STRENGTH", "AGILITY", "TOUGHNESS", "ENDURANCE", "RECUPERATION", "DISEASE_RESISTANCE"
              },
              target_verbs = {
                  [1] = "are infested by tiny crawling sparks of electricity:is infested by tiny crawling sparks of electricity:NA",
                  [2] = "are infested by small crawling arcs of electricity:is infested by small crawling arcs of electricity:NA",
                  [3] = "are infested by large crawling arcs of electricity:is infested by large crawling arcs of electricity:NA",
                  [4] = "are struck by a writhing arc of electricity:is struck by a writhing arc of electricity:NA",
                  [5] = "are struck by writhing arcs of electricity:is struck by writhing arcs of electricity:NA",
                  [6] = "are struck by huge writhing arcs of electricity:is struck by huge writhing arcs of electricity:NA",
              }
          },

          DETECT = {
              name = "Signature Detection",
              token_prefix = "DETECT",
              role = "DEFENSE",
              target_types = {"SELF"},
              duration_values = { 30, 300, 1200, 2400, 6000, 12000 },

              detection_entries = {
			  
                  { class = "BIOMACHINE_SIZE_LESSER",  tile = 249, color = "5:0:0" },
                  { class = "BIOMACHINE_SIZE_MEDIUM",  tile = 248, color = "5:0:0" },
                  { class = "BIOMACHINE_SIZE_LARGE",   tile = 9,   color = "5:0:0" },
                  { class = "BIOMACHINE_SIZE_HUGE",    tile = 111, color = "5:0:0" },
                  { class = "BIOMACHINE_SIZE_GIANT",   tile = 79,  color = "5:0:0" },
                  { class = "BIOMACHINE_SIZE_TITANIC", tile = 79,  color = "5:0:0" },

                  { class = "CYBERMACHINE_SIZE_LESSER",  tile = 249, color = "3:0:0" },
                  { class = "CYBERMACHINE_SIZE_MEDIUM",  tile = 248, color = "3:0:0" },
                  { class = "CYBERMACHINE_SIZE_LARGE",   tile = 9,   color = "3:0:0" },
                  { class = "CYBERMACHINE_SIZE_HUGE",    tile = 111, color = "3:0:0" },
                  { class = "CYBERMACHINE_SIZE_GIANT",   tile = 79,  color = "3:0:0" },
                  { class = "CYBERMACHINE_SIZE_TITANIC", tile = 79,  color = "3:0:0" },

                  { class = "DEMIMACHINE_SIZE_LESSER",  tile = 249, color = "4:0:0" },
                  { class = "DEMIMACHINE_SIZE_MEDIUM",  tile = 248, color = "4:0:0" },
                  { class = "DEMIMACHINE_SIZE_LARGE",   tile = 9,   color = "4:0:0" },
                  { class = "DEMIMACHINE_SIZE_HUGE",    tile = 111, color = "4:0:0" },
                  { class = "DEMIMACHINE_SIZE_GIANT",   tile = 79,  color = "4:0:0" },
                  { class = "DEMIMACHINE_SIZE_TITANIC", tile = 79,  color = "4:0:0" },
				  
                  { class = "CYCASTE_SIZE_LESSER",  tile = 249, color = "4:0:1" },
                  { class = "CYCASTE_SIZE_MEDIUM",  tile = 248, color = "4:0:1" },
                  { class = "CYCASTE_SIZE_LARGE",   tile = 9,   color = "4:0:1" },
                  { class = "CYCASTE_SIZE_HUGE",    tile = 111, color = "4:0:1" },
                  { class = "CYCASTE_SIZE_GIANT",   tile = 79,  color = "4:0:1" },
                  { class = "CYCASTE_SIZE_TITANIC", tile = 79,  color = "4:0:1" },

                  { class = "NANOMACHINE_SIZE_LESSER",  tile = 249, color = "1:0:0" },
                  { class = "NANOMACHINE_SIZE_MEDIUM",  tile = 248, color = "1:0:0" },
                  { class = "NANOMACHINE_SIZE_LARGE",   tile = 9,   color = "1:0:0" },
                  { class = "NANOMACHINE_SIZE_HUGE",    tile = 111, color = "1:0:0" },
                  { class = "NANOMACHINE_SIZE_GIANT",   tile = 79,  color = "1:0:0" },
                  { class = "NANOMACHINE_SIZE_TITANIC", tile = 79,  color = "1:0:0" },

                  { class = "HOLOMACHINE_SIZE_LESSER",  tile = 249, color = "3:0:1" },
                  { class = "HOLOMACHINE_SIZE_MEDIUM",  tile = 248, color = "3:0:1" },
                  { class = "HOLOMACHINE_SIZE_LARGE",   tile = 9,   color = "3:0:1" },
                  { class = "HOLOMACHINE_SIZE_HUGE",    tile = 111, color = "3:0:1" },
                  { class = "HOLOMACHINE_SIZE_GIANT",   tile = 79,  color = "3:0:1" },
                  { class = "HOLOMACHINE_SIZE_TITANIC", tile = 79,  color = "3:0:1" },

                  { class = "XENOMACHINE_SIZE_LESSER",  tile = 249, color = "7:0:1" },
                  { class = "XENOMACHINE_SIZE_MEDIUM",  tile = 248, color = "7:0:1" },
                  { class = "XENOMACHINE_SIZE_LARGE",   tile = 9,   color = "7:0:1" },
                  { class = "XENOMACHINE_SIZE_HUGE",    tile = 111, color = "7:0:1" },
                  { class = "XENOMACHINE_SIZE_GIANT",   tile = 79,  color = "7:0:1" },
                  { class = "XENOMACHINE_SIZE_TITANIC", tile = 79,  color = "7:0:1" },

                  { class = "MACROCELL_SIZE_LESSER",  tile = 249, color = "7:0:0" },
                  { class = "MACROCELL_SIZE_MEDIUM",  tile = 248, color = "7:0:0" },
                  { class = "MACROCELL_SIZE_LARGE",   tile = 9,   color = "7:0:0" },
                  { class = "MACROCELL_SIZE_HUGE",    tile = 111, color = "7:0:0" },
                  { class = "MACROCELL_SIZE_GIANT",   tile = 79,  color = "7:0:0" },
                  { class = "MACROCELL_SIZE_TITANIC", tile = 79,  color = "7:0:0" },

                  { class = "EXCASTE_SIZE_LESSER",  tile = 249, color = "5:0:1" },
                  { class = "EXCASTE_SIZE_MEDIUM",  tile = 248, color = "5:0:1" },
                  { class = "EXCASTE_SIZE_LARGE",   tile = 9,   color = "5:0:1" },
                  { class = "EXCASTE_SIZE_HUGE",    tile = 111, color = "5:0:1" },
                  { class = "EXCASTE_SIZE_GIANT",   tile = 79,  color = "5:0:1" },
                  { class = "EXCASTE_SIZE_TITANIC", tile = 79,  color = "5:0:1" },

                  { class = "HICASTE_SIZE_LESSER",  tile = 249, color = "5:0:1" },
                  { class = "HICASTE_SIZE_MEDIUM",  tile = 248, color = "5:0:1" },
                  { class = "HICASTE_SIZE_LARGE",   tile = 9,   color = "5:0:1" },
                  { class = "HICASTE_SIZE_HUGE",    tile = 111, color = "5:0:1" },
                  { class = "HICASTE_SIZE_GIANT",   tile = 79,  color = "5:0:1" },
                  { class = "HICASTE_SIZE_TITANIC", tile = 79,  color = "5:0:1" },

                  { class = "LOCASTE_SIZE_LESSER",  tile = 249, color = "5:0:1" },
                  { class = "LOCASTE_SIZE_MEDIUM",  tile = 248, color = "5:0:1" },
                  { class = "LOCASTE_SIZE_LARGE",   tile = 9,   color = "5:0:1" },
                  { class = "LOCASTE_SIZE_HUGE",    tile = 111, color = "5:0:1" },
                  { class = "LOCASTE_SIZE_GIANT",   tile = 79,  color = "5:0:1" },
                  { class = "LOCASTE_SIZE_TITANIC", tile = 79,  color = "5:0:1" },

                  { class = "NUCASTE_SIZE_LESSER",  tile = 249, color = "5:0:1" },
                  { class = "NUCASTE_SIZE_MEDIUM",  tile = 248, color = "5:0:1" },
                  { class = "NUCASTE_SIZE_LARGE",   tile = 9,   color = "5:0:1" },
                  { class = "NUCASTE_SIZE_HUGE",    tile = 111, color = "5:0:1" },
                  { class = "NUCASTE_SIZE_GIANT",   tile = 79,  color = "5:0:1" },
                  { class = "NUCASTE_SIZE_TITANIC", tile = 79,  color = "5:0:1" },

                  { class = "CHIMERA_SIZE_LESSER",  tile = 249, color = "5:0:1" },
                  { class = "CHIMERA_SIZE_MEDIUM",  tile = 248, color = "5:0:1" },
                  { class = "CHIMERA_SIZE_LARGE",   tile = 9,   color = "5:0:1" },
                  { class = "CHIMERA_SIZE_HUGE",    tile = 111, color = "5:0:1" },
                  { class = "CHIMERA_SIZE_GIANT",   tile = 79,  color = "5:0:1" },
                  { class = "CHIMERA_SIZE_TITANIC", tile = 79,  color = "5:0:1" },

                  { class = "PROTOCHIMERA_SIZE_LESSER",  tile = 249, color = "5:0:1" },
                  { class = "PROTOCHIMERA_SIZE_MEDIUM",  tile = 248, color = "5:0:1" },
                  { class = "PROTOCHIMERA_SIZE_LARGE",   tile = 9,   color = "5:0:1" },
                  { class = "PROTOCHIMERA_SIZE_HUGE",    tile = 111, color = "5:0:1" },
                  { class = "PROTOCHIMERA_SIZE_GIANT",   tile = 79,  color = "5:0:1" },
                  { class = "PROTOCHIMERA_SIZE_TITANIC", tile = 79,  color = "5:0:1" },

                  { class = "PALEOCHIMERA_SIZE_LESSER",  tile = 249, color = "5:0:1" },
                  { class = "PALEOCHIMERA_SIZE_MEDIUM",  tile = 248, color = "5:0:1" },
                  { class = "PALEOCHIMERA_SIZE_LARGE",   tile = 9,   color = "5:0:1" },
                  { class = "PALEOCHIMERA_SIZE_HUGE",    tile = 111, color = "5:0:1" },
                  { class = "PALEOCHIMERA_SIZE_GIANT",   tile = 79,  color = "5:0:1" },
                  { class = "PALEOCHIMERA_SIZE_TITANIC", tile = 79,  color = "5:0:1" },

                  { class = "POLYMERID_SIZE_LESSER",  tile = 249, color = "6:0:0" },
                  { class = "POLYMERID_SIZE_MEDIUM",  tile = 248, color = "6:0:0" },
                  { class = "POLYMERID_SIZE_LARGE",   tile = 9,   color = "6:0:0" },
                  { class = "POLYMERID_SIZE_HUGE",    tile = 111, color = "6:0:0" },
                  { class = "POLYMERID_SIZE_GIANT",   tile = 79,  color = "6:0:0" },
                  { class = "POLYMERID_SIZE_TITANIC", tile = 79,  color = "6:0:0" },

                  { class = "SILICID_SIZE_LESSER",  tile = 249, color = "6:0:0" },
                  { class = "SILICID_SIZE_MEDIUM",  tile = 248, color = "6:0:0" },
                  { class = "SILICID_SIZE_LARGE",   tile = 9,   color = "6:0:0" },
                  { class = "SILICID_SIZE_HUGE",    tile = 111, color = "6:0:0" },
                  { class = "SILICID_SIZE_GIANT",   tile = 79,  color = "6:0:0" },
                  { class = "SILICID_SIZE_TITANIC", tile = 79,  color = "6:0:0" },

                  { class = "ELASTOMERID_SIZE_LESSER",  tile = 249, color = "6:0:0" },
                  { class = "ELASTOMERID_SIZE_MEDIUM",  tile = 248, color = "6:0:0" },
                  { class = "ELASTOMERID_SIZE_LARGE",   tile = 9,   color = "6:0:0" },
                  { class = "ELASTOMERID_SIZE_HUGE",    tile = 111, color = "6:0:0" },
                  { class = "ELASTOMERID_SIZE_GIANT",   tile = 79,  color = "6:0:0" },
                  { class = "ELASTOMERID_SIZE_TITANIC", tile = 79,  color = "6:0:0" },
              },

              target_verbs = {
                  [1] = "emit a faint wave of holographic light:emits a faint wave of holographic light:NA",
                  [2] = "emit a flickering wave of holographic light:emits a flickering wave of holographic light:NA",
                  [3] = "emit a shimmering wave of holographic light:emits a shimmering wave of holographic light:NA",
                  [4] = "emit a glowing wave of holographic light:emits a glowing wave of holographic light:NA",
                  [5] = "emit glowing waves of holographic light:emits glowing waves of holographic light:NA",
                  [6] = "emit a glowing field of holographic light:emits a glowing field of holographic light:NA",
              }
          }
      },

      -- =========================================================================
      -- TELEGRAPHS
      -- =========================================================================
	  FLAVOR_TEXT = {
          OFFENSE = {
              [1] = {  -- severity 1
                  MELEE  = { VERB_1ST="project a minute holographic targeting reticule", VERB_3RD="projects a minute holographic targeting reticule" },
                  RANGED = { VERB_1ST="project a minute holographic targeting reticule", VERB_3RD="projects a minute holographic targeting reticule" },
                  FIELD  = { VERB_1ST="project a cluster of minute holographic targeting reticules", VERB_3RD="projects a cluster of minute holographic targeting reticules" },
                  SPREAD = { VERB_1ST="project a cluster of minute holographic targeting reticules", VERB_3RD="projects a cluster of minute holographic targeting reticules" },
                  TOTAL  = { VERB_1ST="project a swarm of minute holographic targeting reticules", VERB_3RD="projects a swarm of minute holographic targeting reticules" },
              },
              [2] = {  -- severity 2
                  MELEE  = { VERB_1ST="project a small holographic targeting reticule", VERB_3RD="projects a small holographic targeting reticule" },
                  RANGED = { VERB_1ST="project a small holographic targeting reticule", VERB_3RD="projects a small holographic targeting reticule" },
                  FIELD  = { VERB_1ST="project a cluster of small holographic targeting reticules", VERB_3RD="projects a cluster of small holographic targeting reticules" },
                  SPREAD = { VERB_1ST="project a cluster of small holographic targeting reticules", VERB_3RD="projects a cluster of small holographic targeting reticules" },
                  TOTAL  = { VERB_1ST="project a swarm of small holographic targeting reticules", VERB_3RD="projects a swarm of large holographic targeting reticules" },
              },
              [3] = {  -- severity 3
                  MELEE  = { VERB_1ST="project a large holographic targeting reticule", VERB_3RD="projects a large holographic targeting reticule" },
                  RANGED = { VERB_1ST="project a large holographic targeting reticule", VERB_3RD="projects a large holographic targeting reticule" },
                  FIELD  = { VERB_1ST="project a cluster of large holographic targeting reticules", VERB_3RD="projects a cluster of large holographic targeting reticules" },
                  SPREAD = { VERB_1ST="project a cluster of large holographic targeting reticules", VERB_3RD="projects a cluster of large holographic targeting reticules" },
                  TOTAL  = { VERB_1ST="project a swarm of large holographic targeting reticules", VERB_3RD="projects a swarm of large holographic targeting reticules" },
              },
              [4] = {  -- severity 4
                  MELEE  = { VERB_1ST="project a huge holographic targeting reticule", VERB_3RD="projects a huge holographic targeting reticule" },
                  RANGED = { VERB_1ST="project a huge holographic targeting reticule", VERB_3RD="projects a huge holographic targeting reticule" },
                  FIELD  = { VERB_1ST="project a cluster of huge holographic targeting reticules", VERB_3RD="projects a cluster of huge holographic targeting reticules" },
                  SPREAD = { VERB_1ST="project a cluster of huge holographic targeting reticules", VERB_3RD="projects a cluster of huge holographic targeting reticules" },
                  TOTAL  = { VERB_1ST="project a swarm of huge holographic targeting reticules", VERB_3RD="projects a swarm of huge holographic targeting reticules" },
              },
              [5] = {  -- severity 5
                  MELEE  = { VERB_1ST="project a giant holographic targeting reticule", VERB_3RD="projects a giant holographic targeting reticule" },
                  RANGED = { VERB_1ST="project a giant holographic targeting reticule", VERB_3RD="projects a giant holographic targeting reticule" },
                  FIELD  = { VERB_1ST="project a cluster of giant holographic targeting reticules", VERB_3RD="projects a cluster of giant holographic targeting reticules" },
                  SPREAD = { VERB_1ST="project a cluster of giant holographic targeting reticules", VERB_3RD="projects a cluster of giant holographic targeting reticules" },
                  TOTAL  = { VERB_1ST="project a swarm of giant holographic targeting reticules", VERB_3RD="projects a swarm of giant holographic targeting reticules" },
              },
              [6] = {  -- severity 6
                  MELEE  = { VERB_1ST="project a titanic holographic targeting reticule", VERB_3RD="projects a titanic holographic targeting reticule" },
                  RANGED = { VERB_1ST="project a titanic holographic targeting reticule", VERB_3RD="projects a titanic holographic targeting reticule" },
                  FIELD  = { VERB_1ST="project a cluster of titanic holographic targeting reticules", VERB_3RD="projects a cluster of titanic holographic targeting reticules" },
                  SPREAD = { VERB_1ST="project a cluster of titanic holographic targeting reticules", VERB_3RD="projects a cluster of titanic holographic targeting reticules" },
                  TOTAL  = { VERB_1ST="project a swarm of titanic holographic targeting reticules", VERB_3RD="projects a swarm of titanic holographic targeting reticules" },
              },
          },

          DEFENSE = {
              [1] = {  -- severity 1
                  SELF   = { VERB_1ST="project a minute holographic data screen", VERB_3RD="projects a minute holographic data screen" },
                  MELEE  = { VERB_1ST="project a minute holographic data screen", VERB_3RD="projects a minute holographic data screen" },
                  RANGED = { VERB_1ST="project a minute holographic data screen", VERB_3RD="projects a minute holographic data screen" },
                  FIELD  = { VERB_1ST="project a cluster of minute holographic data screens", VERB_3RD="projects a cluster of minute holographic data screens" },
                  SPREAD = { VERB_1ST="project a cluster of minute holographic data screens", VERB_3RD="projects a cluster of minute holographic data screens" },
                  TOTAL  = { VERB_1ST="project a swarm of minute holographic data screens", VERB_3RD="projects a swarm of minute holographic data screens" },
              },
              [2] = {  -- severity 2
                  SELF   = { VERB_1ST="project a small holographic data screen", VERB_3RD="projects a small holographic data screen" },
                  MELEE  = { VERB_1ST="project a small holographic data screen", VERB_3RD="projects a small holographic data screen" },
                  RANGED = { VERB_1ST="project a small holographic data screen", VERB_3RD="projects a small holographic data screen" },
                  FIELD  = { VERB_1ST="project a cluster of small holographic data screens", VERB_3RD="projects a cluster of small holographic data screens" },
                  SPREAD = { VERB_1ST="project a cluster of small holographic data screens", VERB_3RD="projects a cluster of small holographic data screens" },
                  TOTAL  = { VERB_1ST="project a swarm of small holographic data screens", VERB_3RD="projects a swarm of small holographic data screens" },
              },
              [3] = {  -- severity 3
                  SELF   = { VERB_1ST="project a large holographic data screen", VERB_3RD="projects a large holographic data screen" },
                  MELEE  = { VERB_1ST="project a large holographic data screen", VERB_3RD="projects a large holographic data screen" },
                  RANGED = { VERB_1ST="project a large holographic data screen", VERB_3RD="projects a large holographic data screen" },
                  FIELD  = { VERB_1ST="project a cluster of large holographic data screens", VERB_3RD="projects a cluster of large holographic data screens" },
                  SPREAD = { VERB_1ST="project a cluster of large holographic data screens", VERB_3RD="projects a cluster of large holographic data screens" },
                  TOTAL  = { VERB_1ST="project a swarm of large holographic data screens", VERB_3RD="projects a swarm of large holographic data screens" },
              },
              [4] = {  -- severity 4
                  SELF   = { VERB_1ST="project a huge holographic data screen", VERB_3RD="projects a huge holographic data screen" },
                  MELEE  = { VERB_1ST="project a huge holographic data screen", VERB_3RD="projects a huge holographic data screen" },
                  RANGED = { VERB_1ST="project a huge holographic data screen", VERB_3RD="projects a huge holographic data screen" },
                  FIELD  = { VERB_1ST="project a cluster of huge holographic data screens", VERB_3RD="projects a cluster of huge holographic data screens" },
                  SPREAD = { VERB_1ST="project a cluster of huge holographic data screens", VERB_3RD="projects a cluster of huge holographic data screens" },
                  TOTAL  = { VERB_1ST="project a swarm of huge holographic data screens", VERB_3RD="projects a swarm of huge holographic data screens" },
              },
              [5] = {  -- severity 5
                  SELF   = { VERB_1ST="project a giant holographic data screen", VERB_3RD="projects a giant holographic data screen" },
                  MELEE  = { VERB_1ST="project a giant holographic data screen", VERB_3RD="projects a giant holographic data screen" },
                  RANGED = { VERB_1ST="project a giant holographic data screen", VERB_3RD="projects a giant holographic data screen" },
                  FIELD  = { VERB_1ST="project a cluster of giant holographic data screens", VERB_3RD="projects a cluster of giant holographic data screens" },
                  SPREAD = { VERB_1ST="project a cluster of giant holographic data screens", VERB_3RD="projects a cluster of giant holographic data screens" },
                  TOTAL  = { VERB_1ST="project a swarm of giant holographic data screens", VERB_3RD="projects a swarm of giant holographic data screens" },
              },
              [6] = {  -- severity 6
                  SELF   = { VERB_1ST="project a titanic holographic data screen", VERB_3RD="projects a titanic holographic data screen" },
                  MELEE  = { VERB_1ST="project a titanic holographic data screen", VERB_3RD="projects a titanic holographic data screen" },
                  RANGED = { VERB_1ST="project a titanic holographic data screen", VERB_3RD="projects a titanic holographic data screen" },
                  FIELD  = { VERB_1ST="project a cluster of titanic holographic data screens", VERB_3RD="projects a cluster of titanic holographic data screens" },
                  SPREAD = { VERB_1ST="project a cluster of titanic holographic data screens", VERB_3RD="projects a cluster of titanic holographic data screens" },
                  TOTAL  = { VERB_1ST="project a swarm of titanic holographic data screens", VERB_3RD="projects a swarm of titanic holographic data screens" },
              },
          }
      },
	  
      -- =========================================================================
      -- CRAFTING
      -- =========================================================================
      CRAFTING = {
          FREE_RECIPES = false,
          FORT_BUILDING = "N_MATTER_REFINERY",
          FORT_REAGENT_MAT = "INORGANIC:N_MATTER",
          FORT_TOOL_PREFIX = "ITEM_TOOL_TABLET_INCOMPLETE_WARFARE",
          ADV_TOOL_MAT = "INORGANIC:N_MATTER",
          ADV_SCRAP_MAT = "INORGANIC:N_MATTER",
          ADV_TOOL_ID = "ITEM_TOOL_PORTABLE_SYNTH",
          COST_BASE = 5,
          COST_MULT = 5,
          COST_TARGET_MULT = 2,
          CATEGORY_ID_PREFIX = "DIGI_WARFARE",
      },
  }

  return M