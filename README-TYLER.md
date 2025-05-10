# health check

run `:checkhealth` to see if you have any issues

# custom plugins

just add `.lua` files to `./lua/custom/plugins/`

> [!TIP] > `opts` are merged if overwriting `kickstart`-default plugin

## example

`./lua/custom/plugins/oil.lua`

```lua
return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  -- Optional dependencies
  -- dependencies = { { 'echasnovski/mini.icons', opts = {} } },
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
```

## under the hood

`lazy.nvim` treats `import = 'custom.plugins'` like:

```
require('lazy').setup({
  { dir = 'lua/custom/plugins/*.lua' }
})
```

# custom settings

split into 2 groups:

1. `./lua/customer/before-plugins/*.lua` - run before plugins are installed via `lazy.nvim`
2. `./lua/customer/after-plugins/*.lua` - run after plugins are installed via `lazy.nvim`
