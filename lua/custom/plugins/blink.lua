return {
  'saghen/blink.cmp',

  --- @module 'blink.cmp'
  --- @type blink.cmp.Config
  opts = {
    completion = {
      documentation = {
        auto_show = true,
        -- auto_show_delay_ms = 500,
      },

      list = {
        selection = {
          auto_insert = false,
        },
      },

      menu = {
        auto_show = true,
      },
    },

    fuzzy = {
      implementation = 'prefer_rust_with_warning',
    },
  },
}
