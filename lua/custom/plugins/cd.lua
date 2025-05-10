-- return {
--   'dir-change.nvim',
--   lazy = false,
--   config = function()
--     vim.keymap.set('n', '<leader>cd', function()
--       -- prompt user for path input
--       local path = vim.fn.input('cd to: ', vim.fn.getcwd(), 'dir')
--       if path ~= '' then
--         vim.cmd('cd ' .. path)
--         print('changed directory to: ' .. vim.fn.getcwd())
--       end
--     end, { desc = 'Change working directory' })
--   end,
-- }

vim.keymap.set('n', '<leader>cd', function()
  local path = vim.fn.input('cd to: ', vim.fn.getcwd(), 'dir')
  if path ~= '' then
    vim.cmd('cd ' .. path)
    print('changed directory to: ' .. vim.fn.getcwd())
  end
end, { desc = 'Change working directory' })

return {}
