return {
  {
    'mfussenegger/nvim-dap',
    event = 'VeryLazy',
    config = function()
      local dap = require 'dap'

      local last_executable = nil
      local last_arguments = nil

      local function probe_executables()
        local cwd = vim.fn.getcwd()
        local executables = {}

        for _, file in ipairs(vim.fn.readdir(cwd)) do
          local filepath = cwd .. '/' .. file
          if vim.fn.executable(filepath) == 1 then
            table.insert(executables, filepath)
          end
        end

        return executables
      end

      local function get_executable()
        if last_executable and vim.fn.executable(last_executable) == 1 then
          last_executable = vim.fn.input('Select executable: ', last_executable, 'file')
          return last_executable
        end

        local executables = probe_executables()

        -- Suggest the first detected executable, or prompt for input if none found
        local suggested_executable = executables[1] or vim.fn.getcwd() .. '/'

        -- Prompt user to confirm or select executable
        last_executable = vim.fn.input('Select executable: ', suggested_executable, 'file')
        return last_executable
      end

      -- Function to get program arguments from user, with caching
      local function get_arguments()
        -- Use last cached arguments as default input
        local default_args = last_arguments or ''
        last_arguments = vim.fn.input('Args: ', default_args)
        return vim.split(last_arguments, '%s+')
      end

      vim.fn.sign_define('DapBreakpoint', {
        text = '●', -- nerdfonts icon here
        texthl = 'Debug',
        -- linehl = "DapBreakpoint",
        -- numhl = "DapBreakpoint",
      })
      vim.fn.sign_define('DapStopped', {
        text = '', -- nerdfonts icon here
        texthl = 'PreProc',
        -- linehl = "DapBreakpoint",
        -- numhl = "DapBreakpoint",
      })

      dap.adapters.gdb = {
        type = 'executable',
        command = 'gdb',
        args = { '-q', '--interpreter=dap', '--eval-command', 'set print pretty on' },
      }
      dap.adapters.python = function(callback, config)
        if config.request == 'launch' then
          callback {
            type = 'executable',
            command = 'python',
            args = { '-m', 'debugpy.adapter' },
          }
        else
          local port = config.connect.port
          local host = config.connect.host

          callback {
            type = 'server',
            port = port,
            host = host,
            options = {
              source_filetype = 'python',
            },
          }
        end
      end

      dap.configurations.python = {
        {
          type = 'python',
          request = 'launch',
          name = 'Launch a debugging session',
          program = '${file}',
          args = get_arguments,
          pythonPath = function()
            return 'python'
          end,
        },
      }
      dap.configurations.c = {
        {
          name = 'Launch',
          type = 'gdb',
          request = 'launch',
          program = get_executable,
          args = get_arguments,
          cwd = '${workspaceFolder}',
          stopAtBeginningOfMainSubprogram = false,
        },
        --[[ {
          name = "Select and attach to process",
          type = "gdb",
          request = "attach",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          pid = function()
            local name = vim.fn.input("Executable name (filter): ")
            return require("dap.utils").pick_process({ filter = name })
          end,
          cwd = "${workspaceFolder}",
        },
        {
          name = "Attach to gdbserver :1234",
          type = "gdb",
          request = "attach",
          target = "localhost:1234",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
        }, ]]
      }
      dap.configurations.cpp = dap.configurations.c
      local widgets = require 'dap.ui.widgets'
      local sidebar = widgets.sidebar(widgets.scopes, { width = 10 }, 'vsplit')
      local bottbar = widgets.sidebar(widgets.frames, { height = 5 }, 'belowright split')
      local repl = require 'dap.repl'

      vim.keymap.set('n', '<leader>dr', function()
        return repl.toggle({}, 'belowright split')
      end)

      vim.keymap.set('n', '<leader>ds', function()
        return sidebar.toggle()
      end)

      vim.keymap.set('n', '<leader>df', function()
        return bottbar.toggle()
      end)

      vim.keymap.set('n', '<leader>dk', function()
        return widgets.hover()
      end)

      vim.keymap.set('n', '<leader>db', '<cmd>DapToggleBreakpoint<CR>')
      vim.keymap.set('n', '<leader>dd', '<cmd>DapTerminate<CR>')
      vim.keymap.set('n', '<leader>dc', '<cmd>DapContinue<CR>')
      vim.keymap.set('n', '<leader>dn', '<cmd>DapStepOver<CR>')
      vim.keymap.set('n', '<leader>di', '<cmd>DapStepInto<CR>')
      vim.keymap.set('n', '<leader>do', '<cmd>DapStepOut<CR>')
    end,
  },

  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    config = function()
      local dap, dapui = require 'dap', require 'dapui'
      dapui.setup {
        controls = {
          element = 'repl',
          enabled = false,
          icons = {
            disconnect = '',
            pause = '',
            play = '',
            run_last = '',
            step_back = '',
            step_into = '',
            step_out = '',
            step_over = '',
            terminate = '',
          },
        },
        element_mappings = {},
        expand_lines = true,
        floating = {
          border = 'noborder',
          mappings = {
            close = { 'q', '<Esc>' },
          },
        },
        force_buffers = true,
        icons = {
          collapsed = '',
          current_frame = '',
          expanded = '',
        },
        layouts = {
          -- {
          --   elements = {
          --     -- {
          --     --   id = 'scopes',
          --     --   size = 1,
          --     -- },
          --     -- {
          --     --   id = 'breakpoints',
          --     --   size = 0.25,
          --     -- },
          --     -- {
          --     --   id = 'stacks',
          --     --   size = 0.25,
          --     -- },
          --     -- {
          --     --   id = 'watches',
          --     --   size = 0.25,
          --     -- },
          --   },
          --   position = 'left',
          --   size = 0,
          -- },
          {
            elements = {
              {
                id = 'repl',
                size = 1,
              },
              --[[ {
                id = "console",
                size = 0.5,
              }, ]]
            },
            position = 'bottom',
            size = 10,
          },
        },
        mappings = {
          edit = 'e',
          expand = { '<CR>', '<2-LeftMouse>' },
          open = 'o',
          remove = 'd',
          repl = 'r',
          toggle = 't',
        },
        render = {
          indent = 1,
          max_value_lines = 100,
        },
      }

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
        vim.api.nvim_command 'wincmd j'
      end
      -- dap.listeners.before.event_terminated.dapui_config = function()
      --   dapui.close()
      -- end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
    end,
  },
}
