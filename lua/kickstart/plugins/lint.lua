return {

  { -- Linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        -- markdown = { 'markdownlint' }, -- TODO: how the fuck do i get this working?
        typescript = { 'eslint_d' },
        typescriptreact = { 'eslint_d' },
      }

      -- To allow other plugins to add linters to require('lint').linters_by_ft,
      -- instead set linters_by_ft like this:
      -- lint.linters_by_ft = lint.linters_by_ft or {}
      -- lint.linters_by_ft['markdown'] = { 'markdownlint' }
      --
      -- However, note that this will enable a set of default linters,
      -- which will cause errors unless these tools are available:
      -- {
      --   clojure = { "clj-kondo" },
      --   dockerfile = { "hadolint" },
      --   inko = { "inko" },
      --   janet = { "janet" },
      --   json = { "jsonlint" },
      --   markdown = { "vale" },
      --   rst = { "vale" },
      --   ruby = { "ruby" },
      --   terraform = { "tflint" },
      --   text = { "vale" }
      -- }
      --
      -- You can disable the default linters by setting their filetypes to nil:
      -- lint.linters_by_ft['clojure'] = nil
      -- lint.linters_by_ft['dockerfile'] = nil
      -- lint.linters_by_ft['inko'] = nil
      -- lint.linters_by_ft['janet'] = nil
      -- lint.linters_by_ft['json'] = nil
      -- lint.linters_by_ft['markdown'] = nil
      -- lint.linters_by_ft['rst'] = nil
      -- lint.linters_by_ft['ruby'] = nil
      -- lint.linters_by_ft['terraform'] = nil
      -- lint.linters_by_ft['text'] = nil

      -- Create autocommand which carries out the actual linting
      -- on the specified events.
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },

  {
    'nvimtools/none-ls.nvim',
    name = 'none-ls',
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    event = { 'BufReadPre', 'BufNewFile' },
    opts = function()
      local null_ls = require 'null-ls'
      local formatting = null_ls.builtins.formatting
      local code_actions = null_ls.builtins.code_actions
      -- local diagnostics = null_ls.builtins.diagnostics
      -- local completion = null_ls.builtins.completion

      -- TODO: Try this suggestion for eslint_d + buf formatting
      -- https://github.com/jose-elias-alvarez/typescript.nvim/issues/57#issuecomment-1387148837

      return {
        root_dir = require('null-ls.utils').root_pattern('.null-ls-root', 'Makefile', '.git'),

        sources = {
          code_actions.gitsigns, -- provide code actions from Gitsigns
          formatting.prettierd,
          -- require 'none-ls.code_actions.eslint_d',
        },
      }
    end,
  },

  -- for eslint_d (not using because eslint_d doesn't work with mason, apparently)
  -- {
  --   'nvimtools/none-ls.nvim',
  --   dependencies = {
  --     'nvimtools/none-ls-extras.nvim',
  --   },
  -- },
}
