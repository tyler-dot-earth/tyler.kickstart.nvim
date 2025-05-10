return {
  -- 'luckasRanarison/tailwind-tools.nvim',
  'jgttech/tailwind-tools.nvim',
  branch = 'feature/monorepo-cache',
  -- 'tyler-dot-earth/tailwind-tools.nvim',
  -- branch = 'patch-2', -- pnpm/turborepo/monorepo support
  name = 'tailwind-tools',
  build = ':UpdateRemotePlugins',
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-telescope/telescope.nvim', -- optional
    'neovim/nvim-lspconfig', -- optional
  },
  ---@type TailwindTools.Option
  opts = {
    cmp = {
      highlight = 'background', -- color preview style, "foreground" | "background"
    },
  },
  -- init = function()
  --   -- NOTE: run `TailwindSort` on save
  --   -- like https://github.com/tailwindlabs/prettier-plugin-tailwindcss
  --   -- but without the plugin
  --   vim.api.nvim_create_autocmd('BufWritePre', {
  --     buffer = 0,
  --     command = 'TailwindSort',
  --   })
  -- end,
  --
  -- init = function()
  --   -- NOTE: run `TailwindSort` on save only if Tailwind LSP is active
  --   vim.api.nvim_create_autocmd('BufWritePre', {
  --     callback = function()
  --       local clients = vim.lsp.get_active_clients { bufnr = 0 }
  --       for _, client in ipairs(clients) do
  --         if client.name == 'tailwindcss' then
  --           vim.cmd 'TailwindSort'
  --           return
  --         end
  --       end
  --     end,
  --   })
  -- end,
}
