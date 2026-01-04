local log = _G.log or function(...) end
log("ENERGY_RULES: Loading energy calculation rules.")

local M = {}

M.ARCHETYPE_BASE = {
    ["BIOMACHINE"] = 2,
    ["CYBERMACHINE"] = 1,
    ["DEMIMACHINE"] = 1,
    ["NANOMACHINE"] = 1,
    ["HOLOMACHINE"] = 1,
    ["XENOMACHINE"] = 2,
	
    ["LOCASTE"] = 0,
    ["HICASTE"] = 0,
    ["EXCASTE"] = 0,
    ["NUCASTE"] = 0,
    ["CYCASTE"] = 1,
	
    ["CHIMERA"] = 0,
    ["PROTOCHIMERA"] = 0,
    ["PALEOCHIMERA"] = 0,
    ["POLYMERID"] = 0,
    ["SILICID"] = 0,
    ["ELASTOMERID"] = 1,
    ["MACROCELL"] = 0,
}


M.RATING_MODIFIERS = {

    ["INCURSION"] = 2,
    ["EXISTENTIAL"] = 2,
    ["AVATAR"] = 2,
    ["HOSTILE"] = 1,
	
    ["VESSEL"] = 0,
    ["DEVIANT"] = 0,
    ["SOPHONT"] = 0,
    
    ["DANGEROUS"] = 0,
    ["HAZARDOUS"] = 0,
    ["PROBLEMATIC"] = 0,
    ["BENIGN"] = -1,
    
    ["VERMIN"] = -3,
    ["AMBIENT"] = -3,
    
    ["DOMESTIC"] = -1,
    ["COMPANION"] = -1,
    ["SANITATION"] = -1,
    ["HUNTER"] = -1,
    ["LIVESTOCK"] = -1,
    
    ["DEFAULT"] = 0
}

M.SUB_ARCHETYPE_MODIFIERS = {
    ["NEOTENATE"] = 1,    
    ["CYBORG"] = 0,        
    ["BULK"] = 0,     
    ["SLEEK"] = 0,     
    ["SKELETON"] = 1,  
	
    ["HORROR"] = 0,    
    ["DEVIL"] = 2,     
    ["OGRE"] = 1,     
    ["HUMAN"] = 1,    
    ["ANDROID"] = 0,    
    ["INDUSTRIAL"] = 0,     
    ["DOLL"] = 0,     
    ["SCRAP"] = 0,
    ["WET"] = 1,    
    ["CORRUPT"] = 1,     
    ["PRISTINE"] = 1,   
    ["MECHA"] = 0,    
    ["SWARM"] = 0,     
    ["FRANKENSTEIN"] = 0,   
    ["HYBRID"] = 1,    
    ["GLITCH"] = 1,     
    ["FAIRY"] = 1,   
    ["CONTROL"] = 1,    
    ["CHAOS"] = 0,     
    ["GHOST"] = 2,   
    ["UNKNOWN"] = 0
}

return M