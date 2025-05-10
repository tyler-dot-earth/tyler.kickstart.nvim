-- NOTE: It's crucial to setup plugins in the following order:
-- 1. mason.nvim
-- 2. conform.nvim
-- 3. mason-conform.nvim
return {
  'zapling/mason-conform.nvim',
  opts = {
    --
  },
  -- NOTE: assuming this is how i ensure setup happens in order?
  dependencies = {
    'williamboman/mason.nvim',
    'stevearc/conform.nvim',
  },
}
