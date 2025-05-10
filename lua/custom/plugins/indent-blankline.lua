-- Guide lines for indents
-- Adds indentation guides even on blank lines
-- :help indent_blankline.txt
return {
  'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  ---@module "ibl"
  ---@type ibl.config
  opts = {
    indent = {},
  },
}

-- Configuration for indent-blankline, syncs with rainbow-delimiters
-- local highlight = {
--   'RainbowRed',
--   'RainbowYellow',
--   'RainbowBlue',
--   'RainbowOrange',
--   'RainbowGreen',
--   'RainbowViolet',
--   'RainbowCyan',
-- }
-- local hooks = require 'ibl.hooks'
-- -- create the highlight groups in the highlight setup hook, so they are reset
-- -- every time the colorscheme changes
-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
--   -- Everforest setup
--   local everforest = require 'everforest'
--   local colours = require 'everforest.colours'
--   local palette = colours.generate_palette(everforest.config, vim.o.background)
--   -- print(vim.inspect(palette))
--   vim.api.nvim_set_hl(0, 'RainbowRed', { fg = palette.red })
--   vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = palette.yellow })
--   vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = palette.blue })
--   vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = palette.purple })
--   vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = palette.orange })
--   vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = palette.statusline1 })
--   vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = palette.aqua })
-- end)
-- vim.g.rainbow_delimiters = { highlight = highlight }
-- require('ibl').setup { scope = { highlight = highlight } }
-- hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
