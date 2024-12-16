return {
  {
    "mfussenegger/nvim-dap",
    optional = true,
    dependencies = {
      {
        "theHamsta/nvim-dap-virtual-text",
        optional = true,
        opts = {
          virt_text_pos = "eol",
          commented = false,
          -- Customize virtual text
          display_callback = function(variable, _, _, _, options)
            if options.virt_text_pos == "inline" then
              return " = " .. variable.value
            else
              return variable.name .. ": " .. variable.value
            end
          end,
        },
      },
    },
    -- stylua: ignore
    keys = {
      { "<leader>dO", false },
      { "<leader>dn", function() require("dap").step_over() end, desc = "Step Over" },  -- Previously "<leader>dO"
      { "<leader>dx", function() require("dap").clear_breakpoints() end, desc = "Clear Breakpoints" },
    },
  },

  -- {
  --   "jay-babu/mason-nvim-dap.nvim",
  --   opts = {
  --     ensure_installed = {},
  --   },
  -- },
}
