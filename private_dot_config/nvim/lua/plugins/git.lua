-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('gitsigns').setup {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
        },
        on_attach = function(bufnr)
          local gitsigns = require 'gitsigns'

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            opts.desc = 'Git: ' .. opts.desc
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then
              vim.cmd.normal { ']c', bang = true }
            else
              gitsigns.nav_hunk 'next'
            end
          end, { desc = 'Jump to next [c]hange' })

          map('n', '[c', function()
            if vim.wo.diff then
              vim.cmd.normal { '[c', bang = true }
            else
              gitsigns.nav_hunk 'prev'
            end
          end, { desc = 'Jump to previous [c]hange' })

          -- Actions
          -- visual mode
          map('v', '<leader>gs', function()
            gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end, { desc = '[S]tage hunk' })
          map('v', '<leader>gr', function()
            gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
          end, { desc = '[R]eset hunk' })
          -- normal mode
          map('n', '<leader>gs', gitsigns.stage_hunk, { desc = '[S]tage hunk' })
          map('n', '<leader>gr', gitsigns.reset_hunk, { desc = '[R]eset hunk' })
          map('n', '<leader>gS', gitsigns.stage_buffer, { desc = '[S]tage buffer' })
          map('n', '<leader>gu', gitsigns.undo_stage_hunk, { desc = '[U]ndo stage hunk' })
          map('n', '<leader>gR', gitsigns.reset_buffer, { desc = '[R]eset buffer' })
          map('n', '<leader>gp', gitsigns.preview_hunk, { desc = '[P]review hunk' })
          map('n', '<leader>gb', gitsigns.blame_line, { desc = '[B]lame line' })
          map('n', '<leader>gB', function()
            gitsigns.blame_line { full = true }
          end, { desc = 'Git [B]lame line *full*' })
          map('n', '<leader>gd', gitsigns.diffthis, { desc = '[D]iff against index' })
          map('n', '<leader>gD', function()
            gitsigns.diffthis '@'
          end, { desc = '[D]iff against last commit' })
          -- Toggles
          map('n', '\\B', gitsigns.toggle_current_line_blame, { desc = 'Toggle inline Git [B]lame' })
          map('n', '\\D', gitsigns.toggle_deleted, { desc = 'Toggle [D]eleted (Git)' })

          -- Text object
          map({ 'o', 'x' }, 'ih', ':<C-U> Gitsigns select_hunk <CR>', { desc = 'Select Hunk' })
        end,
      }
    end,
  },
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    keys = {
      { '<leader>gg', '<cmd> LazyGit <cr>', desc = 'Open Lazygit' },
    },
    config = function()
      vim.g.lazygit_floating_window_use_plenary = 1
      vim.g.lazygit_use_neovim_remote = 0
    end,
  },
}
