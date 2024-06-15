local options = {
  wrap = true, -- Wrap text
  breakindent = true, -- Match indent on line break
  linebreak = true, -- Line break on whole words
  spelllang = 'en_us', -- Spell check language
  spell = true, -- Enable spell check
}

-- Loop through the table and set the options
for option, value in pairs(options) do
  vim.o[option] = value
end
