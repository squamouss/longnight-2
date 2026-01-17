  local log = _G.log or function(...) end

  -- ============================================================================
  -- 1. ROBUST MODULE LOADING
  -- ============================================================================
  -- Load the unified affinity configuration module

  local function load_affinity_module()
      -- 1. Try "rules.affinity_config" (Standard DF structure)
      local status, mod = pcall(require, "rules.affinity_config")
      if status and mod then return mod end

      -- 2. Try "affinity_config" (Flat/Standalone structure)
      status, mod = pcall(require, "affinity_config")
      if status and mod then return mod end

      return nil
  end

  local affinity_config = load_affinity_module()
  if not affinity_config then
      log("FIREWALL_CALC: ERROR! 'affinity_config.lua' could not be found. Using empty defaults.")
      -- Provide fallback structure
      affinity_config = {
          ARCHETYPES = { DEFAULT = { digital = 0, energy = 0, nanite = 0 } },
          SUB_ARCHETYPES = {},
          RATINGS = { DEFAULT = { digital = 0, energy = 0, nanite = 0 } }
      }
  end

  local M = {}

  -- ============================================================================
  -- HELPER FUNCTIONS
  -- ============================================================================

  -- Helper to extract the Sub-Archetype string (e.g., "HORROR", "DEVIL", "HUMAN")
  local function get_sub_archetype(components, config)
      -- 1. Check specific component definition tables first
      if config and config.COMPONENT_TABLES then
          for _, conf in ipairs(config.COMPONENT_TABLES) do
              local comp = components[conf.name]
              if comp and comp.sub_archetype and #comp.sub_archetype > 0 then
                  return comp.sub_archetype[1]
              end
          end
      end
      -- 2. Fallback to the general sub_archetypes list in components
      if components.sub_archetypes and #components.sub_archetypes > 0 then
          return components.sub_archetypes[1]
      end
      return "UNKNOWN"
  end

  -- Generic function to calculate a score for a specific affinity type
  local function calculate_score_generic(affinity_type, config, components)
      if not config or not components or not components.rating then
          return 0
      end

      -- Extract Key Identifiers
      local archetype = config.ARCHETYPE_CLASS or "DEFAULT"
      local rating_tag = (components.rating.tags and components.rating.tags[1]) or "DEFAULT"
      local sub_archetype = get_sub_archetype(components, config)

      -- 1. Base Score from Archetype
      local archetype_data = affinity_config.ARCHETYPES[archetype]
                            or affinity_config.ARCHETYPES["DEFAULT"]
      local base = (archetype_data and archetype_data[affinity_type]) or 0

      -- 2. Rating Modifier
      local rating_data = affinity_config.RATINGS[rating_tag]
                         or affinity_config.RATINGS["DEFAULT"]
      local r_mod = (rating_data and rating_data[affinity_type]) or 0

      -- 3. Sub-Archetype Modifier
      local sub_data = affinity_config.SUB_ARCHETYPES[sub_archetype]
      local s_mod = (sub_data and sub_data[affinity_type]) or 0

      -- Sum and Clamp
      local total = base + r_mod + s_mod

      if total < 0 then total = 0 end
      if total > 6 then total = 6 end

      return math.floor(total)
  end

  -- ============================================================================
  -- PUBLIC API
  -- ============================================================================

  -- Calculates the Digital / Firewall score
  function M.calculate_firewall_score(config, components)
      return calculate_score_generic("digital", config, components)
  end

  -- Calculates the Energy Flux score
  function M.calculate_energy_score(config, components)
      return calculate_score_generic("energy", config, components)
  end

  -- Calculates the Nanomachine Density score
  function M.calculate_nanomachine_score(config, components)
      return calculate_score_generic("nanite", config, components)
  end

  -- Generates the Creature Class Tokens for all 3 affinities
  -- Returns a string of tokens.
  -- Result: "[CREATURE_CLASS:INNATE_FIREWALL_#]\n[CREATURE_CLASS:INNATE_ENERGY_#]..."
  function M.get_firewall_token(config, components)
      local fw_score = M.calculate_firewall_score(config, components)
      local en_score = M.calculate_energy_score(config, components)
      local nano_score = M.calculate_nanomachine_score(config, components)

      return "[CREATURE_CLASS:INNATE_FIREWALL_" .. fw_score .. "]\n" ..
             "[CREATURE_CLASS:INNATE_ENERGY_" .. en_score .. "]\n" ..
             "[CREATURE_CLASS:INNATE_NANOMACHINE_" .. nano_score .. "]"
  end

  -- Generates the Visual Description String for the View Unit screen
  -- FIXED: Renamed from get_firewall_description_string to get_firewall_desc_string to match engine call
  function M.get_firewall_desc_string(config, components)
      -- Calculate scores safely (default to 0 on nil)
      local fw_score = M.calculate_firewall_score(config, components) or 0
      local en_score = M.calculate_energy_score(config, components) or 0
      local nano_score = M.calculate_nanomachine_score(config, components) or 0

      local desc = " _______________________________________________________ __________/DIGITAL_AFFINITY = " .. fw_score .. "/ENERGY_AFFINITY = " .. en_score .. "/NANITE_AFFINITY = " .. nano_score

      return desc
  end

  return M
