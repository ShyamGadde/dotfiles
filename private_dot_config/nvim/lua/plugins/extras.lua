return {
  -- NOTE: Use `opts = {}` to force a plugin to be loaded.

  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {}, lazy = false },
}
