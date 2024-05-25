-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
  'lewis6991/gitsigns.nvim',
  event = 'VeryLazy',
  opts = {
    signs = {

      change = { text = '┆' },
    },
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, { desc = 'Jump to next Git [c]hange' })

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, { desc = 'Jump to previous Git [c]hange' })

      require('which-key').register {
        ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
      }
      -- Actions
      -- visual mode
      map('v', '<leader>gs', function()
        gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'Git [s]tage hunk' })
      map('v', '<leader>gr', function()
        gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'Git [r]eset hunk' })
      -- normal mode
      map('n', '<leader>gs', gitsigns.stage_hunk, { desc = 'Git [S]tage hunk' })
      map('n', '<leader>gr', gitsigns.reset_hunk, { desc = 'Git [R]eset hunk' })
      map('n', '<leader>gS', gitsigns.stage_buffer, { desc = 'Git [S]tage buffer' })
      map('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = 'Git [U]ndo stage hunk' })
      map('n', '<leader>gR', gitsigns.reset_buffer, { desc = 'Git [R]eset buffer' })
      map('n', '<leader>gp', gitsigns.preview_hunk, { desc = 'Git [P]review hunk' })
      map('n', '<leader>gb', gitsigns.blame_line, { desc = 'Git [B]lame line' })
      map('n', '<leader>gB', function()
        gitsigns.blame_line { full = true }
      end, { desc = 'Git [B]lame line *full*' })
      map('n', '<leader>gd', gitsigns.diffthis, { desc = 'Git [d]iff against index' })
      map('n', '<leader>gD', function()
        gitsigns.diffthis '@'
      end, { desc = 'Git [d]iff against last commit' })
      -- Toggles
      map('n', '\\B', gitsigns.toggle_current_line_blame, { desc = 'Toggle inline Git [B]lame' })
      map('n', '\\D', gitsigns.toggle_deleted, { desc = 'Toggle [D]eleted (Git)' })
    end,
  },
}
