-- NOTE: potential alternatives
-- > https://github.com/pocco81/true-zen.nvim
-- > https://github.com/folke/snacks.nvim/blob/main/docs/zen.md
return {
  'folke/zen-mode.nvim',
  opts = {
    -- this will change the font size on kitty when in zen mode
    -- to make this work, you need to set the following kitty options:
    -- - allow_remote_control socket-only
    -- - listen_on unix:/tmp/kitty
    -- kitty = {
    --   enabled = false,
    --   font = '+4', -- font size increment
    -- },

    -- no need in zen mode (it actually causes grief if enabled in zen mode)
    -- on_open = function()
    --   require('incline').disable()
    -- end,
    -- on_close = function()
    --   require('incline').enable()
    -- end,

    plugins = {
      options = {
        laststatus = 3, -- always show statusline
      },

      twilight = {
        enabled = false, -- start Twilight when zen mode opens?
      },

      gitsigns = {
        enabled = false, -- use gitsigns when zen mode active?
        -- NOTE: ^ seems reversed, eg false = enabled?
      },
    },
  },
  keys = {
    {
      '<leader>Z',
      '<cmd>ZenMode<cr>',
      desc = 'Zen mode 🪷',
    },
  },
}
