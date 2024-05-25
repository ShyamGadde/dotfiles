-- Useful plugin to show you pending keybinds.
return {
  'folke/which-key.nvim',
  -- Sets the loading event to 'VimEnter', which loads which-key before all the UI elements are loaded.
  -- event = 'VimEnter',
  event = 'VeryLazy',
  config = function() -- This is the function that runs, AFTER loading
    require('which-key').setup()

    -- Document existing key chains
    require('which-key').register {
      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = '[D]ebug', _ = 'which_key_ignore' },
      ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
      ['<leader>n'] = { name = '[N]eoTree', _ = 'which_key_ignore' },
      ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
      ['<leader>fs'] = { name = 'Find [S]ymbols', _ = 'which_key_ignore' },
      ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
    }
    -- visual mode
    require('which-key').register({
      ['<leader>g'] = { '[G]it' },
    }, { mode = 'v' })
  end,
}
