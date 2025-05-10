-- NOTE: this merges with the gitsigns config that comes with kickstart
return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '🌱' }, -- sprout symbolizes something new (added line)
        change = { text = '🌀' }, -- cyclone as things are changing
        delete = { text = '🔥' }, -- fire as the line has been deleted
        topdelete = { text = '💥' }, -- collision symbolizing the start of a deletion
        changedelete = { text = '🌪' }, -- tornado, as the change has been deleted
        untracked = { text = '✨' }, -- sparkles, as these are untracked changes
      },

      current_line_blame = true,
    },
  },
}
