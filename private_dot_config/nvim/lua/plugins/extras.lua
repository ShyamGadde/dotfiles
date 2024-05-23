return {
  -- NOTE: Use `opts = {}` to force a plugin to be loaded.

  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    opts = {},
  },

  {
    'szw/vim-maximizer',
    config = function()
      -- Vim-maximizer
      vim.keymap.set('n', '<leader>m', '<cmd> MaximizerToggle! <CR>') -- toggle maximize tab
    end,
  },
}
