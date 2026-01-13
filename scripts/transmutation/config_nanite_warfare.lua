 local shared = require("transmutation.config_transmutation_shared")

  local M = {
      -- =========================================================================
      -- SCHOOL IDENTITY
      -- =========================================================================
      SCHOOL_NAME = "Nanite Warfare",
      INNATE_CLASS = "NANOMACHINE",           -- Checks INNATE_NANOMACHINE_0 through INNATE_NANOMACHINE_6
      FIREWALL_CLASS_PREFIX = "NANOMACHINE",  -- Syndrome class prefix for this school's defense
      SILENCE_CLASS = "HACKED",            -- School-specific silence effect
      SCHOOL_THEME = "Nanite",            -- Used in descriptions
      CATEGORY_PREFIX = "NANO_WARFARE",    -- Crafting category prefix

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
      -- ABILITIES (Projectile Weapons)
      -- =========================================================================
      ABILITY_TYPES = {
          AUTOGUN = {
              name = "Autogun",
              token_prefix = "AUTOGUN",
              role = "DEFENSE",
              target_types = {"RANGED", "SPREAD", "TOTAL"},
              projectile = {
                  material = "INORGANIC:ENERGETIC_COMPOUND",
                  type = "SOLID_GLOB",
                  range = 100,
              },
              telegraph_ticks = 1,
              window_duration = 6,
              dwf_stretch = 10,
              burst_cooldown = 30,
              prepare_cooldowns = {1200, 600, 300, 150, 75, 40},
              fire_verb = "fire your autogun:fires their autogun:NA",
              target_verbs = {
                  [1] = {
                      RANGED = "construct a simple autogun:constructs a simple autogun:NA",
                      SPREAD = "construct a cluster of simple autoguns:constructs a cluster of simple autoguns:NA",
                      TOTAL  = "construct a battery of simple autoguns:constructs a battery of simple autoguns:NA",
                  },
                  [2] = {
                      RANGED = "construct a robust autogun:constructs a robust autogun:NA",
                      SPREAD = "construct a cluster of robust autoguns:constructs a cluster of robust autoguns:NA",
                      TOTAL  = "construct a battery of robust autoguns:constructs a battery of robust autoguns:NA",
                  },
                  [3] = {
                      RANGED = "construct a sophisticated autogun:constructs a sophisticated autogun:NA",
                      SPREAD = "construct a cluster of sophisticated autoguns:constructs a cluster of sophisticated autoguns:NA",
                      TOTAL  = "construct a battery of sophisticated autoguns:constructs a battery of sophisticated autoguns:NA",
                  },
                  [4] = {
                      RANGED = "construct an advanced autogun:constructs an advanced autogun:NA",
                      SPREAD = "construct a cluster of advanced autoguns:constructs a cluster of advanced autoguns:NA",
                      TOTAL  = "construct a battery of advanced autoguns:constructs a battery of advanced autoguns:NA",
                  },
                  [5] = {
                      RANGED = "construct a simple autogun:constructs a simple autogun:NA",
                      SPREAD = "construct a cluster of simple autoguns:constructs a cluster of simple autoguns:NA",
                      TOTAL  = "construct a battery of simple autoguns:constructs a battery of simple autoguns:NA",
                  },
                  [6] = {
                      RANGED = "PLACEHOLDER:PLACEHOLDER:NA",
                      SPREAD = "PLACEHOLDER:PLACEHOLDER:NA",
                      TOTAL  = "PLACEHOLDER:PLACEHOLDER:NA",
                  },
              }
          },

          BLADE = {
              name = "Blade",
              token_prefix = "BLADE",
              role = "DEFENSE",
              target_types = {"MELEE", "FIELD"},
              projectile = {
                  material = "INORGANIC:ALLOY",
                  type = "SHARP_ROCK",
                  range = 15,
              },
              telegraph_ticks = 1,
              window_duration = 4,
              dwf_stretch = 10,
              burst_cooldown = 20,
              prepare_cooldowns = {1200, 600, 300, 150, 75, 40},
              fire_verb = "slash with your blade:slashes with their blade:NA",
              target_verbs = {
                  [1] = {
                      MELEE = "PLACEHOLDER:PLACEHOLDER:NA",
                      FIELD = "PLACEHOLDER:PLACEHOLDER:NA",
                  },
                  [2] = {
                      MELEE = "PLACEHOLDER:PLACEHOLDER:NA",
                      FIELD = "PLACEHOLDER:PLACEHOLDER:NA",
                  },
                  [3] = {
                      MELEE = "PLACEHOLDER:PLACEHOLDER:NA",
                      FIELD = "PLACEHOLDER:PLACEHOLDER:NA",
                  },
                  [4] = {
                      MELEE = "PLACEHOLDER:PLACEHOLDER:NA",
                      FIELD = "PLACEHOLDER:PLACEHOLDER:NA",
                  },
                  [5] = {
                      MELEE = "PLACEHOLDER:PLACEHOLDER:NA",
                      FIELD = "PLACEHOLDER:PLACEHOLDER:NA",
                  },
                  [6] = {
                      MELEE = "PLACEHOLDER:PLACEHOLDER:NA",
                      FIELD = "PLACEHOLDER:PLACEHOLDER:NA",
                  },
              }
          },

          CANNON = {
              name = "Cannon",
              token_prefix = "CANNON",
              role = "DEFENSE",
              target_types = {"RANGED"},
              projectile = {
                  material = "INORGANIC:ENERGETIC_COMPOUND",
                  type = "SHARP_ROCK",
                  range = 200,
              },
              telegraph_ticks = 2,
              window_duration = 9,
              dwf_stretch = 10,
              burst_cooldown = 60,
              prepare_cooldowns = {2400, 1200, 600, 300, 150, 75},
              fire_verb = "fire your cannon:fires their cannon:NA",
              target_verbs = {
                  [1] = "are armed with a light nanocannon:is armed with a light nanocannon:NA",
                  [2] = "are armed with a nanocannon:is armed with a nanocannon:NA",
                  [3] = "are armed with a heavy nanocannon:is armed with a heavy nanocannon:NA",
                  [4] = "are armed with a massive nanocannon:is armed with a massive nanocannon:NA",
                  [5] = "are armed with an immense nanocannon:is armed with an immense nanocannon:NA",
                  [6] = "are armed with a colossal nanocannon:is armed with a colossal nanocannon:NA",
              }
          },

          CLOUD = {
              name = "Nanomachine Cloud",
              token_prefix = "CLOUD",
              role = "DEFENSE",
              target_types = {"RANGED", "SPREAD", "TOTAL"},
              projectile = {
                  material = "INORGANIC:ALLOY",
                  type = "UNDIRECTED_DUST",
                  range = 1,
              },
              telegraph_ticks = 3,
              window_duration = 9,
              dwf_stretch = 10,
              burst_cooldown = 60,
              prepare_cooldowns = {2400, 1200, 600, 300, 150, 75},
              fire_verb = "emit a cloud of nanomachines:emits a cloud of nanomachines:NA",
              target_verbs = {
                  [1] = {
                      RANGED = "PLACEHOLDER:PLACEHOLDER:NA",
                      SPREAD = "PLACEHOLDER:PLACEHOLDER:NA",
                      TOTAL  = "PLACEHOLDER:PLACEHOLDER:NA",
                  },
                  [2] = {
                      RANGED = "PLACEHOLDER:PLACEHOLDER:NA",
                      SPREAD = "PLACEHOLDER:PLACEHOLDER:NA",
                      TOTAL  = "PLACEHOLDER:PLACEHOLDER:NA",
                  },
                  [3] = {
                      RANGED = "PLACEHOLDER:PLACEHOLDER:NA",
                      SPREAD = "PLACEHOLDER:PLACEHOLDER:NA",
                      TOTAL  = "PLACEHOLDER:PLACEHOLDER:NA",
                  },
                  [4] = {
                      RANGED = "PLACEHOLDER:PLACEHOLDER:NA",
                      SPREAD = "PLACEHOLDER:PLACEHOLDER:NA",
                      TOTAL  = "PLACEHOLDER:PLACEHOLDER:NA",
                  },
                  [5] = {
                      RANGED = "PLACEHOLDER:PLACEHOLDER:NA",
                      SPREAD = "PLACEHOLDER:PLACEHOLDER:NA",
                      TOTAL  = "PLACEHOLDER:PLACEHOLDER:NA",
                  },
                  [6] = {
                      RANGED = "PLACEHOLDER:PLACEHOLDER:NA",
                      SPREAD = "PLACEHOLDER:PLACEHOLDER:NA",
                      TOTAL  = "PLACEHOLDER:PLACEHOLDER:NA",
                  },
              }
          },

          NANOJET = {
              name = "Nanomachine Jet",
              token_prefix = "NANOJET",
              role = "DEFENSE",
              target_types = {"RANGED", "SPREAD", "TOTAL"},
              projectile = {
                  material = "INORGANIC:ALLOY",
                  type = "TRAILING_DUST_FLOW",
                  range = 1,
              },
              telegraph_ticks = 2,
              window_duration = 6,
              dwf_stretch = 10,
              burst_cooldown = 20,
              prepare_cooldowns = {1200, 600, 300, 150, 75, 40},
              fire_verb = "emit a jet of nanomachines:emits a jet of nanomachines:NA",
              target_verbs = {
                  [1] = "are armed with a light nanocannon:is armed with a light nanocannon:NA",
                  [2] = "are armed with a nanocannon:is armed with a nanocannon:NA",
                  [3] = "are armed with a heavy nanocannon:is armed with a heavy nanocannon:NA",
                  [4] = "are armed with a massive nanocannon:is armed with a massive nanocannon:NA",
                  [5] = "are armed with an immense nanocannon:is armed with an immense nanocannon:NA",
                  [6] = "are armed with a colossal nanocannon:is armed with a colossal nanocannon:NA",
              }
          },


          ROTORGUN = {
              name = "Rotorgun",
              token_prefix = "ROTORGUN",
              role = "DEFENSE",
              target_types = {"RANGED"},
              projectile = {
                  material = "INORGANIC:ENERGETIC_COMPOUND",
                  type = "SOLID_GLOB",
                  range = 100,
              },
              telegraph_ticks = 2,
              window_duration = 5,
              dwf_stretch = 10,
              burst_cooldown = 3,  -- Very rapid fire
              prepare_cooldowns = {2400, 1200, 600, 300, 150, 75},
              fire_verb = "fire your rotorgun:fires their rotorgun:NA",
              target_verbs = {
                  [1] = "are armed with a light rotorgun:is armed with a light rotorgun:NA",
                  [2] = "are armed with a rotorgun:is armed with a rotorgun:NA",
                  [3] = "are armed with a heavy rotorgun:is armed with a heavy rotorgun:NA",
                  [4] = "are armed with a massive rotorgun:is armed with a massive rotorgun:NA",
                  [5] = "are armed with an immense rotorgun:is armed with an immense rotorgun:NA",
                  [6] = "are armed with a colossal rotorgun:is armed with a colossal rotorgun:NA",
              }
          },

          NANOWEB = {
              name = "Nanomachine Webbing",
              token_prefix = "NANOWEB",
              role = "DEFENSE",
              target_types = {"RANGED", "SPREAD", "TOTAL"},
              projectile = {
                  material = "INORGANIC:ENERGETIC_COMPOUND",
                  type = "WEB_SPRAY",
                  range = 1,
              },
              telegraph_ticks = 2,
              window_duration = 9,
              dwf_stretch = 10,
              burst_cooldown = 60,
              prepare_cooldowns = {2400, 1200, 600, 300, 150, 75},
              fire_verb = "emit tendrils of webbing:emits tendrils of webbing:NA",
              target_verbs = {
                  [1] = "are armed with a light nanocannon:is armed with a light nanocannon:NA",
                  [2] = "are armed with a nanocannon:is armed with a nanocannon:NA",
                  [3] = "are armed with a heavy nanocannon:is armed with a heavy nanocannon:NA",
                  [4] = "are armed with a massive nanocannon:is armed with a massive nanocannon:NA",
                  [5] = "are armed with an immense nanocannon:is armed with an immense nanocannon:NA",
                  [6] = "are armed with a colossal nanocannon:is armed with a colossal nanocannon:NA",
              }
          },

      -- =========================================================================
      -- ATTRIBUTE ENHANCEMENT ABILITIES
      -- =========================================================================
          ENHANCE_STRENGTH = {
              name = "Enhance Strength",
              token_prefix = "ENHANCE_STRENGTH",
              role = "DEFENSE",
              target_types = {"SELF"},
              duration = 10000,
              phys_att_buff = {"STRENGTH"},
              phys_att_buff_values = {120, 140, 160, 180, 200, 220},
              target_verbs = {
                  [1] = "are partially covered by a thin exterior of artificial muscle:is partially covered by a thin exterior of artificial muscle:NA",
                  [2] = "are covered by a thin exterior of artificial muscle:is covered by a thin exterior of artificial muscle:NA",
                  [3] = "are covered by a dense exterior of artificial muscle:is covered by a dense exterior of artificial muscle:NA",
                  [4] = "are enveloped in thick bundles of artificial muscle:is enveloped in thick bundles of artificial muscle:NA",
                  [5] = "are enveloped in grotesquely thick bundles of artificial muscle:is enveloped in grotesquely thick bundles of artificial muscle:NA",
                  [6] = "are completely encased in massive bundles of artificial muscle:is completely encased in massive bundles of artificial muscle:NA",
              }
          },

          ENHANCE_AGILITY = {
              name = "Enhance Agility",
              token_prefix = "ENHANCE_AGILITY",
              role = "DEFENSE",
              target_types = {"SELF"},
              duration = 10000,
              phys_att_buff = {"AGILITY"},
              phys_att_buff_values = {120, 140, 160, 180, 200, 220},
              target_verbs = {
                  [1] = "extrude several small thruster rockets from the tips of your limbs:extrudes several small thruster rockets from the tips of their limbs:NA",
                  [2] = "extrude several small thruster rockets from parts of your body:extrudes several small thruster rockets from parts of their body:NA",
                  [3] = "extrude multiple small thruster rockets from parts of your body:extrudes multiple small thruster rockets from parts of their body:NA",
                  [4] = "extrude multiple small thruster rockets from all over your body:extrudes multiple small thruster rockets from all over their body:NA",
                  [5] = "extrude many small thruster rockets from all over your body:extrudes many small thruster rockets from all over their body:NA",
                  [6] = "extrude countless small thruster rockets from every surface of your body:extrudes countless small thruster rockets from every surface of their body:NA",
              }
          },

          ENHANCE_TOUGHNESS = {
              name = "Enhance Toughness",
              token_prefix = "ENHANCE_TOUGHNESS",
              role = "DEFENSE",
              target_types = {"SELF"},
              duration = 10000,
              phys_att_buff = {"TOUGHNESS"},
              phys_att_buff_values = {120, 140, 160, 180, 200, 220},
              target_verbs = {
                  [1] = "become partially covered by thin strips of metal adhering to your body:becomes partially covered by thin strips of metal adhering to their body:NA",
                  [2] = "become partially covered by thin plates of metal adhering to your body:becomes partially covered by thin plates of metal adhering to their body:NA",
                  [3] = "become covered by thin plates of metal adhering to your body:becomes covered by thin plates of metal adhering to their body:NA",
                  [4] = "become covered by thick slabs of metal adhering to your body:becomes covered by thick slabs of metal adhering to their body:NA",
                  [5] = "become covered by thick slabs of metal that obscure your original form:becomes covered by thick slabs of metal that obscures their original form:NA",
                  [6] = "become completely encased in impenetrable layers of metal armor:becomes completely encased in impenetrable layers of metal armor:NA",
              }
          },

          ENHANCE_ENDURANCE = {
              name = "Enhance Endurance",
              token_prefix = "ENHANCE_ENDURANCE",
              role = "DEFENSE",
              target_types = {"SELF"},
              duration = 10000,
              phys_att_buff = {"ENDURANCE"},
              phys_att_buff_values = {120, 140, 160, 180, 200, 220},
              target_verbs = {
                  [1] = "emit faint amounts of heat exhaust from your internal reactor:emits faint amounts of heat exhaust from their internal reactor:NA",
                  [2] = "emit visible amounts of heat exhaust from your internal reactor:emits visible amounts of heat exhaust from their internal reactor:NA",
                  [3] = "emit large amounts of heat exhaust from your internal reactor:emits large amounts of heat exhaust from their internal reactor:NA",
                  [4] = "emit large amounts of heat exhaust and a slight glow from your internal reactor:emits large amounts of heat exhaust and a slight glow from their internal reactor:NA",
                  [5] = "emit massive amounts of heat exhaust and glow from your internal reactor:emits massive amounts of heat exhaust and glows from their internal reactor:NA",
                  [6] = "radiate blinding heat and light from your overclocked internal reactor:radiates blinding heat and light from their overclocked internal reactor:NA",
              }
          },

          ENHANCE_SPEED = {
              name = "Enhance Speed",
              token_prefix = "ENHANCE_SPEED",
              role = "DEFENSE",
              target_types = {"SELF"},
              duration = 10000,
              speed_buff_values = {120, 140, 160, 180, 200, 220},
              target_verbs = {
                  [1] = "extrude a small thruster rocket on the back of your body:extrudes a small thruster rocket on the back of their body:NA",
                  [2] = "extrude a large thruster rocket on the back of your body:extrudes a large thruster rocket on the back of their body:NA",
                  [3] = "extrude several large thruster rockets on the back of your body:extrudes several large thruster rockets on the back of their body:NA",
                  [4] = "extrude several large thruster rockets on the back and limbs of your body:extrudes several large thruster rockets on the back and limbs of their body:NA",
                  [5] = "extrude multiple large thruster rockets on the back and limbs of your body:extrudes multiple large thruster rockets on the back and limbs of their body:NA",
                  [6] = "extrude massive thruster arrays across your entire body:extrudes massive thruster arrays across their entire body:NA",
              }
          },

      -- =========================================================================
      -- HEALING ABILITIES (with innate class restrictions for non-SELF targets)
      -- =========================================================================
          REGENERATE = {
              name = "Regenerate",
              token_prefix = "REGENERATE",
              role = "DEFENSE",
              target_types = {"SELF", "MELEE", "FIELD"},
              cooldown_values = {12000, 10000, 8000, 6000, 4000, 2000},
              healing_effects = {
                  target_type = "CREATURE",
                  effect_type = "ADD_SYNDROME",
                  innate_class = "INNATE_NANOMACHINE",
                  syndrome = [[
[SYN_CONCENTRATION_ADDED:1000:0]
[CE_STOP_BLEEDING:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
[CE_CLOSE_OPEN_WOUNDS:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
[CE_HEAL_TISSUES:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
[CE_HEAL_NERVES:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
[CE_REDUCE_PAIN:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
[CE_REDUCE_SWELLING:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
[CE_CURE_INFECTION:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
[CE_REDUCE_PARALYSIS:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
[CE_REDUCE_DIZZINESS:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
[CE_REDUCE_NAUSEA:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
[CE_REDUCE_FEVER:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
]],
              },
              target_verbs = {
                  [1] = {
                      SELF = "release a trickle of regenerative nanomachines:releases a trickle of regenerative nanomachines:NA",
                      MELEE = "inject a trickle of regenerative nanomachines:injects a trickle of regenerative nanomachines:NA",
                      FIELD = "emit a trickle of regenerative nanomachines:emits a trickle of regenerative nanomachines:NA",
                  },
                  [2] = {
                      SELF = "release a stream of regenerative nanomachines:releases a stream of regenerative nanomachines:NA",
                      MELEE = "inject a stream of regenerative nanomachines:injects a stream of regenerative nanomachines:NA",
                      FIELD = "emit a stream of regenerative nanomachines:emits a stream of regenerative nanomachines:NA",
                  },
                  [3] = {
                      SELF = "release a surge of regenerative nanomachines:releases a surge of regenerative nanomachines:NA",
                      MELEE = "inject a surge of regenerative nanomachines:injects a surge of regenerative nanomachines:NA",
                      FIELD = "emit a surge of regenerative nanomachines:emits a surge of regenerative nanomachines:NA",
                  },
                  [4] = {
                      SELF = "release a flood of regenerative nanomachines:releases a flood of regenerative nanomachines:NA",
                      MELEE = "inject a flood of regenerative nanomachines:injects a flood of regenerative nanomachines:NA",
                      FIELD = "emit a flood of regenerative nanomachines:emits a flood of regenerative nanomachines:NA",
                  },
                  [5] = {
                      SELF = "release a torrent of regenerative nanomachines:releases a torrent of regenerative nanomachines:NA",
                      MELEE = "inject a torrent of regenerative nanomachines:injects a torrent of regenerative nanomachines:NA",
                      FIELD = "emit a torrent of regenerative nanomachines:emits a torrent of regenerative nanomachines:NA",
                  },
                  [6] = {
                      SELF = "release a deluge of regenerative nanomachines:releases a deluge of regenerative nanomachines:NA",
                      MELEE = "inject a deluge of regenerative nanomachines:injects a deluge of regenerative nanomachines:NA",
                      FIELD = "emit a deluge of regenerative nanomachines:emits a deluge of regenerative nanomachines:NA",
                  },
              }
          },

          REVIVE = {
              name = "Revive",
              token_prefix = "REVIVE",
              role = "DEFENSE",
              target_types = {"MELEE"},
              cooldown_values = {12000, 10000, 8000, 6000, 4000, 2000},
              healing_effects = {
                  target_type = "CORPSE",
                  location = "CONTEXT_ITEM",
                  effect_type = "RESURRECT",
                  innate_class = "INNATE_NANOMACHINE",
                  requires = {"FIT_FOR_RESURRECTION", "CAN_LEARN"},
                  forbidden = {"NOT_LIVING"},
                  manual_input = "corpses",
                  syndrome = [[
[CE_ADD_TAG:CAN_SPEAK:START:0]
[CE_REMOVE_TAG:NO_AGING:OPPOSED_TO_LIFE:START:0]
[SYN_CONCENTRATION_ADDED:1000:0]
[CE_STOP_BLEEDING:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
[CE_CLOSE_OPEN_WOUNDS:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
[CE_HEAL_TISSUES:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
[CE_HEAL_NERVES:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
[CE_REDUCE_PAIN:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
[CE_REDUCE_SWELLING:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
[CE_CURE_INFECTION:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
[CE_REDUCE_PARALYSIS:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
[CE_REDUCE_DIZZINESS:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
[CE_REDUCE_NAUSEA:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
[CE_REDUCE_FEVER:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
[CE_REGROW_PARTS:SEV:100:PROB:100:START:0:PEAK:0:END:50:ABRUPT]
]],
              },
              target_verbs = {
                  [1] = "extrude thin wires into a corpse:extrudes thin wires into a corpse:NA",
                  [2] = "extrude wires into a corpse:extrudes wires into a corpse:NA",
                  [3] = "extrude thick wires into a corpse:extrudes thick wires into a corpse:NA",
                  [4] = "extrude a web of wires into a corpse:extrudes a web of wires into a corpse:NA",
                  [5] = "extrude a dense web of wires into a corpse:extrudes a dense web of wires into a corpse:NA",
                  [6] = "extrude a sprawling network of wires into a corpse:extrudes a sprawling network of wires into a corpse:NA",
              }
          },
      }, 


      -- =========================================================================
      -- TELEGRAPHS
      -- =========================================================================
	  FLAVOR_TEXT = {
          -- All target types use the same text (user coalesces nanomachines on self)
          DEFENSE = {
              [1] = {
                  SELF   = { VERB_1ST="coalesce a faint cloud of nanomachines", VERB_3RD="coalesces a faint cloud of nanomachines" },
                  MELEE  = { VERB_1ST="coalesce a faint cloud of nanomachines", VERB_3RD="coalesces a faint cloud of nanomachines" },
                  RANGED = { VERB_1ST="coalesce a faint cloud of nanomachines", VERB_3RD="coalesces a faint cloud of nanomachines" },
                  FIELD  = { VERB_1ST="coalesce a faint cloud of nanomachines", VERB_3RD="coalesces a faint cloud of nanomachines" },
                  SPREAD = { VERB_1ST="coalesce a faint cloud of nanomachines", VERB_3RD="coalesces a faint cloud of nanomachines" },
                  TOTAL  = { VERB_1ST="coalesce a faint cloud of nanomachines", VERB_3RD="coalesces a faint cloud of nanomachines" },
              },
              [2] = {
                  SELF   = { VERB_1ST="coalesce a thin cloud of nanomachines", VERB_3RD="coalesces a thin cloud of nanomachines" },
                  MELEE  = { VERB_1ST="coalesce a thin cloud of nanomachines", VERB_3RD="coalesces a thin cloud of nanomachines" },
                  RANGED = { VERB_1ST="coalesce a thin cloud of nanomachines", VERB_3RD="coalesces a thin cloud of nanomachines" },
                  FIELD  = { VERB_1ST="coalesce a thin cloud of nanomachines", VERB_3RD="coalesces a thin cloud of nanomachines" },
                  SPREAD = { VERB_1ST="coalesce a thin cloud of nanomachines", VERB_3RD="coalesces a thin cloud of nanomachines" },
                  TOTAL  = { VERB_1ST="coalesce a thin cloud of nanomachines", VERB_3RD="coalesces a thin cloud of nanomachines" },
              },
              [3] = {
                  SELF   = { VERB_1ST="coalesce a dense cloud of nanomachines", VERB_3RD="coalesces a dense cloud of nanomachines" },
                  MELEE  = { VERB_1ST="coalesce a dense cloud of nanomachines", VERB_3RD="coalesces a dense cloud of nanomachines" },
                  RANGED = { VERB_1ST="coalesce a dense cloud of nanomachines", VERB_3RD="coalesces a dense cloud of nanomachines" },
                  FIELD  = { VERB_1ST="coalesce a dense cloud of nanomachines", VERB_3RD="coalesces a dense cloud of nanomachines" },
                  SPREAD = { VERB_1ST="coalesce a dense cloud of nanomachines", VERB_3RD="coalesces a dense cloud of nanomachines" },
                  TOTAL  = { VERB_1ST="coalesce a dense cloud of nanomachines", VERB_3RD="coalesces a dense cloud of nanomachines" },
              },
              [4] = {
                  SELF   = { VERB_1ST="coalesce a roiling cloud of nanomachines", VERB_3RD="coalesces a roiling cloud of nanomachines" },
                  MELEE  = { VERB_1ST="coalesce a roiling cloud of nanomachines", VERB_3RD="coalesces a roiling cloud of nanomachines" },
                  RANGED = { VERB_1ST="coalesce a roiling cloud of nanomachines", VERB_3RD="coalesces a roiling cloud of nanomachines" },
                  FIELD  = { VERB_1ST="coalesce a roiling cloud of nanomachines", VERB_3RD="coalesces a roiling cloud of nanomachines" },
                  SPREAD = { VERB_1ST="coalesce a roiling cloud of nanomachines", VERB_3RD="coalesces a roiling cloud of nanomachines" },
                  TOTAL  = { VERB_1ST="coalesce a roiling cloud of nanomachines", VERB_3RD="coalesces a roiling cloud of nanomachines" },
              },
              [5] = {
                  SELF   = { VERB_1ST="coalesce an immense cloud of nanomachines", VERB_3RD="coalesces an immense cloud of nanomachines" },
                  MELEE  = { VERB_1ST="coalesce an immense cloud of nanomachines", VERB_3RD="coalesces an immense cloud of nanomachines" },
                  RANGED = { VERB_1ST="coalesce an immense cloud of nanomachines", VERB_3RD="coalesces an immense cloud of nanomachines" },
                  FIELD  = { VERB_1ST="coalesce an immense cloud of nanomachines", VERB_3RD="coalesces an immense cloud of nanomachines" },
                  SPREAD = { VERB_1ST="coalesce an immense cloud of nanomachines", VERB_3RD="coalesces an immense cloud of nanomachines" },
                  TOTAL  = { VERB_1ST="coalesce an immense cloud of nanomachines", VERB_3RD="coalesces an immense cloud of nanomachines" },
              },
              [6] = {
                  SELF   = { VERB_1ST="coalesce a titanic cloud of nanomachines", VERB_3RD="coalesces a titanic cloud of nanomachines" },
                  MELEE  = { VERB_1ST="coalesce a titanic cloud of nanomachines", VERB_3RD="coalesces a titanic cloud of nanomachines" },
                  RANGED = { VERB_1ST="coalesce a titanic cloud of nanomachines", VERB_3RD="coalesces a titanic cloud of nanomachines" },
                  FIELD  = { VERB_1ST="coalesce a titanic cloud of nanomachines", VERB_3RD="coalesces a titanic cloud of nanomachines" },
                  SPREAD = { VERB_1ST="coalesce a titanic cloud of nanomachines", VERB_3RD="coalesces a titanic cloud of nanomachines" },
                  TOTAL  = { VERB_1ST="coalesce a titanic cloud of nanomachines", VERB_3RD="coalesces a titanic cloud of nanomachines" },
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
          CATEGORY_ID_PREFIX = "NANO_WARFARE",
      },
  }

  return M