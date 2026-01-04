local log = _G.log or function(...) end
log("FIREWALL_RULES: Loading firewall calculation rules.")

local M = {}

M.ARCHETYPE_BASE = {
    ["BIOMACHINE"] = 1,
    ["CYBERMACHINE"] = 2,
    ["DEMIMACHINE"] = 1,
    ["NANOMACHINE"] = 1,
    ["HOLOMACHINE"] = 2,
    ["XENOMACHINE"] = 1,
	
    ["LOCASTE"] = 0,
    ["HICASTE"] = 0,
    ["EXCASTE"] = 0,
    ["NUCASTE"] = 0,
    ["CYCASTE"] = 1,
	
    ["CHIMERA"] = 0,
    ["PROTOCHIMERA"] = 0,
    ["PALEOCHIMERA"] = 0,
    ["POLYMERID"] = 0,
    ["SILICID"] = 1,
    ["ELASTOMERID"] = 0,
    ["MACROCELL"] = 0,
	
    ["DEFAULT"] = 1
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
    ["MILITARY"] = 1,
    ["WEAPON"] = 1,
    ["VEHICLE"] = 1,
    ["NOMAD"] = 1,
    ["CARRIER"] = 0,
    ["SERVANT"] = 0,
    ["LABOR"] = -1,
    ["PRODUCT"] = -1
}

M.SUB_ARCHETYPE_MODIFIERS = {
    ["BLINDSIGHT"] = 1,    
    ["CYBORG"] = 0,    
    ["BULK"] = 0,     
    ["SLEEK"] = 1,     
    ["SKELETON"] = 0,  
    ["FULLBODY"] = 1,  
	
    ["HORROR"] = 0,    
    ["DEVIL"] = 0,     
    ["OGRE"] = 0,     
    ["HUMAN"] = 0,    
    ["ANDROID"] = 2,    
    ["INDUSTRIAL"] = 1,     
    ["DOLL"] = 1,     
    ["SCRAP"] = 0,
    ["WET"] = 0,    
    ["CORRUPT"] = 0,     
    ["PRISTINE"] = 0,   
    ["MECHA"] = 1,    
    ["SWARM"] = 1,     
    ["FRANKENSTEIN"] = 1,   
    ["HYBRID"] = 1,    
    ["GLITCH"] = 0,     
    ["FAIRY"] = 2,  
    ["CONTROL"] = 1,    
    ["CHAOS"] = 1,     
    ["GHOST"] = 1,   
    ["UNKNOWN"] = 0
}

return M