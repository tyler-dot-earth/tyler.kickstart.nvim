-- Highlight todo, notes, etc in comments
-- NOTE: merged with opts from kickstart.nvim defaults
return {
  'folke/todo-comments.nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = {
    signs = false,
    keywords = {
      -- TYLER = { icon = '‼️', color = '#FF0000', alt = { 'TODO', 'FIX' } },
    },
  },
}
