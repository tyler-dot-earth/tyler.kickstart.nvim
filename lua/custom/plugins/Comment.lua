-- return {}
return {
  'numToStr/Comment.nvim',
  -- NOTE: using opts like this caused an error vs config/require
  -- opts = {
  --   -- optional: enable treesitter context commenting
  --   pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
  -- },
  config = function()
    require('Comment').setup {
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    }
  end,
  lazy = false,
}
