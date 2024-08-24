-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    -- 'rcarriga/nvim-dap-ui',
    {
      'rcarriga/nvim-dap-ui',
      dependencies = {
        'mfussenegger/nvim-dap',
        'nvim-neotest/nvim-nio',
      },
      keys = {
        {
          '<leader>du',
          function()
            require('dapui').toggle {}
          end,
          -- desc = desc 'Dap UI',
        },
      },
    },

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    -- 'leoluz/nvim-dap-go',
    {
      'mxsdev/nvim-dap-vscode-js',
      dependencies = {
        'mfussenegger/nvim-dap',

        -- TODO: might be duplicitous with mason installed version?
        {
          'microsoft/vscode-js-debug',
          build = 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out',
        },
      },
      opts = {
        -- debugger_path = vim.fn.resolve(vim.fn.stdpath 'data' .. '/lazy/vscode-js-debug'),
        -- debugger_path = '~/.local/share/nvim-kickstart' .. '/lazy/vscode-js-debug',
        debugger_path = '/home/tyler/.local/share/nvim-kickstart/lazy/vscode-js-debug',
        adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
      },
    },
  },
  keys = function(_, keys)
    local dap = require 'dap'
    local dapui = require 'dapui'
    return {
      -- Basic debugging keymaps, feel free to change to your liking!
      { '<F5>', dap.continue, desc = 'Debug: Start/Continue' },
      { '<F1>', dap.step_into, desc = 'Debug: Step Into' },
      { '<F2>', dap.step_over, desc = 'Debug: Step Over' },
      { '<F3>', dap.step_out, desc = 'Debug: Step Out' },
      { '<leader>b', dap.toggle_breakpoint, desc = 'Debug: Toggle Breakpoint' },
      {
        '<leader>B',
        function()
          dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        end,
        desc = 'Debug: Set Breakpoint',
      },
      -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
      { '<F7>', dapui.toggle, desc = 'Debug: See last session result.' },
      unpack(keys),
    }
  end,
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

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        -- 'delve',
        'js',
      },
    }

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }

    -- dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    -- dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    -- dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Install golang specific config
    -- require('dap-go').setup {
    --   delve = {
    --     -- On Windows delve must be run attached or it crashes.
    --     -- See https://github.com/leoluz/nvim-dap-go/blob/main/README.md#configuring
    --     detached = vim.fn.has 'win32' == 0,
    --   },
    -- }

    -- Typescript and React
    for _, language in ipairs {
      'typescript',
      'typescriptreact',
    } do
      dap.configurations[language] = {
        -- Next.js adapters
        -- (These represent `launch.json` configs)
        {
          name = 'Next.js: debug server-side',
          type = 'pwa-node',
          request = 'launch',
          cwd = '${workspaceFolder}',
          runtimeExecutable = 'npm',
          runtimeArgs = {
            'run-script',
            -- 'dev',
            'dev:turbo',
          },
          sourceMaps = true,
        },
        {
          name = 'Next.js: debug client-side',
          type = 'pwa-chrome',
          request = 'launch',
          url = 'http://localhost:3000',
          sourceMaps = true,
        },

        {
          name = 'Launch file',
          type = 'pwa-node',
          request = 'launch',
          program = '${file}',
          cwd = '${workspaceFolder}',
          sourceMaps = true,
          preLaunchTask = 'tsc',
        },
        {
          name = 'Attach to node process',
          type = 'pwa-node',
          request = 'attach',
          processId = require('dap.utils').pick_process,
          cwd = '${workspaceFolder}',
          rootPath = '${workspaceFolder}',
        },
        {
          name = 'Debug Jest Tests',
          type = 'pwa-node',
          request = 'launch',
          runtimeExecutable = 'node',
          runtimeArgs = {
            './node_modules/jest/bin/jest.js',
            '--runInBand',
          },
          rootPath = '${workspaceFolder}',
          cwd = '${workspaceFolder}',
          console = 'integratedTerminal',
          internalConsoleOptions = 'neverOpen',
        },
        {
          name = 'TS Node Launch',
          type = 'pwa-node',
          request = 'launch',
          sourceMaps = true,
          cwd = '${workspaceFolder}',
          runtimeExecutable = 'node',
          runtimeArgs = { '--nolazy', '-r', 'ts-node/register' },

          args = { '--inspect', '${file}' },

          skipFiles = { '<node_internals>/**', 'node_modules/**' },
        },
      }
    end
  end,
}
