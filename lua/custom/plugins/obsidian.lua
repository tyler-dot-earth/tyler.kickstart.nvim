return {
  'obsidian-nvim/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    completion = {
      -- Enables completion using blink.cmp
      blink = true,
      -- Trigger completion at 2 chars.
      min_chars = 2,
    },

    workspaces = {
      {
        name = 'personal',
        path = vim.env.PKM_DIR,
        overrides = {
          -- TODO: way to avoid blank line after frontmatter end syntax?

          -- NOTE: when enabled, force-saves some frontmatter fields even if empty
          disable_frontmatter = true,
          -- Optional, alternatively you can customize the frontmatter data.
          ---@return table
          -- note_frontmatter_func = function(note)
          --   -- Add the title of the note as an alias.
          --   if note.title then
          --     note:add_alias(note.title)
          --   end
          --
          --   local out = { id = note.id, aliases = note.aliases, tags = note.tags }
          --
          --   -- `note.metadata` contains any manually added fields in the frontmatter.
          --   -- So here we just make sure those fields are kept in the frontmatter.
          --   if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          --     for k, v in pairs(note.metadata) do
          --       out[k] = v
          --     end
          --   end
          --
          --   return out
          -- end,
        },
      },
      -- {
      --   name = 'work',
      --   path = '~/vaults/work',
      -- },
    },

    -- see below for full list of options 👇
    -- https://github.com/epwalsh/obsidian.nvim#configuration-options
  },

  keys = {
    { '<Leader>so', '<Cmd>ObsidianQuickSwitch<CR>', desc = '[s]earch [o]bsidian' },
  },
}
