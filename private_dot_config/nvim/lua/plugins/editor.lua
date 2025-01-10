return {
  -- File Explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
    optional = true,
    dependencies = {
      { "3rd/image.nvim", lazy = true },
    },
    keys = {
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
      {
        "<leader>fE",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
        end,
        desc = "Explorer NeoTree (Root Dir)",
      },
      { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (cwd)", remap = true },
      { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (Root Dir)", remap = true },
    },
    opts = {
      enable_cursor_hijack = true, -- If enabled neo-tree will keep the cursor on the first letter of the filename when moving in the tree.
      use_popups_for_input = false,
      window = {
        mappings = {
          ["P"] = { "toggle_preview", config = { use_float = false, use_image_nvim = true } },
        },
      },
    },
  },
  {
    "stevearc/oil.nvim",
    lazy = true,
    cmd = { "Oil" },
    keys = {
      { "-", "<Cmd> Oil --float <CR>", desc = "Open parent directory" },
    },
    opts = {
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,
      experimental_watch_for_changes = true,
    },
  },

  -- Git integration
  {
    "lewis6991/gitsigns.nvim",
    optional = true,
    opts = function(_, opts)
      opts.current_line_blame = true
      opts.current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 300,
        ignore_whitespace = false,
        virt_text_priority = 100,
        use_focus = true,
      }
      opts.current_line_blame_formatter = "      <author>, <author_time:%R> - <summary>"

      Snacks.toggle({
        name = "Current Line Blame",
        get = function()
          return require("gitsigns.config").config.current_line_blame
        end,
        set = function(state)
          require("gitsigns").toggle_current_line_blame(state)
        end,
      }):map("<leader>uB")
    end,
  },

  -- Jump
  {
    "folke/flash.nvim",
    optional = true,
    keys = {
      -- NOTE: This is not needed as quick motions will execute the `nvim-surround` motions,
      -- e.g., `ds"` will delete the surrounding quotes.
      -- E.g., `c<pause>s` will use flash to select the end of selection starting from the cursor.

      -- disable the default flash keymap as it clashes with `nvim-surround`.
      -- { "s", mode = { "n", "x", "o" }, false },
    },
    opts = {
      modes = {
        char = {
          -- Hide after jump when not using jump labels
          autohide = true,
          jump_labels = true,
        },
      },
    },
  },

  -- Filename in the winbar when multiple windows are open
  {
    "b0o/incline.nvim",
    event = "VeryLazy",
    opts = {
      window = {
        padding = 0,
        margin = { horizontal = 0 },
      },
      hide = {
        cursorline = false,
        focused_win = true,
        only_win = true,
      },
      render = function(props)
        local helpers = require("incline.helpers")
        local devicons = require("nvim-web-devicons")

        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")

        if filename == "" then
          filename = "[No Name]"
        end

        local ft_icon, ft_color = devicons.get_icon_color(filename)

        return {
          ft_icon and { " ", ft_icon, " ", guibg = ft_color, guifg = helpers.contrast_color(ft_color) } or "",
          " ",
          { filename, gui = "bold" },
          " ",
          guibg = "#313245",
          guifg = "#89B4FB",
        }
      end,
    },
  },

  -- TODO
  {
    "folke/todo-comments.nvim",
    optional = true,
    keys = {
      {
        "<leader>xt",
        "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>",
        desc = "Todo/Fix/Fixme (Trouble)",
      },
      { "<leader>xT", "<cmd>Trouble todo toggle<cr>", desc = "Todo (Trouble)" },
      { "<leader>st", "<cmd>TodoTelescope keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
      { "<leader>sT", "<cmd>TodoTelescope<cr>", desc = "Todo" },
    },
  },

  -- Statistics
  {
    "wakatime/vim-wakatime",
    event = "VeryLazy",
  },

  -- Working with file permissions
  {
    "lambdalisue/vim-suda",
    cmd = { "SudaRead", "SudaWrite" },
  },

  -- Undo History Visualizer
  {
    "mbbill/undotree",
    cmd = { "UndotreeToggle" },
    config = function()
      vim.g.undotree_WindowLayout = 2
      vim.g.undotree_SetFocusWhenToggle = 1
      vim.g.undotree_SplitWidth = 35
      vim.g.undotree_DiffpanelHeight = 15
      vim.g.undotree_DiffCommand = "diff --unified=0"
      -- vim.g.undotree_DiffCommand = "git diff --no-index --unified=0 --patience"
    end,
  },

  -- WhichKey
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      preset = "helix",
      icons = {
        rules = {
          { pattern = "copy", icon = "", color = "white" },
          { pattern = "paste", icon = "", color = "white" },
          { pattern = "undo", icon = "", color = "red" },
        },
      },
    },
  },
}
