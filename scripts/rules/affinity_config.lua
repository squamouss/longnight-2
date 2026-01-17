  local log = _G.log or function(...) end
  log("AFFINITY_CONFIG: Loading unified affinity configuration.")

  local M = {}

  -- ============================================================================
  -- ARCHETYPES: Base Affinity Scores by Creature Archetype
  -- ============================================================================
  -- Each archetype defines base scores for all three affinity types.
  -- Format: { digital = X, energy = Y, nanite = Z }

  M.ARCHETYPES = {
      -- Machine Archetypes
      ["BIOMACHINE"]      = { digital = 1, energy = 2, nanite = 1 },
      ["CYBERMACHINE"]    = { digital = 2, energy = 1, nanite = 1 },
      ["DEMIMACHINE"]     = { digital = 1, energy = 1, nanite = 2 },
      ["NANOMACHINE"]     = { digital = 1, energy = 1, nanite = 2 },
      ["HOLOMACHINE"]     = { digital = 2, energy = 1, nanite = 1 },
      ["XENOMACHINE"]     = { digital = 1, energy = 2, nanite = 1 },

      -- Caste Archetypes
      ["LOCASTE"]         = { digital = 0, energy = 0, nanite = 0 },
      ["HICASTE"]         = { digital = 0, energy = 0, nanite = 0 },
      ["EXCASTE"]         = { digital = 0, energy = 0, nanite = 0 },
      ["NUCASTE"]         = { digital = 0, energy = 0, nanite = 0 },
      ["CYCASTE"]         = { digital = 1, energy = 1, nanite = 1 },

      -- Biological Archetypes
      ["CHIMERA"]         = { digital = 0, energy = 0, nanite = 0 },
      ["PROTOCHIMERA"]    = { digital = 0, energy = 0, nanite = 0 },
      ["PALEOCHIMERA"]    = { digital = 0, energy = 0, nanite = 0 },
      ["POLYMERID"]       = { digital = 0, energy = 0, nanite = 1 },
      ["SILICID"]         = { digital = 1, energy = 0, nanite = 0 },
      ["ELASTOMERID"]     = { digital = 0, energy = 1, nanite = 0 },
      ["MACROCELL"]       = { digital = 0, energy = 0, nanite = 0 },

      -- Default Fallback
      ["DEFAULT"]         = { digital = 1, energy = 0, nanite = 0 }
  }

  -- ============================================================================
  -- SUB_ARCHETYPES: Modifiers Based on Body/Form Characteristics
  -- ============================================================================
  -- Fine-grained adjustments based on sub-archetype traits.
  -- Format: { digital = X, energy = Y, nanite = Z }

  M.SUB_ARCHETYPES = {
      -- Augmentation Types
      ["BLINDSIGHT"]      = { digital = 1, energy = 0, nanite = 0 },
      ["NEOTENATE"]       = { digital = 0, energy = 1, nanite = 0 },
      ["CANCER"]          = { digital = 0, energy = 0, nanite = 1 },
	  
      ["CYBORG"]          = { digital = 1, energy = 0, nanite = 0 },
      ["NANITE"]          = { digital = 0, energy = 0, nanite = 1 },
      ["EVOLVED"]         = { digital = 0, energy = 1, nanite = 0 },

      ["BULK"]            = { digital = 1, energy = 0, nanite = 0 },
      ["SLEEK"]           = { digital = 1, energy = 0, nanite = 1 },
      ["SKELETON"]        = { digital = 1, energy = 1, nanite = 0 },

      ["HORROR"]          = { digital = 1, energy = 1, nanite = 1 },
      ["DEVIL"]           = { digital = 0, energy = 2, nanite = 1 },
      ["OGRE"]            = { digital = 0, energy = 1, nanite = 2 },
      ["HUMAN"]           = { digital = 1, energy = 1, nanite = 1 },
	  
      ["ANDROID"]         = { digital = 1, energy = 0, nanite = 2 },
      ["INDUSTRIAL"]      = { digital = 1, energy = 1, nanite = 1 },
      ["DOLL"]            = { digital = 2, energy = 0, nanite = 1 },
      ["SCRAP"]           = { digital = 1, energy = 1, nanite = 1 },
      ["SKINWALKER"]      = { digital = 1, energy = 2, nanite = 0 },

      ["WET"]             = { digital = 0, energy = 1, nanite = 2 },
      ["CORRUPT"]         = { digital = 1, energy = 1, nanite = 1 },
      ["PRISTINE"]        = { digital = 0, energy = 2, nanite = 1 },

      ["MECHA"]           = { digital = 1, energy = 1, nanite = 1 },
      ["SWARM"]           = { digital = 2, energy = 0, nanite = 1 },
      ["FRANKENSTEIN"]    = { digital = 0, energy = 2, nanite = 1 },
	  
      ["HYBRID"]          = { digital = 1, energy = 1, nanite = 1 },
      ["GLITCH"]          = { digital = 1, energy = 2, nanite = 0 },
      ["FAIRY"]           = { digital = 2, energy = 1, nanite = 0 },

      ["CONTROL"]         = { digital = 2, energy = 1, nanite = 0 },
      ["CHAOS"]           = { digital = 1, energy = 1, nanite = 1 },
      ["GHOST"]           = { digital = 1, energy = 2, nanite = 0 },

      -- Default Fallback
      ["UNKNOWN"]         = { digital = 0, energy = 0, nanite = 1 }
  }

  -- ============================================================================
  -- RATINGS: Modifiers Based on Threat Level and Role
  -- ============================================================================
  -- Adjustments based on creature rating tags (threat, role, etc.)
  -- Format: { digital = X, energy = Y, nanite = Z }

  M.RATINGS = {
      -- Extreme Threats
      ["INCURSION"]       = { digital = 2, energy = 2, nanite = 2 },
      ["EXISTENTIAL"]     = { digital = 2, energy = 2, nanite = 2 },
      ["AVATAR"]          = { digital = 2, energy = 2, nanite = 2 },
      ["HOSTILE"]         = { digital = 1, energy = 1, nanite = 1 },

      -- Special Classifications
      ["VESSEL"]          = { digital = 0, energy = 0, nanite = 0 },
      ["DEVIANT"]         = { digital = 0, energy = 0, nanite = 0 },
      ["SOPHONT"]         = { digital = 0, energy = 0, nanite = 0 },

      -- Threat Levels
      ["DANGEROUS"]       = { digital = 0, energy = 0, nanite = 0 },
      ["HAZARDOUS"]       = { digital = 0, energy = 0, nanite = 0 },
      ["PROBLEMATIC"]     = { digital = -1, energy = -1, nanite = -1 },
      ["BENIGN"]          = { digital = -1, energy = -1, nanite = -1 },

      -- Low Priority
      ["VERMIN"]          = { digital = -3, energy = -3, nanite = -3 },
      ["AMBIENT"]         = { digital = -3, energy = -3, nanite = -3 },

      -- Domestic Roles
      ["DOMESTIC"]        = { digital = -1, energy = -1, nanite = -1 },
      ["COMPANION"]       = { digital = -1, energy = -1, nanite = -1 },
      ["SANITATION"]      = { digital = -1, energy = -1, nanite = -1 },
      ["HUNTER"]          = { digital = -1, energy = -1, nanite = -1 },
      ["LIVESTOCK"]       = { digital = -1, energy = -1, nanite = -1 },

      -- Utility Roles
      ["PRODUCT"]         = { digital = -2, energy = -2, nanite = -2 },
      ["CARRIER"]         = { digital = 0, energy = 0, nanite = 0 },
      ["SERVANT"]         = { digital = 0, energy = 0, nanite = 0 },

      -- Military/Combat Roles
      ["MILITARY"]        = { digital = 0, energy = 0, nanite = 0 },
      ["WEAPON"]          = { digital = 0, energy = 0, nanite = 0 },
      ["VEHICLE"]         = { digital = 0, energy = 0, nanite = 0 },
      ["NOMAD"]           = { digital = 0, energy = 0, nanite = 0 },

      -- Default Fallback
      ["DEFAULT"]         = { digital = 0, energy = 0, nanite = 0 }
  }

  return M