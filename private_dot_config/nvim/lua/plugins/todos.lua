-- Highlight todo, notes, etc in comments
return {
  'folke/todo-comments.nvim',
  event = 'VeryLazy',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('todo-comments').setup()

    vim.keymap.set('n', ']t', function()
      require('todo-comments').jump_next()
    end, { desc = 'Go to Next [T]odo comment' })

    vim.keymap.set('n', '[t', function()
      require('todo-comments').jump_prev()
    end, { desc = 'Go to Previous [T]odo comment' })

    vim.keymap.set('n', '<leader>ft', '<cmd> TodoTelescope <CR>', { desc = 'Find in [T]odos' })
  end,
}
