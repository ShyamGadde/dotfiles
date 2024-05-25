--  See `:help keymap.set()`
local keymap = vim.keymap

-- General keymaps
keymap.set('n', '<leader>w', '<cmd> wa <CR>', { desc = 'Write all open buffers' })
keymap.set('n', '<leader>Q', '<cmd> qa <CR>', { desc = 'Close all open buffers' })
keymap.set('n', '<leader>x', '<cmd> xa <CR>', { desc = 'Write and Close all open buffers' })

-- Clear highlight on pressing <Esc> in normal mode
keymap.set('n', '<Esc>', '<cmd> nohlsearch <CR>')

-- Disable space in normal and visual mode
keymap.set({ 'n', 'v' }, '<Space>', '<Nop>')

-- Diagnostic keymaps
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- window management
keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window [V]ertically' })
keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window [H]orizontally' })
keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits [E]qual size' })
keymap.set('n', '<leader>sc', '<cmd> close <CR>', { desc = '[C]lose current split' })

keymap.set('n', '<leader>to', '<cmd> tabnew <CR>', { desc = '[O]pen new tab' })
keymap.set('n', '<leader>tO', '<cmd> tabnew % <CR>', { desc = '[O]pen current buffer in new tab' })
keymap.set('n', '<leader>tc', '<cmd> tabclose <CR>', { desc = '[C]lose current tab' })
keymap.set('n', '<leader>tn', '<cmd> tabn <CR>', { desc = 'Go to [N]ext tab' })
keymap.set('n', '<leader>tp', '<cmd> tabp <CR>', { desc = 'Go to [P]revious tab' })

-- Disable arrow keys in normal mode
keymap.set('n', '<left>', '<cmd> echo "Use h to move!!" <CR>')
keymap.set('n', '<right>', '<cmd> echo "Use l to move!!" <CR>')
keymap.set('n', '<up>', '<cmd> echo "Use k to move!!" <CR>')
keymap.set('n', '<down>', '<cmd> echo "Use j to move!!" <CR>')

-- center cursor
-- keymap.set({ 'n', 'v' }, 'k', 'kzz')
-- keymap.set({ 'n', 'v' }, 'j', 'jzz')
-- keymap.set({ 'n', 'v' }, '<c-u>', '<c-u>zz')
-- keymap.set({ 'n', 'v' }, '<c-d>', '<c-d>zz')
-- keymap.set({ 'n', 'v' }, '<c-f>', '<c-f>zz')
-- keymap.set({ 'n', 'v' }, '<c-b>', '<c-b>zz')

-- vim: ts=2 sts=2 sw=2 et
