-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.root_spec = { { ".git", "lua" }, "lsp", "cwd" }
vim.g.lazyvim_picker = "telescope"
vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.lazyvim_python_ruff = "ruff"

local set = vim.opt

set.clipboard = ""
set.inccommand = "split"
set.breakindent = true

-- Configure tabs and spaces
set.tabstop = 4
set.shiftwidth = 4
set.softtabstop = 4

-- Appearance
vim.diagnostic.config({
  float = { border = "rounded" }, -- Add border to diagnostic popups
})
set.pumblend = 0 -- Popup blend
set.listchars = { tab = "󰁔 ", trail = "·", nbsp = "␣" }

set.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }

set.diffopt:append("linematch:50")
