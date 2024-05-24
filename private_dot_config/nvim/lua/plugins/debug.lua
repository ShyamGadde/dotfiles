return {
  {
    'mfussenegger/nvim-dap',
    lazy = true,
    dependencies = {
      -- Creates a beautiful debugger UI
      {
        'rcarriga/nvim-dap-ui',
        opts = {},
      },

      -- Required dependency for nvim-dap-ui
      'nvim-neotest/nvim-nio',

      -- Add virtual text support
      {
        'theHamsta/nvim-dap-virtual-text',
        opts = {
          virt_text_pos = 'eol',
          commented = true,
          -- Customize virtual text
          display_callback = function(variable, buf, stackframe, node, options)
            if options.virt_text_pos == 'inline' then
              return ' = ' .. variable.value
            else
              return variable.name .. ' = ' .. variable.value
            end
          end,
        },
      },

      -- Installs the debug adapters for you
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',
    },
    config = function()
      local dap = require 'dap'
      local dapui = require 'dapui'

      require('mason-nvim-dap').setup {
        -- Makes a best effort to setup the various debuggers with
        -- reasonable debug configurations
        automatic_installation = true,

        -- You can provide additional configuration to the handlers,
        -- see mason-nvim-dap README for more information
        handlers = {},

        ensure_installed = {
          'delve',
          'python',
        },
      }

      vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'Debug: Start/[C]ontinue' })
      vim.keymap.set('n', '<leader>dj', dap.step_over, { desc = 'Debug: Step Over' })
      vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Debug: Step [I]nto' })
      vim.keymap.set('n', '<leader>do', dap.step_out, { desc = 'Debug: Step [O]ut' })
      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Debug: Toggle [B]reakpoint' })
      vim.keymap.set('n', '<leader>dr', dap.clear_breakpoints, { desc = 'Debug: [R]eset Breakpoints' })
      -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
      vim.keymap.set('n', '<leader>dR', dapui.toggle, { desc = 'Debug: See last session [R]esult.' })

      vim.keymap.set('n', '<leader>dB', function()
        dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end, { desc = 'Debug: Set Conditional [B]reakpoint' })

      vim.keymap.set('n', '<leader>dl', function()
        dap.set_breakpoint(nil, nil, vim.fn.input 'Log point message: ')
      end, { desc = 'Debug: Set [L]og Point' })

      vim.keymap.set('n', '<leader>dd', function()
        dap.disconnect()
        dapui.close()
      end, { desc = 'Debug: Disconnect' })

      vim.keymap.set('n', '<leader>dt', function()
        dap.terminate()
        dapui.close()
      end, { desc = 'Debug: Terminate' })

      dap.listeners.after.event_initialized['dapui_config'] = dapui.open
      dap.listeners.before.event_terminated['dapui_config'] = dapui.close
      dap.listeners.before.event_exited['dapui_config'] = dapui.close
    end,
  },

  -- Add debuggers
  {
    'leoluz/nvim-dap-go',
    dependencies = {
      'mfussenegger/nvim-dap',
    },
    ft = 'go',
    opts = {
      delve = {
        -- On Windows delve must be run attached or it crashes.
        -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
        detached = vim.fn.has 'win32' == 0,
      },
    },
  },
  {
    'mfussenegger/nvim-dap-python',
    dependencies = {
      'mfussenegger/nvim-dap',
    },
    ft = 'python',
    config = function()
      require('dap-python').setup()

      -- vim.keymap.set('n', '<leader>tc', function()
      --   if vim.bo.filetype == 'python' then
      --     require('dap-python').test_class()
      --   end
      -- end)
      --
      -- vim.keymap.set('n', '<leader>tm', function()
      --   if vim.bo.filetype == 'python' then
      --     require('dap-python').test_method()
      --   end
      -- end)
    end,
  },
}
