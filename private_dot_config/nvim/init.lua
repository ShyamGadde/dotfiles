-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed
vim.g.have_nerd_font = true

-- [[ Setting options ]]
require 'core.options'

-- [[ Setting Keymaps ]]
require 'core.keymaps'

-- [[ Setting Autocommands ]]
require 'core.autocmds'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'core.bootstrap-lazy'

-- [[ Set additional filetypes ]]
vim.filetype.add {
  pattern = {
    ['.*%.hl'] = 'hyprlang',
    ['hypr.*%.conf'] = 'hyprlang',
    ['.*/hypr/.*%.conf'] = 'hyprlang',
  },
}

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
require('lazy').setup('plugins', {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
  checker = {
    enabled = true,
    concurrency = 1, -- set to 1 to check for updates very slowly
    notify = false,
  },
  change_detection = {
    notify = true,
  },
})

-- vim: ts=2 sts=2 sw=2 et
