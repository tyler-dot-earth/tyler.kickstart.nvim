return { -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  opts = {
    ensure_installed = {
      'bash',
      'c',
      'diff',
      'html',
      'lua',
      'luadoc',
      'markdown',
      'markdown_inline',
      'typescript',
      'tsx',
      'query',
      'vim',
      'vimdoc',
    },

    auto_install = true,

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<CR>',
        node_incremental = '<CR>',
        scope_incremental = '<S-CR>',
        node_decremental = '<BS>',
      },
    },

    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          -- ['ac'] = '@comment.outer', -- doesn't work in typescript :(
          ['ic'] = '@class.inner',
          -- ['ic'] = '@comment.inner', -- doesn't work in typescript :(
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['al'] = '@loop.outer',
          ['il'] = '@loop.inner',
          ['ab'] = '@block.outer',
          ['ib'] = '@block.inner',
          ['ar'] = '@return.outer',
          ['ir'] = '@return.inner',
          -- TODO add more: https://github.com/nvim-treesitter/nvim-treesitter-textobjects?tab=readme-ov-file#built-in-textobjects

          -- TRYING THESE:
          ['ae'] = '@export.outer',
          ['ie'] = '@export.inner',
          -- NOTE: ^^ exports require `<NEOVIMCONFIG>/queries/typescript/textobjects.scm`
          -- like this:
          --
          --     ; outer = whole export block
          --     (export_statement) @export.outer
          --
          --     ; inner = just the thing being exported (e.g. function/class/variable)
          --     (export_statement
          --       (function_declaration) @export.inner)
        },
      },

      -- swap = {
      --   enable = true,
      --   -- TODO reconsider these maps?
      --   swap_next = {
      --     ['<leader>a'] = '@parameter.inner',
      --   },
      --   swap_previous = {
      --     ['<leader>A'] = '@parameter.inner',
      --   },
      -- },
    },

    playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = 'o',
        toggle_hl_groups = 'i',
        toggle_injected_languages = 't',
        toggle_anonymous_nodes = 'a',
        toggle_language_display = 'I',
        focus_language = 'f',
        unfocus_language = 'F',
        update = 'R',
        goto_node = '<cr>',
        show_help = '?',
      },
    },

    pairs = {
      enable = true,
      disable = {},
      highlight_pair_events = {}, -- e.g. {"CursorMoved"}, -- when to highlight the pairs, use {} to deactivate highlighting
      highlight_self = false, -- whether to highlight also the part of the pair under cursor (or only the partner)
      goto_right_end = false, -- whether to go to the end of the right partner or the beginning
      fallback_cmd_normal = "call matchit#Match_wrapper('',1,'n')", -- What command to issue when we can't find a pair (e.g. "normal! %")
      keymaps = {
        goto_partner = '<leader>%',
        delete_balanced = 'X',
      },
      delete_balanced = {
        only_on_first_char = false, -- whether to trigger balanced delete when on first character of a pair
        fallback_cmd_normal = nil, -- fallback command when no pair found, can be nil
        longest_partner = false, -- whether to delete the longest or the shortest pair when multiple found.
        -- E.g. whether to delete the angle bracket or whole tag in  <pair> </pair>
      },
    },
  },
}
