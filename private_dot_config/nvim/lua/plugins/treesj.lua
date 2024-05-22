return {
  'Wansmer/treesj',
  keys = {
    { 'gs', desc = 'Toggle Split/Join' },
    { 'gS', desc = 'Toggle Split/Join Recursive' },
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
}
