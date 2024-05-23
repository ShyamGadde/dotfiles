return { -- Fuzzy Finder (files, lsp, etc)
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    -- See `:help telescope` and `:help telescope.setup()`

    local action_layout = require 'telescope.actions.layout'

    require('telescope').setup {
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.setup()`
      --
      defaults = {
        layout_config = {
          horizontal = {
            preview_width = 0.5,
          },
        },
        mappings = {
          n = {
            ['<M-p>'] = action_layout.toggle_preview,
          },
          i = {
            ['<M-p>'] = action_layout.toggle_preview,
            -- ['<c-enter>'] = 'to_fuzzy_refine'
          },
        },
      },
      -- pickers = {}
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')
    pcall(require('telescope').load_extension, 'notify')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Search [H]elp' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Search [K]eymaps' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Search [F]iles' })
    vim.keymap.set('n', '<leader>sb', builtin.builtin, { desc = 'Search Telescope [B]uiltin' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Search current [W]ord' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Search by [G]rep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Search [D]iagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Search [R]esume' })
    vim.keymap.set('n', '<leader>sn', require('telescope').extensions.notify.notify, { desc = 'Search [N]otifications' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = 'Search Recent Files ("." for repeat)' })
    vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>s/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = 'Search [/] in Open Files' })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>sc', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = 'Search Neovim [C]onfig files' })
  end,
}
