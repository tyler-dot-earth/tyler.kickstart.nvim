-- NOTE: don't use with typescript-language-server (this plugin is a replacement)
return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  config = function()
    local api = require 'typescript-tools.api'
    require('typescript-tools').setup {
      -- spawn additional tsserver instance to calculate diagnostics on it
      separate_diagnostic_server = true,

      -- "change"|"insert_leave" determine when the client asks the server about diagnostic
      -- publish_diagnostic_on = "insert_leave",

      -- to include all supported code actions specify commands exposed as code_actions
      -- expose_as_code_action = "all",
      expose_as_code_action = {
        'fix_all',
        'add_missing_imports',
        'remove_unused',
        'remove_unused_imports',
        'organize_imports',
      },

      settings = {
        -- https://github.com/microsoft/TypeScript/blob/3b45f4db12bbae97d10f62ec0e2d94858252c5ab/src/server/protocol.ts#L3439
        tsserver_file_preferences = {
          includeInlayParameterNameHints = 'all',
          includeInlayFunctionLikeReturnTypeHints = true,
          -- includeInlayVariableTypeHints = true,
          -- includeInlayPropertyDeclarationTypeHints = true,
          includeInlayEnumMemberValueHints = true,
          importModuleSpecifierPreference = 'non-relative',
        },

        -- tsserver_plugins = {
        --   -- TODO: why doesn't typescript-tools just use the plugins in my tsconfig?
        --   -- UPDATE: it does, sometimes it just takes a few seconds to load
        --   -- after the initial LSP startup
        --   'ts-plugin-sort-import-suggestions',
        --   'next',
        -- },
      },

      handlers = {
        -- NOTE: to filter out diagnostics
        ['textDocument/publishDiagnostics'] = api.filter_diagnostics {
          -- NOTE: not usually helpful when using "use client" to ensure a component can only be used as a client component
          -- 71007, -- TS71007: Props must be serializable for components in the "use client" entry file
          --
          -- 80006 -- TS80006: Could not compile '{0}'.
          -- 2304, -- TS2304: Cannot find name '{0}'.
        },
      },
    }
  end,
}
