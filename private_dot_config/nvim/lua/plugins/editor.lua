return {
  -- File Explorer
  {
    "nvim-neo-tree/neo-tree.nvim",
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
      enable_cursor_hijack = true, -- If enabled neotree will keep the cursor on the first letter of the filename when moving in the tree.
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
    dependencies = { "nvim-tree/nvim-web-devicons" },
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

  -- Jump
  {
    "folke/flash.nvim",
    -- keys = {
    --   -- disable the default flash keymap
    --   { "s", mode = { "n", "x", "o" }, false },
    -- },
    opts = {
      jump = {
        -- automatically jump when there is only one match
        autojump = true,
      },
      modes = {
        char = {
          -- hide after jump when not using jump labels
          autohide = true,
          jump_labels = true,
        },
      },
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
    -- keys = {
    --   { "<leader>U", "<Cmd>UndotreeToggle<CR>", desc = "Undo Tree" },
    -- },
    config = function()
      vim.g.undotree_WindowLayout = 2
      vim.g.undotree_SetFocusWhenToggle = 1
      vim.g.undotree_SplitWidth = 35
      vim.g.undotree_DiffpanelHeight = 15
      vim.g.undotree_DiffCommand = "diff --unified=0"
      -- vim.g.undotree_DiffCommand = "git diff --no-index --unified=0 --patience"
    end,
  },
}
