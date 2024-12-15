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
    "snacks.nvim",
    optional = true,
    opts = function(_, opts)
      opts.dashboard.preset.header = dashboard_header
    end,
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
    "lukas-reineke/indent-blankline.nvim",
    dependencies = {
      "hiphish/rainbow-delimiters.nvim",
    },
    opts = function(_, opts)
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
      }

      local hooks = require("ibl.hooks")
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)

      vim.g.rainbow_delimiters = { highlight = highlight }

      opts.indent = {
        tab_char = "│",
      }

      opts.scope = vim.tbl_extend("force", opts.scope or {}, {
        highlight = highlight,
      })

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
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
