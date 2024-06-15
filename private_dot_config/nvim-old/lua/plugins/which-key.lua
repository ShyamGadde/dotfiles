-- Useful plugin to show you pending keybinds.
return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').register {
      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>n'] = { name = '[N]eoTree', _ = 'which_key_ignore' },
      ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
      ['<leader>fs'] = { name = 'Find [S]ymbols', _ = 'which_key_ignore' },
    }
    require('which-key').register {
      ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
    }
    -- visual mode
    require('which-key').register({
      ['<leader>g'] = { '[G]it' },
    }, { mode = 'v' })
  end,
}
