--  See `:help keymap.set()`
local map = vim.keymap.set

-- General keymaps
map('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true, desc = 'Make current file E[x]ecutable' })

-- Clear highlight on pressing <Esc> in normal mode
map('n', '<Esc>', '<cmd> nohlsearch <CR>')

-- Disable space in normal and visual mode
map({ 'n', 'v' }, '<Space>', '<Nop>')

-- Delete single character without copying into register
map('n', 'x', '"_x')

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show line diagnostic [E]rror messages' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- VS Code like behaviour
map('i', '<C-CR>', '<Esc>o', { desc = 'Insert Line Below' })
map('i', '<C-S-CR>', '<Esc>O', { desc = 'Insert Line Above' })

-- vim: ts=2 sts=2 sw=2 et
