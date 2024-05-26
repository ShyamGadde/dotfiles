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
        layout_strategy = 'horizontal',
        layout_config = {
          horizontal = {
            preview_width = 0.5,
          },
          prompt_position = 'top',
        },
        sorting_strategy = 'ascending',
        winblend = 0,
        path_display = { 'smart' },
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
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find [F]iles' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find existing [B]uffers' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Find by [G]rep' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find in [H]elp' })
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Find [K]eymaps' })
    vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Find current [W]ord' })
    vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = 'Find in [D]iagnostics' })
    vim.keymap.set('n', '<leader>fn', require('telescope').extensions.notify.notify, { desc = 'Find in [N]otifications' })
    vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Find [R]ecent Files' })
    vim.keymap.set('n', '<leader>f.', builtin.resume, { desc = 'Find Resume ([.] for repeat)' })
    vim.keymap.set('n', '<leader>f<leader>', builtin.builtin, { desc = 'Find [ ] Telescope Builtin' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily find in current buffer' })

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys
    vim.keymap.set('n', '<leader>f/', function()
      builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end, { desc = 'Find [/] in Open Files' })

    -- Shortcut for searching your Neovim configuration files
    vim.keymap.set('n', '<leader>fc', function()
      builtin.find_files { cwd = vim.fn.stdpath 'config' }
    end, { desc = 'Find Neovim [C]onfig files' })
  end,
}
