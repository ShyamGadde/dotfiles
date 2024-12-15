local dashboard_header = [[
                                                                   
      ████ ██████           █████      ██                    
     ███████████             █████                            
     █████████ ███████████████████ ███   ███████████  
    █████████  ███    █████████████ █████ ██████████████  
   █████████ ██████████ █████████ █████ █████ ████ █████  
 ███████████ ███    ███ █████████ █████ █████ ████ █████ 
██████  █████████████████████ ████ █████ █████ ████ ██████
]]

return {
  {
    "folke/snacks.nvim",
    optional = true,
    dependencies = { "hiphish/rainbow-delimiters.nvim" },
    opts = {
      dashboard = {
        preset = {
          header = dashboard_header,
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 2 },
          { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 2 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 2 },
          { section = "startup" },
        },
      },
      indent = {
        scope = {
          -- INFO: Disabled for now as the highlight groups don't seem to align with the delimiter colors for some reason.
          -- hl = {
          --   "RainbowDelimiterRed",
          --   "RainbowDelimiterYellow",
          --   "RainbowDelimiterBlue",
          --   "RainbowDelimiterOrange",
          --   "RainbowDelimiterGreen",
          --   "RainbowDelimiterViolet",
          --   "RainbowDelimiterCyan",
          -- },
        },
      },
    },
  },

  {
    "akinsho/bufferline.nvim",
    optional = true,
    keys = {
      { "<leader>bx", "<Cmd>BufferLinePickClose<CR>", desc = "Pick Buffer to Close" },
    },
    opts = {
      options = {
        right_mouse_command = "vertical sbuffer %d",
        -- stylua: ignore
        middle_mouse_command = function(n) Snacks.bufdelete.delete(n) end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-Tree",
            highlight = "Directory",
            text_align = "center",
          },
        },
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = {
      sections = {
        lualine_b = {
          { "branch", icon = "" },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    },
  },

  {
    "folke/noice.nvim",
    optional = true,
    opts = {
      popupmenu = {
        ---@type 'nui'|'cmp'
        backend = "cmp",
      },
      presets = {
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    },
  },

  {
    "hiphish/rainbow-delimiters.nvim",
    event = { "LazyFile" },
    config = function()
      local rainbow_delimiters = require("rainbow-delimiters")

      require("rainbow-delimiters.setup").setup({
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        priority = {
          [""] = 110,
          lua = 210,
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      })
    end,
  },

  {
    "williamboman/mason.nvim",
    optional = true,
    opts = {
      ui = {
        border = "rounded",
        height = 0.8,
        icons = {
          package_installed = " ",
          package_pending = " ",
          package_uninstalled = " ",
        },
      },
    },
  },

  {
    "folke/edgy.nvim",
    optional = true,
    opts = {
      options = {
        left = { size = 40 },
      },
    },
  },
}
