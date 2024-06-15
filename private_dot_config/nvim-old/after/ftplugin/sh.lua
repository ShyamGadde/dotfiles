local options = {
  tabstop = 4,
  softtabstop = 4,
  shiftwidth = 4,
  expandtab = true,
}

-- Loop through the table and set the options
for option, value in pairs(options) do
  vim.bo[option] = value
end
