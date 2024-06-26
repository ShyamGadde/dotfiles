return {
  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      local logo = [[
                                                                           
              ████ ██████           █████      ██                    
             ███████████             █████                            
             █████████ ███████████████████ ███   ███████████  
            █████████  ███    █████████████ █████ ██████████████  
           █████████ ██████████ █████████ █████ █████ ████ █████  
         ███████████ ███    ███ █████████ █████ █████ ████ █████ 
        ██████  █████████████████████ ████ █████ █████ ████ ██████
    ]]

      logo = string.rep("\n", 6) .. logo .. "\n\n"

      opts.config.header = vim.split(logo, "\n")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
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
    "rcarriga/nvim-notify",
    opts = {
      stages = "fade_in_slide_out",
    },
  },
}
