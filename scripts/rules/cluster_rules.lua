local log = _G.log or function(...) end
log("CLUSTER_RULES: Loading cluster size distribution rules.")

local M = {}

-- DECAY EXPLAINED:
-- 'decay': Chance to increment size. 0.95 = Swarm/School. 0.40 = Squad. 0.0 = Solitary.

local DEFAULT_RULES = {
    MCR = { 
        COLONY = { min = 100, max_cap = 200, decay = 0.96 }, 
        FISH = { min = 50, max_cap = 100, decay = 0.90 }
    },
    MNL = { 
        COLONY = { min = 100, max_cap = 200, decay = 0.96 },
        FISH = { min = 25, max_cap = 50, decay = 0.80 }
    },
    SML = { 
        COLONY = { min = 100, max_cap = 200, decay = 0.96 },
        FISH = { min = 1, max_cap = 10, decay = 0.70 }
    },
    LSR = { 
        DANGEROUS = { min = 3, max_cap = 12, decay = 0.85 }, 
        PROBLEMATIC = { min = 2, max_cap = 8, decay = 0.75 },
        BENIGN = { min = 5, max_cap = 20, decay = 0.90 }, 
        HAZARDOUS = { min = 5, max_cap = 20, decay = 0.90 }
    },
    MDM = {
        DANGEROUS = { min = 1, max_cap = 5, decay = 0.60 },
        PROBLEMATIC = { min = 2, max_cap = 8, decay = 0.75 },
        BENIGN = { min = 5, max_cap = 20, decay = 0.90 },    
        HAZARDOUS = { min = 5, max_cap = 20, decay = 0.90 }
    },
    LRG = { 
        BENIGN = { min = 2, max_cap = 10, decay = 0.80 },    
        PROBLEMATIC = { min = 3, max_cap = 10, decay = 0.90 }, 
        DANGEROUS = { min = 1, max_cap = 3, decay = 0.40 },
        HAZARDOUS = { min = 1, max_cap = 2, decay = 0.30 }
    },
    HGE = { 
        BENIGN = { min = 2, max_cap = 10, decay = 0.80 },    
        PROBLEMATIC = { min = 3, max_cap = 10, decay = 0.90 }, 
        DANGEROUS = { min = 1, max_cap = 3, decay = 0.40 },
        HAZARDOUS = { min = 1, max_cap = 2, decay = 0.30 }
    },
    GNT = { 
        BENIGN = { min = 2, max_cap = 10, decay = 0.80 },    
        PROBLEMATIC = { min = 1, max_cap = 10, decay = 0.50 }, 
        DANGEROUS = { min = 1, max_cap = 3, decay = 0.40 },
        HAZARDOUS = { min = 1, max_cap = 2, decay = 0.30 }
    },
    TTN = { 
        DEFAULT = { min = 1, max_cap = 1, decay = 0.0 }      -- Solitary
    }
}

M.RULES = {
    ["BIOMACHINE"] = DEFAULT_RULES,
    ["CYBERMACHINE"] = DEFAULT_RULES,
    ["NECROMACHINE"] = DEFAULT_RULES,
    ["NANOMACHINE"] = DEFAULT_RULES,
    ["HOLOMACHINE"] = DEFAULT_RULES,
    ["LOCASTE"] = DEFAULT_RULES,
    ["HICASTE"] = DEFAULT_RULES,
    ["NUCASTE"] = DEFAULT_RULES,
    ["EXCASTE"] = DEFAULT_RULES,
    ["CYCASTE"] = DEFAULT_RULES,
    ["CHIMERA"] = DEFAULT_RULES,
    ["PROTOCHIMERA"] = DEFAULT_RULES,
    ["MACROCELL"] = DEFAULT_RULES,
    ["POLYMERID"] = DEFAULT_RULES,
}

return M