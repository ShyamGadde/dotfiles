return {
  -- NOTE: Use `opts = {}` to force a plugin to be loaded.

  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  --[[ "gc" to comment visual regions/lines ]]
  {
    'numToStr/Comment.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      {
        'JoosepAlviste/nvim-ts-context-commentstring',
        opts = {
          enable_autocmd = false,
        },
        config = function(_, opts)
          vim.g.skip_ts_context_commentstring_module = true

          require('ts_context_commentstring').setup(opts)
        end,
      },
    },
    config = function()
      require('Comment').setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end,
  },

  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {},
  },

  {
    'gbprod/substitute.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local substitute = require 'substitute'

      substitute.setup()

      local keymap = vim.keymap

      keymap.set('n', 's', substitute.operator, { desc = 'Substitute with motion' })
      keymap.set('n', 'S', substitute.eol, { desc = 'Substitute to end of line' })
      keymap.set('n', 'ss', substitute.line, { desc = 'Substitute line' })
      keymap.set('x', 's', substitute.visual, { desc = 'Substitute in visual mode' })

      local exchange = require 'substitute.exchange'
      keymap.set('n', 'sx', exchange.operator, { desc = 'Exchange with motion' })
      keymap.set('n', 'sxx', exchange.line, { desc = 'Exchange line' })
      keymap.set('x', 'sx', exchange.visual, { desc = 'Exchange in visual mode' })
    end,
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

  {
    'szw/vim-maximizer',
    keys = {
      { '<leader>sm', '<cmd> MaximizerToggle! <CR>', desc = 'Split [M]aximize Toggle' },
    },
  },

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
