-- file explorer that lets you edit your filesystem like a normal Neovim buffer
return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    view_options = {
      -- Show files and directories that start with "."
      show_hidden = true,
    },
  },
  keys = {
    -- run :Oil command
    {
      '<Leader>O', -- key map
      '<cmd>Oil<CR>', -- command
      mode = 'n',
      desc = 'Oil (cwd)',
    },
  },

  -- Optional dependencies
  -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
  dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if prefer nvim-web-devicons
}
