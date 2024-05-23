return {
  -- NOTE: Use `opts = {}` to force a plugin to be loaded.

  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    opts = {},
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
