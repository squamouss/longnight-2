local log = _G.log or function(...) end
log("FREQUENCY_RULES: Loading frequency distribution rules.")

local M = {}

M.DEFAULT_FREQUENCY = 50 -- Fallback if no rule matches (DF Default)

-- Guidelines:
-- 100: Ubiquitous (Vermin, common birds)
-- 50:  Standard (Deer, Dogs)
-- 25:  Uncommon (Specific wild animals)
-- 10:  Rare/Predators (Wolves, Bears)
-- 1-5: Cryptids/Bosses (Sasquatch, Giant Monsters)

M.RULES = {
    ["BIOMACHINE"] = {
        MCR = { VERMIN = 100, AMBIENT = 100 },
        MNL = { VERMIN = 100, AMBIENT = 100 },
        SML = { VERMIN = 100, AMBIENT = 100 },
        LSR = { 
            BENIGN = 60,
            PROBLEMATIC = 40,
            HAZARDOUS = 30,
            DANGEROUS = 15 
        },
        MDM = { 
            BENIGN = 50, -- Standard grazers
            DOMESTIC = 50,
            SOPHONT = 5, -- Wandering travelers should be rare
            HOSTILE = 10, -- Wolf-like frequency
            DANGEROUS = 10,
            HAZARDOUS = 20,
            VESSEL = 5
        },
        LRG = { 
            BENIGN = 30, -- Large grazers (Moose/Buffalo)
            DOMESTIC = 30,
            HOSTILE = 5, -- Bear-like frequency
            DANGEROUS = 5,
            WEAPON = 5,
            MILITARY = 2
        },
        HGE = { 
            BENIGN = 15,
            HOSTILE = 2,
            DANGEROUS = 2,
            DEFAULT = 5
        },
        GNT = {
            DEFAULT = 1 -- Sasquatch/Unique monster level
        },
        TTN = {
            DEFAULT = 1 -- World-shaking rarity
        }
    },

    -- Cloned structure for other archetypes (can be customized individually)
    ["CYBERMACHINE"] = {
        MCR = { VERMIN = 100, AMBIENT = 100 },
        MDM = { BENIGN = 40, HOSTILE = 10, SOPHONT = 5 },
        LRG = { BENIGN = 25, HOSTILE = 5 },
        GNT = { DEFAULT = 1 },
        TTN = { DEFAULT = 1 }
    },
    ["NECROMACHINE"] = {
        MCR = { VERMIN = 100 },
        MDM = { BENIGN = 10, HOSTILE = 20, DANGEROUS = 20 }, -- Necromachines generally rarer/more hostile
        LRG = { HOSTILE = 10, DANGEROUS = 10 },
        GNT = { DEFAULT = 1 }
    },
    ["CHIMERA"] = {
        MDM = { DEFAULT = 10 }, -- Chimeras are rare mutants
        LRG = { DEFAULT = 5 },
        GNT = { DEFAULT = 1 }
    }
}

return M