-- language_generator.lua
-- Generic language generation engine.

-- Load the central filter for checking forbidden words.
local is_forbidden = require("filter")

-- This helper function checks if a word has more than one set of doubled characters.
-- It's part of the core engine because this rule applies to all languages.
local function has_valid_doubles(word)
    local double_count = 0
    for i = 1, string.len(word) - 1 do
        if word:sub(i, i) == word:sub(i + 1, i + 1) then
            double_count = double_count + 1
        end
    end
    return double_count <= 1
end

local generator = {}

-- This is the main function the conlang files will call.
-- It takes a language definition table (lang_def) as its only argument.
function generator.create_language(lang_def)
    local generated_words = {}

    -- Loop through all the word tokens Dwarf Fortress needs.
    for k, v in ipairs(world.language.word) do
        local str
        -- This loop will keep trying to generate a word until it meets all the rules.
        repeat
            -- Call the language-specific word building function from the definition file.
            str = lang_def:build_word()

        -- These are the universal rules that apply to all languages.
        until not is_forbidden(str) and string.len(str) > 1 and has_valid_doubles(str)

        generated_words[v.token] = str
    end
    return generated_words
end

return generator
