-- Sets commentstring depending on location of cursor
return {
  'JoosepAlviste/nvim-ts-context-commentstring',
  opts = {
    -- Disable CursorHold when using native neovim commenting.
    enable_autocmd = false,
    -- Then, anywhere in your config, override the Neovim internal
    -- get_option function which is called whenever the commentstring is requested
  },
  -- Some handy commenting operators:
  -- How to comment out a component in a React JSX file:
  -- gca> - go comment around angle bracket. NOTE: doesn't work well if component contains a <> (eg onChange={e => {}})
}

-- Configuration for nvim-ts-context-commentstring with native neovim commenting
-- local get_option = vim.filetype.get_option
-- vim.filetype.get_option = function(filetype, option)
--   return option == 'commentstring' and require('ts_context_commentstring.internal').calculate_commentstring() or get_option(filetype, option)
-- end
