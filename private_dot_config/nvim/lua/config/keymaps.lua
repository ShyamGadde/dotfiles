local map = vim.keymap.set
local unmap = vim.keymap.del

-- Use a command instead of a keymap
-- map("n", "<leader>L", function() LazyVim.news.changelog() end, { desc = "LazyVim Changelog" })
unmap("n", "<leader>L")
vim.api.nvim_create_user_command("LazyVimChangelog", function()
  LazyVim.news.changelog()
end, { desc = "LazyVim Changelog" })

-- map("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })
unmap("n", "<leader>l")
map("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- Toggle options
map("n", "<leader>uf", function()
  LazyVim.format.toggle(true)
end, { desc = "Toggle Auto Format (Buffer)" })
map("n", "<leader>uF", function()
  LazyVim.format.toggle()
end, { desc = "Toggle Auto Format (Global)" })

-- Lazygit
map("n", "<leader>gg", function()
  LazyVim.lazygit()
end, { desc = "Lazygit (cwd)" })

map("n", "<leader>gG", function()
  LazyVim.lazygit({ cwd = LazyVim.root.git() })
end, { desc = "Lazygit (Root Dir)" })

map("n", "<leader>gl", function()
  LazyVim.lazygit({ args = { "log" } })
end, { desc = "Lazygit Log (cwd)" })

map("n", "<leader>gL", function()
  LazyVim.lazygit({ args = { "log" }, cwd = LazyVim.root.git() })
end, { desc = "Lazygit Log" })

-- map("n", "<leader>gB", LazyVim.lazygit.browse, { desc = "Git Browse" })
unmap("n", "<leader>gB")
map("n", "<leader>go", LazyVim.lazygit.browse, { desc = "Open in Browser" })

unmap("n", "<leader>gf")
-- Previously mapped to <leader>gf
map("n", "<leader>gF", function()
  local git_path = vim.api.nvim_buf_get_name(0)
  LazyVim.lazygit({ args = { "-f", vim.trim(git_path) } })
end, { desc = "Lazygit Current File History" })

-- Lazydocker
map("n", "<leader>D", function()
  LazyVim.terminal.open({ "lazydocker" }, { cwd = LazyVim.root.get(), esc_esc = false, ctrl_hjkl = false })
end, { desc = "Lazydocker" })

-- Floating terminal
local lazyterm = function()
  LazyVim.terminal(nil, { cwd = LazyVim.root() })
end

map("n", "<leader>ft", function()
  LazyVim.terminal()
end, { desc = "Terminal (cwd)" })

map("n", "<leader>fT", lazyterm, { desc = "Terminal (Root Dir)" })

-- Neovim Terminal
require("which-key").register({
  ["<leader>t"] = { name = "+terminal" },
})
map("n", "<leader>tv", "<Cmd> vsplit | terminal <CR>", { desc = "Open Terminal (Vertical Split)" })
map("n", "<leader>th", "<Cmd> split | terminal <CR>", { desc = "Open Terminal (Horizontal Split)" })

-- Delete single character without copying into register
map("n", "x", '"_x')

map("n", "<leader>fx", "<Cmd> !chmod +x % <CR>", { desc = "Make Current File Executable" })
