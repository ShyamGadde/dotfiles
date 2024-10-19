local map = vim.keymap.set
local unmap = vim.keymap.del

-- Use a command instead of a keymap
-- map("n", "<leader>L", function() LazyVim.news.changelog() end, { desc = "LazyVim Changelog" })
unmap("n", "<leader>L")
-- stylua: ignore
vim.api.nvim_create_user_command("LazyVimChangelog", function() LazyVim.news.changelog() end, { desc = "LazyVim Changelog" })
-- map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
unmap("n", "<leader>l")
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })

--[[
-- Toggle options
]]
-- stylua: ignore start
map("n", "<leader>uf", function() LazyVim.format.toggle(true) end, { desc = "Toggle Auto Format (Buffer)" })
map("n", "<leader>uF", function() LazyVim.format.toggle() end, { desc = "Toggle Auto Format (Global)" })
-- stylua: ignore end

--[[
-- Lazygit
]]
-- stylua: ignore start
map("n", "<leader>gg", function() LazyVim.lazygit() end, { desc = "Lazygit (cwd)" })
map("n", "<leader>gG", function() LazyVim.lazygit({ cwd = LazyVim.root.git() }) end, { desc = "Lazygit (Root Dir)" })
map("n", "<leader>gl", function() LazyVim.lazygit({ args = { "log" } }) end, { desc = "Lazygit Log (cwd)" })
map("n", "<leader>gL", function() LazyVim.lazygit({ args = { "log" }, cwd = LazyVim.root.git() }) end, { desc = "Lazygit Log" })
-- map("n", "<leader>gB", LazyVim.lazygit.browse, { desc = "Git Browse" })
unmap("n", "<leader>gB")
map("n", "<leader>go", LazyVim.lazygit.browse, { desc = "Open in Browser" })
unmap("n", "<leader>gf")
-- Previously mapped to <leader>gf
map("n", "<leader>gF", function() local git_path = vim.api.nvim_buf_get_name(0) LazyVim.lazygit({ args = { "-f", vim.trim(git_path) } }) end, { desc = "Lazygit Current File History" })
-- stylua: ignore end

--[[
-- Lazydocker
]]
-- stylua: ignore
map("n", "<leader>D", function() LazyVim.terminal.open({ "lazydocker" }, { cwd = LazyVim.root.get(), esc_esc = false, ctrl_hjkl = false }) end, { desc = "Lazydocker" })

--[[
-- Floating terminal
]]
-- stylua: ignore start
local lazyterm = function() LazyVim.terminal(nil, { cwd = LazyVim.root() }) end
map("n", "<leader>ft", function() LazyVim.terminal() end, { desc = "Terminal (cwd)" })
map("n", "<leader>fT", lazyterm, { desc = "Terminal (Root Dir)" })
unmap("n", "<c-/>")
unmap("n", "<c-_>")
-- previously mapped to <c-_> and <c-/>
map("n", "<C-CR>", lazyterm, { desc = "Terminal (Root Dir)" })
-- stylua: ignore end

--[[
-- Neovim Terminal
]]
map("n", "<leader>tv", "<Cmd>vsplit | terminal<CR>", { desc = "Open Terminal (Vertical Split)" })
map("n", "<leader>th", "<Cmd>split | terminal<CR>", { desc = "Open Terminal (Horizontal Split)" })
unmap("t", "<C-/>")
unmap("t", "<c-_>")
map("t", "<C-CR>", "<Cmd>close<CR>", { desc = "Hide Terminal" })

--[[
-- Files
]]
map("n", "<leader>fx", "<Cmd>!chmod +x %<CR>", { desc = "Make Current File Executable" })
map("n", "<leader>fs", "<Cmd>w<CR>", { desc = "Save File" })
map("n", "<leader>fd", "<Cmd>!rm %<CR>", { desc = "Delete File" })
map("n", "<leader>fD", "<Cmd>!rm %<CR><Cmd>bdelete<CR>", { desc = "Delete File and Buffer" })

--[[
-- Misc
--]]
-- Don't jump when using '*' or '#'
map("n", "*", "*N")
map("n", "#", "#N")
-- Delete single character without copying into register
map("n", "x", '"_x')
