-- For splitting and joining lines
-- NOTE: is this "better enough" than mini.splitjoin ?
-- NOTE: ^ according to :help mini.splitjoin, treesj...
-- > Operates based on tree-sitter nodes. This is more accurate in
-- > some edge cases, but **requires** tree-sitter parser.
-- > Also doesn't work inside comments or strings (mini.splitjoin does).
return {
  'Wansmer/treesj',
  -- keys = {
  --   '<space>m', -- toggle
  --   -- '<space>J', -- join
  --   -- '<space>s', -- split
  -- },
  keys = {
    {
      -- '<Leader>m', -- key map
      'gS',
      function()
        require('treesj').toggle()
      end,
      mode = 'n',
      desc = 'Toggle split/collapse lines',
    },
  },

  dependencies = { 'nvim-treesitter/nvim-treesitter' }, -- if you install parsers with `nvim-treesitter`
  config = function()
    require('treesj').setup {
      --[[ your config ]]
    }
  end,
}
