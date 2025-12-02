local log = _G.log or function(...) end

-- Load configs needed for experiments
local config_biomachine = require("config_biomachine")
local config_cycaste = require("config_cycaste") 
-- Add other configs as needed if they aren't already loaded globally or via require chains
-- For the purpose of this rules file, we reference the config objects passed in outcomes.

local rules = {}

-- ============================================================================
-- RULE STRUCTURE
-- ============================================================================
rules.outcomes_by_experimenter_tag = {
    
    ["BIOMACHINE"] = {
        sub_archetype_inheritance = {
            ["DEVIL"] = {"DEVIL", "HUMAN"}, 
            ["HUMAN"] = {"HUMAN", "DEVIL"},
            ["OGRE"] = {"OGRE"},            
            ["HORROR"] = {"HORROR"}
        },

        cases = {
            {
                required_secondary_tag = "SOPHONT",
                allowed_targets = {"LOCASTE", "HICASTE", "NUCASTE", "EXCASTE"},
                outcomes = {
                    {
                        config = config_biomachine,
                        forced_rating = "SOPHONT",
                        weight = 100,
                        forced_size = "any",
                        description_generator = function(ctx)
                            return " Its lineage was engineered by " .. ctx.race .. " " .. ctx.name .. " of " .. ctx.civ .. " in " .. ctx.year .. " through retroviral injections and invasive surgeries."
                        end
                    }
                }
            },
            {
                required_secondary_tag = "DEVIANT",
                allowed_targets = {"LOCASTE", "HICASTE", "NUCASTE", "EXCASTE"},
                outcomes = {
                    {
                        config = config_biomachine,
                        forced_rating = "DEVIANT",
                        weight = 100,
                        forced_size = "any",
                        description_generator = function(ctx)
                            return " Its lineage was engineered by " .. ctx.race .. " " .. ctx.name .. " of " .. ctx.civ .. " in " .. ctx.year .. " through retroviral injections and invasive surgeries."
                        end
                    }
                }
            },
            {
                required_secondary_tag = "AVATAR",
                allowed_targets = {"LOCASTE", "HICASTE", "NUCASTE", "EXCASTE", "CYCASTE"},
                outcomes = {
                    {
                        config = config_biomachine,
                        forced_rating = "SOPHONT",
                        weight = 100,
                        forced_size = {"LRG", "HGE", "GNT", "TTN"},
                        description_generator = function(ctx)
                            return " Its lineage was engineered by " .. ctx.race .. " " .. ctx.name .. " of " .. ctx.civ .. " in " .. ctx.year .. " through great expenditure of N-matter, in exchange for servitude."
                        end
                    }
                }
            },
            {
                required_secondary_tag = "INCURSION",
                allowed_targets = {"LOCASTE", "HICASTE", "NUCASTE", "EXCASTE"},
                outcomes = {
                    {
                        config = config_biomachine,
                        forced_rating = "VESSEL",
                        weight = 100,
                        forced_size = {"LRG", "HGE", "GNT", "TTN"},
                        description_generator = function(ctx)
                            return " Its lineage was engineered by " .. ctx.race .. " " .. ctx.name .. " of " .. ctx.civ .. " in " .. ctx.year .. " through retroviral injections and invasive surgeries."
                        end
                    }
                }
            }
            -- DEFAULT FALLBACK REMOVED: If no tag matches above, experiment returns nil.
        }
    },
    
    ["CYBERMACHINE"] = {
        sub_archetype_inheritance = {
            ["HUMAN"] = {"HUMAN", "INDUSTRIAL"}, 
            ["DOLL"] = {"DOLL", "INDUSTRIAL"},
            ["INDUSTRIAL"] = {"INDUSTRIAL", "SCRAP"},            
            ["SCRAP"] = {"SCRAP"}
        },

        cases = {
            {
                required_secondary_tag = "SOPHONT",
                outcomes = {
                    {
                        config = config_cybermachine,
                        forced_rating = "SOPHONT",
                        weight = 100,
                        forced_size = "any",
                        description_generator = function(ctx)
                            return " Its lineage was manufactured by " .. ctx.race .. " " .. ctx.name .. " of " .. ctx.civ .. " in " .. ctx.year .. " by scanning, eliminating, and copying the egos of the population."
                        end
                    }
                }
            },
            {
                required_secondary_tag = "DEVIANT",
                outcomes = {
                    {
                        config = config_cybermachine,
                        forced_rating = "DEVIANT",
                        weight = 100,
                        forced_size = "any",
                        description_generator = function(ctx)
                            return " Its lineage was manufactured by " .. ctx.race .. " " .. ctx.name .. " of " .. ctx.civ .. " in " .. ctx.year .. " by scanning, eliminating, and copying the egos of the population."
                        end
                    }
                }
            },
            {
                required_secondary_tag = "INCURSION",
                outcomes = {
                    {
                        config = config_cybermachine,
                        forced_rating = "VESSEL",
                        weight = 100,
                        forced_size = {"LRG", "HGE", "GNT", "TTN"}, 
                        description_generator = function(ctx)
                            return " Its lineage was manufactured by " .. ctx.race .. " " .. ctx.name .. " of " .. ctx.civ .. " in " .. ctx.year .. " by scanning, eliminating, and copying the egos of the population."
                        end
                    }
                }
            }
            -- DEFAULT FALLBACK REMOVED
        }
    },

    ["NECROMACHINE"] = {
        sub_archetype_inheritance = {
            ["MECHA"] = {"MECHA", "FRANKENSTEIN"}, 
            ["SWARM"] = {"SWARM"},
            ["FRANKENSTEIN"] = {"FRANKENSTEIN", "MECHA"}
        },
        cases = {
            {
                required_secondary_tag = "SOPHONT",
                outcomes = {
                    {
                        config = config_necromachine,
                        forced_rating = "SOPHONT",
                        weight = 100,
                        forced_size = "any",
                        description_generator = function(ctx)
                            return " Its lineage was manufactured by " .. ctx.race .. " " .. ctx.name .. " of " .. ctx.civ .. " in " .. ctx.year .. " by scanning, eliminating, and copying the egos of the population."
                        end
                    }
                }
            },
            {
                required_secondary_tag = "DEVIANT",
                outcomes = {
                    {
                        config = config_necromachine,
                        forced_rating = "DEVIANT",
                        weight = 100,
                        forced_size = "any",
                        description_generator = function(ctx)
                            return " Its lineage was manufactured by " .. ctx.race .. " " .. ctx.name .. " of " .. ctx.civ .. " in " .. ctx.year .. " by scanning, eliminating, and copying the egos of the population."
                        end
                    }
                }
            },
            {
                required_secondary_tag = "INCURSION",
                outcomes = {
                    {
                        config = config_necromachine,
                        forced_rating = "VESSEL",
                        weight = 100,
                        forced_size = {"LRG", "HGE", "GNT", "TTN"}, 
                        description_generator = function(ctx)
                            return " Its lineage was manufactured by " .. ctx.race .. " " .. ctx.name .. " of " .. ctx.civ .. " in " .. ctx.year .. " by scanning, eliminating, and copying the egos of the population."
                        end
                    }
                }
            }
            -- DEFAULT FALLBACK REMOVED
        }
    },
	
    ["NANOMACHINE"] = {
        sub_archetype_inheritance = {
            ["PRISTINE"] = {"PRISTINE"}, 
            ["CORRUPT"] = {"CORRUPT", "WET"}, 
            ["WET"] = {"WET"}
        },
        cases = {
            {
                required_secondary_tag = "SOPHONT",
                outcomes = {
                    {
                        config = config_nanomachine,
                        forced_rating = "SOPHONT",
                        weight = 100,
                        forced_size = "any",
                        description_generator = function(ctx)
                            return " Its lineage was manufactured by " .. ctx.race .. " " .. ctx.name .. " of " .. ctx.civ .. " in " .. ctx.year .. " by scanning, eliminating, and copying the egos of the population."
                        end
                    }
                }
            },
            {
                required_secondary_tag = "DEVIANT",
                outcomes = {
                    {
                        config = config_nanomachine,
                        forced_rating = "DEVIANT",
                        weight = 100,
                        forced_size = "any",
                        description_generator = function(ctx)
                            return " Its lineage was manufactured by " .. ctx.race .. " " .. ctx.name .. " of " .. ctx.civ .. " in " .. ctx.year .. " by scanning, eliminating, and copying the egos of the population."
                        end
                    }
                }
            },
            {
                required_secondary_tag = "INCURSION",
                outcomes = {
                    {
                        config = config_nanomachine,
                        forced_rating = "VESSEL",
                        weight = 100,
                        forced_size = {"LRG", "HGE", "GNT", "TTN"}, 
                        description_generator = function(ctx)
                            return " Its lineage was manufactured by " .. ctx.race .. " " .. ctx.name .. " of " .. ctx.civ .. " in " .. ctx.year .. " by scanning, eliminating, and copying the egos of the population."
                        end
                    }
                }
            }
            -- DEFAULT FALLBACK REMOVED
        }
    },
	
    ["HOLOMACHINE"] = {
        sub_archetype_inheritance = {
            ["HYBRID"] = {"HYBRID", "FAIRY"}, 
            ["FAIRY"] = {"FAIRY", "HYBRID"},
            ["GLITCH"] = {"GLITCH"}
        },
        cases = {
            {
                required_secondary_tag = "SOPHONT",
                outcomes = {
                    {
                        config = config_holomachine,
                        forced_rating = "SOPHONT",
                        weight = 100,
                        forced_size = "any",
                        description_generator = function(ctx)
                            return " Its lineage was manufactured by " .. ctx.race .. " " .. ctx.name .. " of " .. ctx.civ .. " in " .. ctx.year .. " by scanning, eliminating, and copying the egos of the population."
                        end
                    }
                }
            },
            {
                required_secondary_tag = "DEVIANT",
                outcomes = {
                    {
                        config = config_holomachine,
                        forced_rating = "DEVIANT",
                        weight = 100,
                        forced_size = "any",
                        description_generator = function(ctx)
                            return " Its lineage was manufactured by " .. ctx.race .. " " .. ctx.name .. " of " .. ctx.civ .. " in " .. ctx.year .. " by scanning, eliminating, and copying the egos of the population."
                        end
                    }
                }
            },
            {
                required_secondary_tag = "INCURSION",
                outcomes = {
                    {
                        config = config_holomachine,
                        forced_rating = "VESSEL",
                        weight = 100,
                        forced_size = {"LRG", "HGE", "GNT", "TTN"}, 
                        description_generator = function(ctx)
                            return " Its lineage was manufactured by " .. ctx.race .. " " .. ctx.name .. " of " .. ctx.civ .. " in " .. ctx.year .. " by scanning, eliminating, and copying the egos of the population."
                        end
                    }
                }
            }
            -- DEFAULT FALLBACK REMOVED
        }
    },

    -- Note: Castes usually act as the 'Standard' and do not have secondary tag filtering by default.
    -- If you want Castes to fail under certain conditions, add required_secondary_tag to them as well.
    
    ["CYCASTE"] = {
        cases = {
            {
                outcomes = {
                    {
                        config = config_biomachine, 
                        forced_rating = "SOPHONT",
                        weight = 50,
                        forced_size = "any",
                        forced_sub_archetypes = {"OGRE"}, 
                        description_generator = function(ctx)
                            return " Its lineage was manufactured by " .. ctx.race .. " " .. ctx.name .. " of " .. ctx.civ .. " in " .. ctx.year .. " from the defeated populace of their enemy."
                        end
                    },
                    {
                        config = config_cycaste, 
                        forced_rating = "SOPHONT", 
                        weight = 50,
                        forced_size = "any",
                        description_generator = function(ctx)
                            return " Its lineage was founded by " .. ctx.race .. " " .. ctx.name .. " of " .. ctx.civ .. " in " .. ctx.year .. " by granting defeated foes conversion in exchange for servitude."
                        end
                    }
                }
            }
        }
    },

    ["HICASTE"] = {
        cases = {
            {
                outcomes = {
                    {
                        config = config_cycaste, 
                        forced_rating = "SOPHONT", 
                        weight = 50,
                        forced_size = "any",
                        description_generator = function(ctx)
                            return " Its lineage was founded by " .. ctx.race .. " " .. ctx.name .. " of " .. ctx.civ .. " in " .. ctx.year .. " by granting defeated foes conversion in exchange for servitude."
                        end
                    }
                }
            }
        }
    },

    ["LOCASTE"] = {
        cases = {
            {
                outcomes = {
                    {
                        config = config_cycaste, 
                        forced_rating = "SOPHONT", 
                        weight = 100,
                        forced_size = "any",
                        description_generator = function(ctx)
                            return " Its lineage was founded by " .. ctx.race .. " " .. ctx.name .. " of " .. ctx.civ .. " in " .. ctx.year .. " by granting defeated foes conversion in exchange for servitude."
                        end
                    }
                }
            }
        }
    },

    ["NUCASTE"] = {
        cases = {
            {
                outcomes = {
                    {
                        config = config_cycaste, 
                        forced_rating = "SOPHONT", 
                        weight = 100,
                        forced_size = "any",
                        description_generator = function(ctx)
                            return " Its lineage was founded by " .. ctx.race .. " " .. ctx.name .. " of " .. ctx.civ .. " in " .. ctx.year .. " by granting defeated foes conversion in exchange for servitude."
                        end
                    }
                }
            }
        }
    }
}

return rules