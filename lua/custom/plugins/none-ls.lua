return {
  'nvimtools/none-ls.nvim',
  name = 'none-ls',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  event = { 'BufReadPre', 'BufNewFile' },
  opts = function()
    local null_ls = require 'null-ls'
    -- builtins docs:
    -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md

    -- TODO: Try this suggestion for eslint_d + buf formatting
    -- https://github.com/jose-elias-alvarez/typescript.nvim/issues/57#issuecomment-1387148837

    -- TODO: how to register "eslint fix all" as a code action via null-ls?

    return {
      root_dir = require('null-ls.utils').root_pattern('.null-ls-root', 'Makefile', '.git'),

      -- TODO: try https://github.com/jay-babu/mason-null-ls.nvim
      -- so that this doesn't have to be so manually aligned

      sources = {
        -- code_actions
        null_ls.builtins.code_actions.gitsigns, -- for `./gitsigns.lua`
        null_ls.builtins.code_actions.gitrebase, -- "Injects actions to change gitrebase command (e.g. using squash instead of pick)."
        null_ls.builtins.code_actions.refactoring, -- for `./refactoring.lua`
        null_ls.builtins.code_actions.ts_node_action, -- for `./ts-node-action.lua`
        -- require 'none-ls.code_actions.eslint_d',

        -- diagnostics
        null_ls.builtins.diagnostics.actionlint, -- installed via `./nvim-lspconfig.lua`
        null_ls.builtins.diagnostics.commitlint, -- installed via `./nvim-lspconfig.lua`
        null_ls.builtins.diagnostics.dotenv_linter, -- installed via `./nvim-lspconfig.lua`
        null_ls.builtins.diagnostics.editorconfig_checker, -- installed via `./nvim-lspconfig.lua`
        null_ls.builtins.diagnostics.markdownlint, -- installed via `./nvim-lspconfig.lua`
        null_ls.builtins.diagnostics.markuplint, -- installed via `./nvim-lspconfig.lua`
        null_ls.builtins.diagnostics.stylelint, -- installed via `./nvim-lspconfig.lua`
        null_ls.builtins.diagnostics.zsh, -- https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTINS.md#zsh
        null_ls.builtins.diagnostics.sqlfluff.with {
          extra_args = { '--dialect', 'postgres' },
        },

        -- formatting
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.markdownlint,
        null_ls.builtins.formatting.prisma_format,
        null_ls.builtins.formatting.sqlfluff.with {
          extra_args = { '--dialect', 'postgres' },
        },
        null_ls.builtins.formatting.yamlfix,

        -- completion
        -- null_ls.builtins.completion.*****,
        --

        -- hover
        -- null_ls.builtins.hover.*****,
        null_ls.builtins.hover.dictionary, -- word definition
        null_ls.builtins.hover.printenv, -- print environment variables
      },
    }
  end,
}
