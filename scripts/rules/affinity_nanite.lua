local log = _G.log or function(...) end
log("NANO_RULES: Loading nanomachine affinity rules.")

local M = {}

M.ARCHETYPE_BASE = {
    ["BIOMACHINE"] = 1,
    ["CYBERMACHINE"] = 1,
    ["DEMIMACHINE"] = 2,
    ["NANOMACHINE"] = 2,
    ["HOLOMACHINE"] = 1,
    ["XENOMACHINE"] = 1,
	
    ["LOCASTE"] = 0,
    ["HICASTE"] = 0,
    ["EXCASTE"] = 0,
    ["NUCASTE"] = 0,
    ["CYCASTE"] = 1,
	
    ["CHIMERA"] = 0,
    ["PROTOCHIMERA"] = 0,
    ["PALEOCHIMERA"] = 0,
    ["POLYMERID"] = 1,
    ["SILICID"] = 0,
    ["ELASTOMERID"] = 0,
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
    
    ["DANGEROUS"] = 1,
    ["HAZARDOUS"] = 1,
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
    ["CANCER"] = 1,    
    ["CYBORG"] = 0,      
    ["BULK"] = 1,     
    ["SLEEK"] = 0,     
    ["SKELETON"] = 0,      
	
    ["HORROR"] = 1,    
    ["DEVIL"] = 1,     
    ["OGRE"] = 1,     
    ["HUMAN"] = 1,    
    ["ANDROID"] = 1,    
    ["INDUSTRIAL"] = 1,     
    ["DOLL"] = 1,     
    ["SCRAP"] = 1,
    ["WET"] = 0,    
    ["CORRUPT"] = 1,     
    ["PRISTINE"] = 2,   
    ["MECHA"] = 0,    
    ["SWARM"] = 1,     
    ["FRANKENSTEIN"] = 2,   
    ["HYBRID"] = 0,    
    ["GLITCH"] = 0,     
    ["FAIRY"] = 0,   
    ["CONTROL"] = 0,    
    ["CHAOS"] = 0,     
    ["GHOST"] = 0,   
    ["UNKNOWN"] = 1
}

return M