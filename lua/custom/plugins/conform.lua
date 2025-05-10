-- NOTE: opts merge with `kickstart` defaults
return {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      -- lua = { 'stylua' },

      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },

      -- You can use 'stop_after_first' to run the first available formatter from the list
      typescriptreact = {
        'prettierd',
        'prettier',
        stop_after_first = true,
      },
    },

    -- format_after_save = function()
    --   -- Tailwind CSS class sorting
    --   local t_attached = vim.tbl_contains(
    --     vim.tbl_map(function(c)
    --       return c.name
    --     end, vim.lsp.get_clients()),
    --     'tailwindcss'
    --   )
    --   if not t_attached or not pcall(require, 'tailwind-tools') then
    --     return
    --   end
    --   vim.cmd 'TailwindSort' -- TailwindSortSync also available
    --   -- These options will be passed to conform.format()
    --   return { lsp_format = 'fallback' }
    -- end,
  },
}
