-- NOTE: merges with the default opts from kickstart
return {
  'folke/which-key.nvim',
  opts = {
    sort = { 'alphanum' },
    spec = {
      {
        '<leader>a',
        group = '[a]i',
        icon = (vim.g.have_nerd_font and '󱚟') or '🤖',
      },
    },

    -- DEPRECATED:
    -- operators = {
    --   gc = 'Comment',
    --   gb = 'Block Comment',
    -- },
    -- defer = function(wk)
    --   wk.register({}, {
    --     mode = 'o', -- operator-pending mode
    --     -- register the operator leader keys
    --     -- now which-key will show textobjects after "gc", "gb", etc
    --     operators = {
    --       gc = 'Comment',
    --       gb = 'Block Comment',
    --     },
    --   })
    -- end,
  },
}
