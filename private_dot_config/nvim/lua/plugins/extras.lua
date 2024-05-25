return {
  -- NOTE: Use `opts = {}` to force a plugin to be loaded.

  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    opts = {},
  },

  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = 'VeryLazy',
    opts = {},
  },

  {
    'Wansmer/treesj',
    keys = {
      { 'gs', desc = 'Split/Join Toggle' },
      { 'gS', desc = 'Split/Join Recursive Toggle' },
    },
    opts = {
      use_default_keymaps = false,
      max_join_length = 150,
    },
    config = function(_, opts)
      local treesj = require 'treesj'
      treesj.setup(opts)

      -- For default preset
      vim.keymap.set('n', 'gs', treesj.toggle)
      -- For extending default preset with `recursive = true`
      vim.keymap.set('n', 'gS', function()
        treesj.toggle { split = { recursive = true } }
      end)
    end,
  },

  -- {
  --   'szw/vim-maximizer',
  --   config = function()
  --     -- Vim-maximizer
  --     vim.keymap.set('n', '<leader>m', '<cmd> MaximizerToggle! <CR>') -- toggle maximize tab
  --   end,
  -- },

  -- Navigate nvim and tmux windows/panels with vim bindings
  -- {
  --   'christoomey/vim-tmux-navigator',
  --   -- Only load this plugin if tmux is being used
  --   event = function()
  --     if vim.fn.exists '$TMUX' == 1 then
  --       return 'VeryLazy'
  --     end
  --   end,
  -- },
}
