return {
  {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        auto_restore_enabled = false,
        auto_session_suppress_dirs = { '~/', '~/Downloads', '~/Documents', '~/Desktop/', '/' },
        auto_session_use_git_branch = true,
        cwd_change_handling = {
          post_cwd_changed_hook = function()
            require('lualine').refresh() -- refresh lualine so the new session name is displayed in the status bar
          end,
        },
      }

      require('which-key').register {
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
      }

      local keymap = vim.keymap

      keymap.set('n', '<leader>wr', '<cmd> SessionRestore <CR>', { desc = '[R]estore workspace session' })
      keymap.set('n', '<leader>ws', '<cmd> SessionSave <CR>', { desc = '[S]ave workspace session' })
      keymap.set('n', '<leader>wl', require('auto-session.session-lens').search_session, { desc = '[L]ist worspace sessions' })
    end,
  },
}
