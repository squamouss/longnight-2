  local M = {
      -- =========================================================================
      -- UNIVERSAL POWER SCALING
      -- =========================================================================
      MAX_POWER_LEVEL = 6,
      WORLDGEN_RARITY_CONSTANT = 10,

      -- =========================================================================
      -- TARGET TYPE SYSTEM (Shared by all schools)
      -- =========================================================================
      TARGET_TYPES = {
          SELF = {
              order = 1,
              max_targets = 1,
              cdi_target = "SELF_ONLY",
              range = nil,
              cost_tier = 0,
              desc = "self-only"
          },
          MELEE = {
              order = 2,
              max_targets = 1,
              cdi_target = "TOUCHABLE",
              range = nil,
              cost_tier = 0,
              desc = "melee"
          },
          RANGED = {
              order = 3,
              max_targets = 1,
              cdi_target = "LINE_OF_SIGHT",
              range = 100,
              cost_tier = 1,
              desc = "ranged single-target"
          },
          FIELD = {
              order = 4,
              max_targets = 10,
              cdi_target = "TOUCHABLE",
              range = nil,
              cost_tier = 2,
              desc = "melee area"
          },
          SPREAD = {
              order = 5,
              max_targets = 10,
              cdi_target = "LINE_OF_SIGHT",
              range = 100,
              cost_tier = 3,
              desc = "ranged area"
          },
          TOTAL = {
              order = 6,
              max_targets = 100,
              cdi_target = "LINE_OF_SIGHT",
              range = 100,
              cost_tier = 4,
              desc = "mass effect"
          }
      },

      -- =========================================================================
      -- UNIVERSAL SEVERITY SYSTEM
      -- =========================================================================
      SEVERITY_ADJECTIVES = {
          [1]="severity-1", [2]="severity-2", [3]="severity-3",
          [4]="severity-4", [5]="severity-5", [6]="severity-6"
      },

      SEVERITY_SYMBOLS = {
          [1]=249, [2]=248, [3]=009, [4]=111, [5]=079, [6]=008
      },

      -- =========================================================================
      -- UNIVERSAL ROLE COLORS
      -- =========================================================================
      COLORS = { OFFENSE="4:0:0", DEFENSE="3:0:1" },
  }

  return M