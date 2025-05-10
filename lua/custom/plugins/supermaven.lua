-- return {}
return {
  'supermaven-inc/supermaven-nvim',
  opts = {
    keymaps = {
      accept_suggestion = '<Tab>',
      -- accept_suggestion = '<C-Enter>',
      clear_suggestion = '<C-]>',
      accept_word = '<C-j>',
    },

    -- color = {
    -- 	suggestion_color = "#ffffff",
    -- 	cterm = 244,
    -- },
    -- disable_inline_completion = true, -- disables inline completion for use with cmp
    -- disable_keymaps = false -- disables built in keymaps for more manual control

    -- Honestly not sure either of these are working,
    -- but that's why i'm also using `ft` to whitelist
    -- condition = function()
    --   return vim.bo.filetype ~= 'env'
    -- end,
    -- ignore_filetypes = { env = true },
  },
  ft = {
    'lua',
    'vim',
    'javascript',
    'typescript',
    'typescriptreact',
    'json',
    'css',
    'scss',
    'html',
    'prisma',
  },
}
