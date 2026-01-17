 local function add_current_dir_to_path()

      local info = debug.getinfo(1, "S")
      if info and info.source then
          local script_path = info.source:match("@?(.*/)")
          if script_path then

              package.path = script_path .. "?.lua;" .. package.path

              if _G.log then _G.log("INIT_LOG: Path Fix Applied. Added: " .. script_path) end
          end
      end
  end
  add_current_dir_to_path()

  local ENABLE_LUALOG = true
  local original_log = _G.log
  local function custom_log(...)
      if ENABLE_LUALOG and type(original_log) == "function" then
          original_log(...)
      end
  end
  _G.log = custom_log
  if _G.get_caller_loc_string == nil then
      _G.get_caller_loc_string = function() return "[Location Unknown]" end
  end

  -- =====================================================================================
  -- TABLE INITIALIZATION
  -- =====================================================================================
  if materials == nil then materials = {} end
  if items == nil then items = {} end
  if languages == nil then languages = {} end
  if creatures == nil then creatures = {} end
  if interactions == nil then interactions = {} end
  if entities == nil then entities = {} end
  if preprocess == nil then preprocess = {} end
  if do_once == nil then do_once = {} end
  if postprocess == nil then postprocess = {} end
  if do_once_early == nil then do_once_early = {} end

  -- =====================================================================================
  -- GLOBAL REGISTRY INITIALIZATION
  -- =====================================================================================
  if _G.global_creature_fingerprints == nil then
      _G.global_creature_fingerprints = {}
      _G.log("INIT_LOG: Initialized global creature fingerprint registry.")
  end

  -- =====================================================================================
  -- DEV CACHE BUSTER
  -- =====================================================================================
  _G.log("INIT_LOG: Busting 'require' cache for development...")
  local modules_to_bust = {
  --for dev stuff
  }
  for _, mod_name in ipairs(modules_to_bust) do
      package.loaded[mod_name] = nil
  end
  _G.log("INIT_LOG: Cache busted for " .. #modules_to_bust .. " modules.")
  -- =====================================================================================


  -- =====================================================================================
  -- MODULE REQUIREMENTS
  -- =====================================================================================
  _G.log("INIT_LOG: Requiring all generator modules...")

  local function safe_require(module_name)
      local success, module = pcall(require, module_name)
      if success then
          _G.log("INIT_LOG: Successfully loaded module '" .. module_name .. "'.")
          return module
      else
          _G.log("INIT_LOG: FATAL ERROR loading module '" .. module_name .. "': " .. tostring(module))
          return nil
      end
  end

  safe_require("megastructure_generator")

  -- 1. Load Engines
  local creature_generator_engine = safe_require("creature_generator_engine")
  local experiment_generator_engine = safe_require("experiment_generator_engine")
  local weaponizer_engine = safe_require("weaponizer_engine")
  local config_weapons = safe_require("config_weapons")

  -- 2. Load Language Modules
  safe_require("filter")
  safe_require("languages.conlang_locant_1")
  safe_require("languages.conlang_locant_2")
  safe_require("languages.conlang_locant_3")
  safe_require("languages.conlang_locant_4")
  safe_require("languages.conlang_locant_5")
  safe_require("languages.conlang_locant_6")
  safe_require("languages.conlang_excant_1")
  safe_require("languages.conlang_excant_2")
  safe_require("languages.conlang_excant_3")
  safe_require("languages.conlang_uncant_1")
  safe_require("languages.conlang_uncant_2")
  safe_require("languages.conlang_uncant_3")
  safe_require("languages.conlang_hicant")
  safe_require("languages.conlang_postcant_1")
  safe_require("languages.conlang_postcant_2")
  safe_require("languages.conlang_postcant_3")
  safe_require("languages.conlang_endcant")

  -- 3. Load Configs
  local config_files = {
      {data = safe_require("config_locaste"), name = "config_locaste", generate_early = true},
      {data = safe_require("config_hicaste"), name = "config_hicaste", generate_early = true},
      {data = safe_require("config_nucaste"), name = "config_nucaste", generate_early = true},
      {data = safe_require("config_excaste"), name = "config_excaste", generate_early = true},
      {data = safe_require("config_cycaste"), name = "config_cycaste", generate_early = true},
      {data = safe_require("config_biomachine"), name = "config_biomachine", generate_early = true},
      {data = safe_require("config_cybermachine"), name = "config_cybermachine", generate_early = true},
      {data = safe_require("config_demimachine"), name = "config_demimachine", generate_early = true},
      {data = safe_require("config_nanomachine"), name = "config_nanomachine", generate_early = true},
      {data = safe_require("config_protochimera"), name = "config_protochimera", generate_early = true},
      {data = safe_require("config_chimera"), name = "config_chimera", generate_early = true},
      {data = safe_require("config_macrocell"), name = "config_macrocell", generate_early = true},
      {data = safe_require("config_polymerid"), name = "config_polymerid", generate_early = true}
  }

  -- 4. Load Dependent Modules
  local dynamic_civilization_generator_module = safe_require("dynamic_civilization_generator")
  local dynamic_invasion_generator_module = safe_require("dynamic_invasion_generator")
  local dynamic_tribe_generator_module = safe_require("dynamic_tribe_generator")
  local specific_transformation_module = safe_require("specific_transformation")
  local viral_transformation_module = safe_require("viral_transformation")
  local necromancer_transformation_module = safe_require("necromancer_transformation")
  local universal_item_and_reaction_generators_module = safe_require("universal_item_and_reaction_generators")
  local domestic_rules = safe_require("domestic_rules")
  local domestic_creature_engine = safe_require("domestic_creature_engine")

  -- =====================================================================================
  -- LOAD TRANSMUTATION ARTS SYSTEM
  -- =====================================================================================
  _G.log("INIT_LOG: Loading Transmutation Arts system...")
  local transmutation_generator = safe_require("transmutation.generator_transmutation_arts")

  -- Transmutation configs
  local transmutation_configs = {
      safe_require("transmutation.config_digital_warfare"),
      safe_require("transmutation.config_energy_warfare"),
      safe_require("transmutation.config_nanite_warfare"),
  }

  _G.log("INIT_LOG: Loaded " .. #transmutation_configs .. " transmutation configs.")

  _G.log("INIT_LOG: All modules loaded.")

  -- =====================================================================================
  -- GLOBAL DATA STORAGE
  -- =====================================================================================
  local registered_interactions_temp_store = {}
  local combined_generated_creature_data = {}

  -- =====================================================================================
  -- UTILITY FUNCTION FOR GENERATION (OPTIMIZED)
  -- =====================================================================================
  -- Generates creatures and accumulates lines for batch registration
  -- Single loop combines: weaponizing, line collection, and cache insertion
  local function generate_creatures_to_accumulator(config, target_data_cache, lines_accumulator)
      if not config.data or not creature_generator_engine then return 0 end

      _G.log("INIT_LOG: Generating data for [" .. config.name .. "]")
      local generated_data = creature_generator_engine.generate_data_only(config.data)

      if not generated_data or #generated_data == 0 then return 0 end

      local lines_added = 0
      local acc_idx = #lines_accumulator

      -- Single loop: weaponize, collect lines, and add to cache
      for _, creature_obj in ipairs(generated_data) do
          if creature_obj.creature then
              -- Weaponize
              if weaponizer_engine and config_weapons then
                  local metadata = nil
                  if creature_obj.components then
                      local comp = creature_obj.components
                      metadata = {
                          rating_tags = comp.rating and comp.rating.tags or {},
                          archetypes = { config.data.ARCHETYPE_CLASS },
                          size_tag = (comp.size_variant and comp.size_variant.size_tags and comp.size_variant.size_tags[1]) or "MEDIUM",
                          sub_archetypes = comp.sub_archetypes or {}
                      }
                  end
                  creature_obj.creature = weaponizer_engine.apply_weapons(creature_obj.creature, config_weapons, nil, metadata)
              end

              -- Collect lines using direct indexing (faster than table.insert in tight loops)
              local creature_lines = creature_obj.creature
              for i = 1, #creature_lines do
                  acc_idx = acc_idx + 1
                  lines_accumulator[acc_idx] = creature_lines[i]
              end
              lines_added = lines_added + #creature_lines

              -- Add to cache (combined into single loop)
              target_data_cache[#target_data_cache + 1] = creature_obj
          end
      end

      _G.log("INIT_LOG: Generated " .. #generated_data .. " creatures (" .. lines_added .. " lines) for [" .. config.name .. "]")
      return lines_added
  end

  -- =====================================================================================
  -- PREPROCESS PHASE INTERACTION HOOKING AND CLEANUP
  -- =====================================================================================
  table.insert(preprocess, function()
      if random_object_parameters.pre_gen_randoms then
          _G.log("INIT_LOG: [CLEANUP] Clearing global creature fingerprints and local caches for new world generation.")

          _G.global_creature_fingerprints = {}

          for k in pairs(combined_generated_creature_data) do
              combined_generated_creature_data[k] = nil
          end

          if _G.generated_civilization_data then
              _G.generated_civilization_data = {}
          end

          _G.log("INIT_LOG: [CLEANUP] State reset complete.")
      end

      if not (random_object_parameters.pre_gen_randoms or random_object_parameters.main_world_randoms) then return end

      _G.log("INIT_LOG: Activating interaction interception hook.")
      if not _G.raws then _G.raws = {} end
      if not _G.raws.register_interactions_original then
          _G.raws.register_interactions_original = _G.raws.register_interactions or function() end
      end

      _G.raws.register_interactions = function(lines_table)
          if type(lines_table) == "table" then
              local current_block = {}
              for _, line in ipairs(lines_table) do
                  if line:match("^%[INTERACTION:") and #current_block > 0 then
                      table.insert(registered_interactions_temp_store, table.concat(current_block, "\n"))
                      current_block = { line }
                  else
                      table.insert(current_block, line)
                  end
              end
              if #current_block > 0 then
                  table.insert(registered_interactions_temp_store, table.concat(current_block, "\n"))
              end
          end
          _G.raws.register_interactions_original(lines_table)
      end

      _G.raws.get_interactions = function()
          return registered_interactions_temp_store
      end
  end)

  -- =====================================================================================
  -- DO_ONCE_EARLY PHASE
  -- =====================================================================================

  local function generate_early_languages_hook()
      _G.log("INIT_LOG: Running early language generation for Post-Human languages...")

      local keys_to_generate = {
          "GEN_POSTCANT_1",
          "GEN_POSTCANT_2",
          "GEN_POSTCANT_3"
      }

      local raw_lines = {}
      local count = 0

      for _, key in ipairs(keys_to_generate) do
          if languages[key] then
              local dict = languages[key]()
              if dict then
                  table.insert(raw_lines, "[LANGUAGE:" .. key .. "]")
                  table.insert(raw_lines, "[TRANSLATION]")
                  for k, v in pairs(dict) do
                      table.insert(raw_lines, "[T_WORD:" .. k .. ":" .. v .. "]")
                  end
                  count = count + 1
              end
          else
              _G.log("INIT_LOG: WARNING - Early language key not found: " .. key)
          end
      end

      if #raw_lines > 0 then
          raws.register_languages(raw_lines)
          _G.log("INIT_LOG: Registered " .. count .. " early languages successfully.")
      end
  end

  table.insert(do_once_early, function()
      if not random_object_parameters.pre_gen_randoms then return end
      _G.log("INIT_LOG: Executing DO_ONCE_EARLY hook for pre-map data generation.")

      _G.log("INIT_LOG: Executing megastructure generation (EARLY)...")
      if do_once_early and do_once_early.megastructure_gen then
          pcall(do_once_early.megastructure_gen)
          _G.log("INIT_LOG: Finished running megastructure_generator.")
      else
          _G.log("INIT_LOG: WARNING - megastructure_gen function not found in do_once_early table.")
      end

      _G.log("INIT_LOG: Executing transmutation arts system generation (EARLY)...")
      if transmutation_generator then
          for i, config in ipairs(transmutation_configs) do
              if config then
                  local status, err = pcall(transmutation_generator.generate, config)
                  if status then
                      _G.log("INIT_LOG: Generated transmutation arts for: " .. (config.SCHOOL_NAME or "config #" .. i))
                  else
                      _G.log("INIT_LOG: ERROR generating " .. (config.SCHOOL_NAME or "config #" .. i) .. ": " .. tostring(err))
                  end
              end
          end
          _G.log("INIT_LOG: Finished running transmutation_generator for all configs.")
      end

      generate_early_languages_hook()

      -- BATCH REGISTRATION: Collect all lines across all early configs, register once
      local all_early_creature_lines = {}
      local total_lines = 0

      for _, config in ipairs(config_files) do
          if config.generate_early then
              total_lines = total_lines + generate_creatures_to_accumulator(config, combined_generated_creature_data, all_early_creature_lines)
          end
      end

      -- Single batch registration for all early creatures
      if raws and raws.register_creatures and #all_early_creature_lines > 0 then
          raws.register_creatures(all_early_creature_lines)
          _G.log("INIT_LOG: BATCH REGISTERED " .. #all_early_creature_lines .. " total creature raw lines from all early configs.")
      end

      _G.log("INIT_LOG: Early-phase creature generation complete. Total creatures cached: " .. #combined_generated_creature_data)
      _G.log("INIT_LOG: DO_ONCE_EARLY hook finished.")
  end)


  -- =====================================================================================
  -- DO_ONCE PHASE
  -- =====================================================================================
  table.insert(do_once, function()
      if not random_object_parameters.main_world_randoms then return end
      _G.log("INIT_LOG: Executing primary DO_ONCE hook for main data generation.")

      if language_manager then
          pcall(language_manager.register_all_languages)
      end

      -- BATCH REGISTRATION: Collect all lines across all non-early configs, register once
      -- (Currently all configs are early, but this supports future non-early configs)
      local all_main_creature_lines = {}
      local has_non_early = false

      for _, config in ipairs(config_files) do
          if not config.generate_early then
              has_non_early = true
              generate_creatures_to_accumulator(config, combined_generated_creature_data, all_main_creature_lines)
          end
      end

      if has_non_early and raws and raws.register_creatures and #all_main_creature_lines > 0 then
          raws.register_creatures(all_main_creature_lines)
          _G.log("INIT_LOG: BATCH REGISTERED " .. #all_main_creature_lines .. " total creature raw lines from main-phase configs.")
      end

      _G.log("INIT_LOG: Main-phase creature data generation and registration complete.")
      _G.log("INIT_LOG: Total creature objects cached: " .. #combined_generated_creature_data)

      _G.log("INIT_LOG: Executing dependent module hooks...")

      _G.log("INIT_LOG: == STARTING PHASE 2: CIV/DOMESTIC GENERATION ==")

      if dynamic_civilization_generator_module and dynamic_civilization_generator_module.generate_civilizations_hook then
          pcall(dynamic_civilization_generator_module.prepare_civilization_data_hook, combined_generated_creature_data)
          pcall(dynamic_civilization_generator_module.generate_civilizations_hook)
          _G.log("INIT_LOG: Finished main civilization generation.")
      else
          _G.log("INIT_LOG: dynamic_civilization_generator_module not found. Skipping main civ generation.")
      end

      if dynamic_invasion_generator_module and dynamic_invasion_generator_module.generate_civilizations_hook then
          _G.log("INIT_LOG: Running invasion civilization generator...")
          pcall(dynamic_invasion_generator_module.prepare_civilization_data_hook, combined_generated_creature_data)
          pcall(dynamic_invasion_generator_module.generate_civilizations_hook)
          _G.log("INIT_LOG: Finished invasion civilization generation.")
      end

      _G.log("INIT_LOG: Executing dependent domestic creature generation...")
      if domestic_creature_engine and _G.generated_civilization_data and domestic_rules then
          pcall(domestic_creature_engine.generate_domestic_creatures_for_civs, _G.generated_civilization_data, domestic_rules)
          _G.log("INIT_LOG: Finished running domestic_creature_engine.")
      else
          _G.log("INIT_LOG: Could not run domestic creature engine. Missing engine, civ data, or rules.")
      end

      if dynamic_tribe_generator_module and dynamic_tribe_generator_module.generate_civilizations_hook then
          _G.log("INIT_LOG: Running tribe civilization generator...")
          pcall(dynamic_tribe_generator_module.prepare_civilization_data_hook, combined_generated_creature_data)
          pcall(dynamic_tribe_generator_module.generate_civilizations_hook)
          _G.log("INIT_LOG: Finished tribe civilization generation.")
      end

      _G.log("INIT_LOG: Executing civilization registration...")
      if dynamic_civilization_generator_module and dynamic_civilization_generator_module.register_all_generated_civilizations then
          pcall(dynamic_civilization_generator_module.register_all_generated_civilizations)
      end

      if dynamic_invasion_generator_module and dynamic_invasion_generator_module.register_all_generated_civilizations then
          pcall(dynamic_invasion_generator_module.register_all_generated_civilizations)
      end

      if dynamic_tribe_generator_module and dynamic_tribe_generator_module.register_all_generated_civilizations then
          pcall(dynamic_tribe_generator_module.register_all_generated_civilizations)
      end

      _G.log("INIT_LOG: Finished registering all civilizations.")

      _G.log("INIT_LOG: == FINISHED PHASE 2: CIV/DOMESTIC GENERATION ==")

      _G.log("INIT_LOG: Hooking Experiment System...")
      if experiment_generator_engine then
          pcall(experiment_generator_engine.register_experiments)
          _G.log("INIT_LOG: Experiment System hooks registered successfully.")
      else
          _G.log("INIT_LOG: Experiment engine was not loaded, skipping hooks.")
      end

      _G.log("INIT_LOG: Executing transformation interaction generation hooks...")

      if specific_transformation_module and specific_transformation_module.preprocess and specific_transformation_module.preprocess.transformation_init then
          pcall(specific_transformation_module.preprocess.transformation_init, combined_generated_creature_data)
          _G.log("INIT_LOG: Specific transformation hook finished.")
      else
          _G.log("INIT_LOG: WARNING - specific_transformation_module or its preprocess hook is missing.")
      end

      if viral_transformation_module and viral_transformation_module.preprocess and viral_transformation_module.preprocess.viral_init then
          pcall(viral_transformation_module.preprocess.viral_init, combined_generated_creature_data)
          _G.log("INIT_LOG: Viral transformation hook finished.")
      else
          _G.log("INIT_LOG: WARNING - viral_transformation_module or its preprocess hook is missing.")
      end

      if necromancer_transformation_module and necromancer_transformation_module.preprocess and necromancer_transformation_module.preprocess.experiment_init then
          pcall(necromancer_transformation_module.preprocess.experiment_init, combined_generated_creature_data)
          _G.log("INIT_LOG: Experiment transformation hook finished.")
      else
          _G.log("INIT_LOG: WARNING - necromancer_transformation_module or its preprocess hook is missing.")
      end

      _G.log("INIT_LOG: Primary DO_ONCE hook finished.")
  end)


  -- =====================================================================================
  -- POSTPROCESS PHASE
  -- =====================================================================================
  table.insert(postprocess, function()
      if not random_object_parameters.main_world_randoms then return end
      _G.log("INIT_LOG: Starting POSTPROCESS phase for final item/reaction generation.")

      _G.log("INIT_LOG: Executing item and reaction generator hook...")
      if universal_item_and_reaction_generators_module and universal_item_and_reaction_generators_module.postprocess then
          pcall(universal_item_and_reaction_generators_module.postprocess.generate_all_transformation_items)
      end
      _G.log("INIT_LOG: Item/reaction hook finished.")
      _G.log("INIT_LOG: POSTPROCESS phase complete.")
  end)

  _G.log("INIT_LOG: Master init.lua script fully loaded and all hooks registered.")