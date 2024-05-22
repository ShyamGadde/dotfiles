--  See `:help vim.keymap.set()`

-- Clear highlight on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd> nohlsearch <CR>')

-- Disable space in normal and visual mode
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd> echo "Use h to move!!" <CR>')
vim.keymap.set('n', '<right>', '<cmd> echo "Use l to move!!" <CR>')
vim.keymap.set('n', '<up>', '<cmd> echo "Use k to move!!" <CR>')
vim.keymap.set('n', '<down>', '<cmd> echo "Use j to move!!" <CR>')

-- center cursor
-- vim.keymap.set({ 'n', 'v' }, 'k', 'kzz')
-- vim.keymap.set({ 'n', 'v' }, 'j', 'jzz')
-- vim.keymap.set({ 'n', 'v' }, '<c-u>', '<c-u>zz')
-- vim.keymap.set({ 'n', 'v' }, '<c-d>', '<c-d>zz')
-- vim.keymap.set({ 'n', 'v' }, '<c-f>', '<c-f>zz')
-- vim.keymap.set({ 'n', 'v' }, '<c-b>', '<c-b>zz')

-- vim: ts=2 sts=2 sw=2 et
