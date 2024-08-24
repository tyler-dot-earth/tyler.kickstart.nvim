--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

What is Kickstart?

  Kickstart.nvim is *not* a distribution.

  Kickstart.nvim is a starting point for your own configuration.
    The goal is that you can read every line of code, top-to-bottom, understand
    what your configuration is doing, and modify it to suit your needs.

    Once you've done that, you can start exploring, configuring and tinkering to
    make Neovim your own! That might mean leaving Kickstart just the way it is for a while
    or immediately breaking it into modular pieces. It's up to you!

    If you don't know anything about Lua, I recommend taking some time to read through
    a guide. One possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

Kickstart Guide:

  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

    If you don't know what this means, type the following:
      - <escape key>
      - :
      - Tutor
      - <enter key>

    (If you already know the Neovim basics, you can skip this step.)

  Once you've completed that, you can continue working through **AND READING** the rest
  of the kickstart init.lua.

  Next, run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    This should be the first place you go to look when you're stuck or confused
    with something. It's one of my favorite Neovim features.

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to [s]earch the [h]elp documentation,
    which is very useful when you're not exactly sure of what you're looking for.

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or Neovim features used in Kickstart.

   NOTE: Look for lines like this

    Throughout the file. These are for you, the reader, to help you understand what is happening.
    Feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your Neovim config.

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now! :)
--]]

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.schedule(function()
--   vim.opt.clipboard = 'unnamedplus'
-- end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300
-- Also impacts things like mini.surround -> https://github.com/echasnovski/mini.nvim/blob/0bd6c4d25f2b0cc1ecb8b1a0f659cce54627e218/lua/mini/surround.lua#L536-L539

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = {
  -- tab = '» ',
  -- trail = '·',
  nbsp = '␣',

  tab = '⣿⣿',
  -- tab = '••',
  -- tab = "◆◆",
  -- eol = '↵',
  --[[ trail = "·", ]]
  --[[ precedes = "⦚", ]]
  --[[ extends = "⦚", ]]
  -- nbsp = '⎵',
  -- space ='░',
  space = '⋅',
  trail = '×',
}
vim.opt.showbreak = '↪\\'

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 5

-- "Recommended neovim settings"
-- -- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3
-- -- Default splitting will cause your main splits to jump when opening an edgebar.
-- -- To prevent this, set `splitkeep` to either `screen` or `topline`.
vim.opt.splitkeep = 'cursor'
-- idk who recommended splitkeep but it really frustrated me because the views jump around.

-- %= -> right side
-- %m -> modified?
-- \  -> space
-- %f -> filename
-- vim.o.winbar = '%=%m %f'

-- Tabs and spacing defaults
-- NOTE: sleuth.nvim will adjust automatically
-- TODO: not sure these are working yet, just stubbing
vim.opt.expandtab = false --
vim.opt.tabstop = 4 --
vim.opt.shiftwidth = 4 --
vim.opt.softtabstop = 0 --

-- Diagnostic sign tweaks
vim.fn.sign_define('DiagnosticSignHint', { text = '⚪', texthl = 'DiagnosticSignHint' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '🔵', texthl = 'DiagnosticSignInfo' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '🟠', texthl = 'DiagnosticSignWarn' })
vim.fn.sign_define('DiagnosticSignError', { text = '🔴', texthl = 'DiagnosticSignError' })

-- Make .env its own filetype.
-- (it's mostly so i can disable some plugins in .env files)
vim.filetype.add {
  extension = {
    env = 'env',
  },
  filename = {
    ['.env'] = 'env',
    ['.env.local'] = 'env',
    ['.env.development'] = 'env',
    ['.env.production'] = 'env',
    ['.env.test'] = 'env',
  },
}

-- Set syntax for 'env' filetype to 'sh'.
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'env',
  command = 'set syntax=sh',
})

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --

  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`. This is equivalent to the following Lua:
  --    require('gitsigns').setup({ ... })
  --
  -- See `:help gitsigns` to understand what the configuration keys do
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        -- add = { text = '+' },
        -- change = { text = '~' },
        -- delete = { text = '_' },
        -- topdelete = { text = '‾' },
        -- changedelete = { text = '~' },
        add = { text = '🌱' }, -- sprout symbolizes something new (added line)
        change = { text = '🌀' }, -- cyclone as things are changing
        delete = { text = '🔥' }, -- fire as the line has been deleted
        topdelete = { text = '💥' }, -- collision symbolizing the start of a deletion
        changedelete = { text = '🌪' }, -- tornado, as the change has been deleted
        -- untracked = { text = '👣' }, -- footprints, as these are untracked changes
        untracked = { text = '✨' }, -- sparkles, as these are untracked changes
      },

      -- NOTE: prefer gitsigns.lua mappings from kickstart.nvim
      -- current_line_blame = true,
    },
  },

  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `config` key, the configuration only runs
  -- after the plugin has been loaded:
  --  config = function() ... end

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup {
        icons = {
          -- set icon mappings to true if you have a Nerd Font
          mappings = vim.g.have_nerd_font,
          -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
          -- default whick-key.nvim defined Nerd Font icons, otherwise define a string table
          keys = vim.g.have_nerd_font and {} or {
            Up = '<Up> ',
            Down = '<Down> ',
            Left = '<Left> ',
            Right = '<Right> ',
            C = '<C-…> ',
            M = '<M-…> ',
            D = '<D-…> ',
            S = '<S-…> ',
            CR = '<CR> ',
            Esc = '<Esc> ',
            ScrollWheelDown = '<ScrollWheelDown> ',
            ScrollWheelUp = '<ScrollWheelUp> ',
            NL = '<NL> ',
            BS = '<BS> ',
            Space = '<Space> ',
            Tab = '<Tab> ',
            F1 = '<F1>',
            F2 = '<F2>',
            F3 = '<F3>',
            F4 = '<F4>',
            F5 = '<F5>',
            F6 = '<F6>',
            F7 = '<F7>',
            F8 = '<F8>',
            F9 = '<F9>',
            F10 = '<F10>',
            F11 = '<F11>',
            F12 = '<F12>',
          },
        },
      }

      -- Document existing key chains
      require('which-key').add {
        { '<leader>c', group = '[C]ode' },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
        { '<leader>a', group = '[A]i' },
        { '<leader>aa', group = '[A]sk Avante' },
        { '<leader>ad', group = '[D]ebug Avante (toggle)' },
        { '<leader>ah', group = '[H]int Avante (toggle)' },
        { '<leader>ar', group = '[R]efresh Avante' },
        -- { '<leader>ae', group = '[E]dit selected blocks' }, -- this mapping doesn't show up in whichkey
      }
    end,
  },

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },

      -- Undo history
      -- <C-cr> or <C-r> to revert
      -- <cr> to yank the additions
      -- <S-cr> or <C-y> to yank the deletions
      { 'debugloop/telescope-undo.nvim' },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- preview scroll speed is too fast, this slows it down
      -- credit: https://github.com/nvim-telescope/telescope.nvim/issues/2602#issuecomment-1636809235
      local state = require 'telescope.state'
      local action_state = require 'telescope.actions.state'
      local slow_scroll = function(prompt_bufnr, direction)
        local previewer = action_state.get_current_picker(prompt_bufnr).previewer
        local status = state.get_status(prompt_bufnr)

        -- Check if we actually have a previewer and a preview window
        if type(previewer) ~= 'table' or previewer.scroll_fn == nil or status.preview_win == nil then
          return
        end

        previewer:scroll_fn(1 * direction)
      end

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        defaults = {
          mappings = {
            i = {
              -- ['<c-enter>'] = 'to_fuzzy_refine',
              ['<c-f>'] = 'to_fuzzy_refine',
              ['<c-d>'] = require('telescope.actions').delete_buffer,
              -- ['<ScrollWheelUp>'] = require('telescope.actions').preview_scrolling_up,
              -- ['<ScrollWheelDown>'] = require('telescope.actions').preview_scrolling_down,
              ['<ScrollWheelUp>'] = function(bufnr)
                slow_scroll(bufnr, -1)
              end,
              ['<ScrollWheelDown>'] = function(bufnr)
                slow_scroll(bufnr, 1)
              end,
            },
          },

          -- TODO: vim aspect-ratio dependent layout strategy.
          -- this might work: https://claude.site/artifacts/9d6297fe-3ea5-4910-8a4c-32d1ba0d70c5
          layout_strategy = 'vertical', -- preview split direction
          layout_config = {
            vertical = {
              preview_height = 0.75, -- more preview height (vs result/prompt)
              mirror = true, -- preview on bottom
              prompt_position = 'top', -- prompt above results
            },
          },
          sorting_strategy = 'ascending', -- reverse order for mirrored layout

          wrap_results = true, -- wrap result names
          dynamic_preview_title = true, -- preview title is filename
          -- path_display = { 'truncate' }, -- not sure what this is?
        },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },

          undo = {},
        },

        -- pickers = {
        --   buffers = {
        --     sort_lastused = true,
        --     ignore_current_buffer = true,
        --   },
        -- },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      pcall(require('telescope').load_extension, 'undo')
      pcall(require('telescope').load_extension, 'notify')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', function()
        builtin.buffers {
          sort_mru = true,
          sort_lastused = true,
          -- ignore_current_buffer = true,
        }
      end, { desc = '[ ] Find existing buffers' })

      -- Slightly advanced example of overriding default behavior and theme
      vim.keymap.set('n', '<leader>/', function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },

  -- LSP Plugins
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },
  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      {
        'j-hui/fidget.nvim',
        -- TODO figure out how to customize this again, seems like my old config doesn't work here
        -- opts = {
        --   text = {
        --     spinner = {
        --       '🛰     ',
        --       ' 🛰    ',
        --       '  🛰   ',
        --       '   🛰  ',
        --       '    🛰 ',
        --       '     🛰',
        --       '    🛰 ',
        --       '   🛰  ',
        --       '  🛰   ',
        --       ' 🛰    ',
        --     },
        --     done = '🚀', -- character shown when all tasks are complete
        --     commenced = 'Started', -- message shown when task starts
        --     completed = 'Completed', -- message shown when task completes
        --   },
        -- },
      },

      -- Allows extra capabilities provided by nvim-cmp
      'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
      -- Brief aside: **What is LSP?**
      --
      -- LSP is an initialism you've probably heard, but might not understand what it is.
      --
      -- LSP stands for Language Server Protocol. It's a protocol that helps editors
      -- and language tooling communicate in a standardized fashion.
      --
      -- In general, you have a "server" which is some tool built to understand a particular
      -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
      -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
      -- processes that communicate with some "client" - in this case, Neovim!
      --
      -- LSP provides Neovim with features like:
      --  - Go to definition
      --  - Find references
      --  - Autocompletion
      --  - Symbol Search
      --  - and more!
      --
      -- Thus, Language Servers are external tools that must be installed separately from
      -- Neovim. This is where `mason` and related plugins come into play.
      --
      -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
      -- and elegantly composed help section, `:help lsp-vs-treesitter`

      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- NOTE: Remember that Lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- Find references for the word under your cursor.
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

          -- Fuzzy find all the symbols in your current workspace.
          --  Similar to document symbols, except searches over your entire project.
          map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP specification.
      --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      local servers = {
        -- clangd = {},
        -- gopls = {},
        -- pyright = {},
        -- rust_analyzer = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`ts_ls`) will work just fine
        -- ts_ls = {},
        --

        lua_ls = {
          -- cmd = {...},
          -- filetypes = { ...},
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },

        -- NOTE: eslint_d doesn't work here, apparently
        eslint = {
          -- settings = {
          --   packageManager = "yarn",
          -- },
          on_attach = function(_client, bufnr)
            -- ESLint fix all problems on save
            vim.api.nvim_create_autocmd('BufWritePre', {
              buffer = bufnr,
              command = 'EslintFixAll',
            })
          end,
        },

        jsonls = {},
        prismals = {},
        html = {},
        cssls = {},

        -- NOTE: tw lsp was finnicky for me unless i ran `nvm use` before launching nvim...
        -- TODO: figure out why because it's super annoying.
        tailwindcss = {
          root_dir = function(fname)
            local root_pattern = require('lspconfig').util.root_pattern(
              --
              'tailwind.config.cjs',
              'tailwind.config.js',
              'tailwind.config.ts',
              'postcss.config.js'
            )
            return root_pattern(fname)
          end,

          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  'class[:]\\s*"([^"]*)"',
                },
              },
            },
          },
        },
      }

      -- Ensure the servers and tools above are installed
      --  To check the current status of installed tools and/or manually install
      --  other tools, you can run
      --    :Mason
      --
      --  You can press `g?` for help in this menu.
      require('mason').setup()

      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for ts_ls)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },

  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        javascript = {
          'prettierd',
          'prettier',
          stop_after_first = true,
        },

        typescript = {
          'prettierd',
          'prettier',
          stop_after_first = true,
        },

        typescriptreact = {
          'prettierd',
          'prettier',
          stop_after_first = true,
        },
      },

      -- When cwd is not found, don't run the formatter (default false)
      require_cwd = true,
    },
    init = function()
      --
    end,
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        lazy = false,
        build = (function()
          -- Build Step is needed for regex support in snippets.
          -- This step is not supported in many windows environments.
          -- Remove the below condition to re-enable on windows.
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()

              local ls = require 'luasnip'
              local s = ls.snippet
              local t = ls.text_node
              local i = ls.insert_node

              ls.add_snippets('typescriptreact', {
                s('boxcomponent', {
                  t 'import { Box, type BoxProps } from "@/components/ui/Box.client"',
                  t 'React.createElement(',
                  i(1, '${1:ComponentName}'),
                  t ', {',
                  i(2, '${2:prop}: ${3:value}'),
                  t '})',
                }),
              })
            end,
          },
        },
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds other completion capabilities.
      --  nvim-cmp does not ship with all sources by default. They are split
      --  into multiple repos for maintenance purposes.
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',

      -- More completion sources
      'hrsh7th/cmp-emoji', -- :shortcodes: -> emoji
      -- 'jcha0713/cmp-tw2css', -- tailwind shorthand -> expanded css

      -- tailwind tools cmp config
      'luckasRanarison/tailwind-tools.nvim',
      'onsails/lspkind-nvim', -- "vscode-like pictograms" for neovim lsp
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },

        -- For an understanding of why these mappings were
        -- chosen, you will need to read `:help ins-completion`
        --
        -- No, but seriously. Please read `:help ins-completion`, it is really good!
        mapping = cmp.mapping.preset.insert {
          -- Select the [n]ext item
          ['<C-n>'] = cmp.mapping.select_next_item(),
          -- Select the [p]revious item
          ['<C-p>'] = cmp.mapping.select_prev_item(),

          -- Scroll the documentation window [b]ack / [f]orward
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),

          -- Accept ([y]es) the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
          ['<C-y>'] = cmp.mapping.confirm { select = true },

          -- If you prefer more traditional completion keymaps,
          -- you can uncomment the following lines
          --['<CR>'] = cmp.mapping.confirm { select = true },
          --['<Tab>'] = cmp.mapping.select_next_item(),
          --['<S-Tab>'] = cmp.mapping.select_prev_item(),

          -- Manually trigger a completion from nvim-cmp.
          --  Generally you don't need this, because nvim-cmp will display
          --  completions whenever it has completion options available.
          ['<C-Space>'] = cmp.mapping.complete {},

          -- Think of <c-l> as moving to the right of your snippet expansion.
          --  So if you have a snippet that's like:
          --  function $name($args)
          --    $body
          --  end
          --
          -- <c-l> will move you to the right of each of the expansion locations.
          -- <c-h> is similar, except moving you backwards.
          ['<C-l>'] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' }),
          ['<C-h>'] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' }),

          -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
          --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        },
        sources = {
          {
            name = 'lazydev',
            -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
            group_index = 0,
          },
          { name = 'nvim_lsp' },
          {
            name = 'luasnip',
            -- priority = 1000,
          },
          { name = 'path' },
          { name = 'emoji' },
          -- { name = 'supermaven' },
          -- { name = 'cmp-tw2css' },
        },

        formatting = {
          expandable_indicator = true, -- req'd
          fields = { 'kind', 'abbr', 'menu' }, -- req'd
          format = require('lspkind').cmp_format {
            -- The function below will be called before any actual modifications from lspkind
            -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
            before = require('tailwind-tools.cmp').lspkind_format,

            -- mode = 'symbol', -- show only symbol annotations
            -- maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            -- ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

            -- let's try something weird
            symbol_map = {
              Boolean = '👍',
              Character = '🔤',
              Class = '🎓',
              Color = '🌈',
              Constant = '🔒',
              Constructor = '🛠',
              Enum = '🔢',
              EnumMember = '🔠',
              Event = '🔔',
              Field = '🌱',
              File = '📄',
              Folder = '📁',
              Function = '🔨',
              Interface = '🔗',
              Keyword = '🔑',
              Method = '🔎',
              Module = '📦',
              Number = '💯',
              Operator = '➕➖',
              Parameter = '📝',
              Property = '🔐',
              Reference = '📚',
              Snippet = '✂️',
              String = '💬',
              Struct = '🏗',
              Text = '📖',
              TypeParameter = '📏',
              Unit = '📏',
              Value = '💰',
              Variable = '🔀',
              Copilot = '✈️',
              Supermaven = '🦸',
            },
          },
        },
      }
    end,
  },

  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- vim.cmd.colorscheme 'tokyonight-night'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'catppuccin/nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      -- vim.cmd.colorscheme 'catppuccin-frappe'
      vim.cmd.colorscheme 'catppuccin-mocha'

      -- You can configure highlights by doing something like:
      vim.cmd.hi 'Comment gui=none'
    end,
    config = function()
      local colors = require('catppuccin.palettes').get_palette()

      require('catppuccin').setup {
        dim_inactive = {
          enabled = false,
          shade = 'dark',
          percentage = 0.15,
        },
        transparent_background = true, -- or else some things (vague, i know) aren't transparent
        term_colors = true, -- TODO wtf this do? trying this
        compile = {
          enabled = true, -- true = faster startup
          path = vim.fn.stdpath 'cache' .. '/catppuccin',
        },
        styles = {
          comments = { 'italic' },
          conditionals = { 'italic' },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
        },
        integrations = {
          treesitter = true,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { 'italic' },
              hints = { 'italic' },
              warnings = { 'italic' },
              information = { 'italic' },
            },
            underlines = {
              errors = { 'underline' },
              hints = { 'underline' },
              warnings = { 'underline' },
              information = { 'underline' },
            },
            inlay_hints = {
              background = true,
            },
          },
          lsp_trouble = true,
          cmp = true,
          lsp_saga = true,
          gitsigns = true,
          leap = false,
          telescope = true,
          -- dap = {
          --   enabled = false,
          --   enable_ui = false,
          -- },
          which_key = true,
          indent_blankline = {
            -- i set these colors manually elsewhere, without using these settings...
            -- which TODO makes me feel like i did it wrong since here we are
            enabled = false,
            colored_indent_levels = false,
          },
          hop = true,
          fidget = true,
          -- rainbow_delimiters = true, -- manually set to sync w/ indent-blankline, not sure this is necessary
          notify = true,
          treesitter_context = true,
          diffview = true,
        },
        color_overrides = {
          -- Related reading
          -- -> Catppuccin styleguide: https://github.com/catppuccin/catppuccin/blob/d7a1918a23fb28e912bfd721eedef0ff452db872/docs/style-guide.md

          -- TODO
          all = {
            -- the default rainbow is too red,
            -- i like this rainbow better:
            rainbow1 = colors.lavender,
            rainbow2 = colors.blue,
            rainbow3 = colors.teal,
            rainbow4 = colors.green,
            rainbow5 = colors.yellow,
            rainbow6 = colors.peach,
            rainbow7 = colors.pink,

            -- example
            --[[ 	text = "#ffffff", ]]
          },
          -- theme-specific tweaks
          --[[ latte = { ]]
          --[[ 	base = "#ff0000", ]]
          --[[ 	mantle = "#242424", ]]
          --[[ 	crust = "#474747", ]]
          --[[ }, ]]
        },
        --
        highlight_overrides = {
          -- TODO
          all = function(colors)
            return {
              -- alias catpuccin's `rainbowX` to indent_blankline's expected colors
              -- IndentBlanklineIndent1 = { fg = colors.rainbow1 },
              -- IndentBlanklineIndent2 = { fg = colors.rainbow2 },
              -- IndentBlanklineIndent3 = { fg = colors.rainbow3 },
              -- IndentBlanklineIndent4 = { fg = colors.rainbow4 },
              -- IndentBlanklineIndent5 = { fg = colors.rainbow5 },
              -- IndentBlanklineIndent6 = { fg = colors.rainbow6 },
              -- IndentBlanklineIndent7 = { fg = colors.rainbow7 },
              -- IblScope = { fg = colors.yellow, bg = colors.yellow },
              -- IndentBlanklineContextChar = { fg = "#ff0000", bg = "#ff0000" },
              --[[ IndentBlanklineContextStart = { ]]
              --[[ 	fg = "#ff0000", ]]
              --[[ 	bg = "#ff0000", ]]
              --[[ 	-- guisp = "#ff0000", ]]
              --[[ 	-- gui = "undercurl", ]]
              --[[ }, ]]

              -- Improved "go to definition" highlighting
              SagaBeacon = { bg = colors.yellow },

              -- the default greay isn't very visible
              CursorLine = { bg = colors.surface0 }, -- row highlight
              CursorColumn = { bg = colors.surface0 }, -- col highlight
              -- TODO styling Cursor doesn't seem to work for me. not sure why.
              --[[ Cursor = { ]]
              --[[ 	bg = catppuccin_flavour.yellow, ]]
              --[[ 	fg = catppuccin_flavour.surface3, ]]
              --[[ }, ]]

              -- fidget.nvim overrides
              FidgetTitle = {
                fg = colors.blue,
              },
              FidgetTask = {
                fg = colors.teal,
              },

              -- nvim-treesitter-context
              TreesitterContext = {
                bg = colors.surface0,
                blend = 20,
              },

              Twilight = {
                fg = colors.lavender,
                blend = 50,
              },

              GitSignsCurrentLineBlame = {
                fg = colors.surface2,
              },
            }
          end,
        },
        --
        -- --[[ custom_highlights = function(colors) ]]
        -- --[[ 	return { ]]
        -- --[[ 		-- Comment = { fg = colors.flamingo }, ]]
        -- --[[ 		-- TabLineSel = { bg = colors.pink }, ]]
        -- --[[ 		-- CmpBorder = { fg = colors.surface2 }, ]]
        -- --[[ 		-- Pmenu = { bg = colors.none }, ]]
        -- --[[]]
        -- --[[ 		-- TODO ]]
        -- --[[ 		-- IndentBlanklineContextChar = { fg = "#ff0000", bg = "#ff0000" }, ]]
        -- --[[ 		IndentBlanklineContextStart = { ]]
        -- --[[ 			fg = "#ff0000", ]]
        -- --[[ 			bg = "#ff0000", ]]
        -- --[[ 			-- guisp = "#ff0000", ]]
        -- --[[ 			-- gui = "undercurl", ]]
        -- --[[ 		}, ]]
        -- --[[ 	} ]]
        -- --[[ end, ]]
      }
    end,
  },

  -- Highlight todo, notes, etc in comments
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      --
      -- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      -- - sd'   - [S]urround [D]elete [']quotes
      -- - sr)'  - [S]urround [R]eplace [)] [']
      require('mini.surround').setup()

      -- Simple and easy statusline.
      --  You could remove this setup call if you don't like it,
      --  and try some other statusline plugin
      local statusline = require 'mini.statusline'

      statusline.setup {
        -- set use_icons to true if you have a Nerd Font
        use_icons = vim.g.have_nerd_font,

        -- content = {
        --   active = function()
        --     return {
        --       '%f', -- File name
        --       '%h%m%r', -- Status flags
        --       '%=', -- Separator for right-aligned content
        --       statusline.section_diagnostics(), -- Diagnostics section
        --       statusline.section_location(), -- Cursor location
        --     }
        --   end,
        -- },
      }

      -- You can configure sections in the statusline by overriding their
      -- default behavior. For example, here we set the section for
      -- cursor location to LINE:COLUMN
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_diagnostics = function()
        local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        local infos = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
        local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })

        -- Define custom highlight groups for diagnostics
        vim.api.nvim_set_hl(0, 'StatuslineDiagnostics', { fg = '#ff0000', bg = '#1e1e1e' }) -- Example colors

        local result = {}
        if errors > 0 then
          -- table.insert(result, '%#LspDiagnosticsError#E:' .. errors .. '%*')
          table.insert(result, '%#StatuslineDiagnostics#E:' .. errors .. '%*')
        end
        if warnings > 0 then
          table.insert(result, 'W:' .. warnings)
        end
        if infos > 0 then
          table.insert(result, 'I:' .. infos)
        end
        if hints > 0 then
          table.insert(result, 'H:' .. hints)
        end

        return table.concat(result, ' ')
      end

      -- Split and join arguments
      -- require('mini.splitjoin').setup {
      --   mappings = {
      --     toggle = 'gS',
      --     split = '',
      --     join = '',
      --   },
      -- }
      -- NOTE: using treesj instead of mini.splitjoin

      -- require('mini.indentscope').setup {}

      -- require('mini.animate').setup {
      --   cursor = {
      --     enable = false,
      --   },
      -- }

      require('mini.diff').setup {
        view = {
          style = nil, -- mostly using this for `:lua MiniDiff.toggle_overlay()`
        },
      }

      -- ... and there is more!
      --  Check out: https://github.com/echasnovski/mini.nvim
    end,
  },

  -- supermaven (copilot)
  {
    'supermaven-inc/supermaven-nvim',
    opts = {
      keymaps = {
        accept_suggestion = '<Tab>',
        -- accept_suggestion = '<C-Enter>',
        clear_suggestion = '<C-]>',
        accept_word = '<C-j>',
      },

      -- color = {
      -- 	suggestion_color = "#ffffff",
      -- 	cterm = 244,
      -- },
      -- disable_inline_completion = true, -- disables inline completion for use with cmp
      -- disable_keymaps = false -- disables built in keymaps for more manual control

      -- Honestly not sure either of these are working,
      -- but that's why i'm also using `ft` to whitelist
      -- condition = function()
      --   return vim.bo.filetype ~= 'env'
      -- end,
      -- ignore_filetypes = { env = true },
    },
    ft = {
      'lua',
      'vim',
      'javascript',
      'typescript',
      'typescriptreact',
      'json',
      'css',
      'scss',
      'html',
      'prisma',
    },
  },

  -- NOTE: don't use with typescript-language-server (this plugin is a replacement)
  {
    'pmizio/typescript-tools.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
    config = function()
      local api = require 'typescript-tools.api'
      require('typescript-tools').setup {
        -- spawn additional tsserver instance to calculate diagnostics on it
        separate_diagnostic_server = true,

        -- "change"|"insert_leave" determine when the client asks the server about diagnostic
        -- publish_diagnostic_on = "insert_leave",

        -- to include all supported code actions specify commands exposed as code_actions
        -- expose_as_code_action = "all",
        expose_as_code_action = {
          'fix_all',
          'add_missing_imports',
          'remove_unused',
          'remove_unused_imports',
          'organize_imports',
        },

        settings = {
          -- https://github.com/microsoft/TypeScript/blob/3b45f4db12bbae97d10f62ec0e2d94858252c5ab/src/server/protocol.ts#L3439
          tsserver_file_preferences = {
            includeInlayParameterNameHints = 'all',
            includeInlayFunctionLikeReturnTypeHints = true,
            -- includeInlayVariableTypeHints = true,
            -- includeInlayPropertyDeclarationTypeHints = true,
            includeInlayEnumMemberValueHints = true,
          },
        },

        handlers = {
          -- NOTE: to filter out diagnostics
          ['textDocument/publishDiagnostics'] = api.filter_diagnostics {
            -- NOTE: not usually helpful when using "use client" to ensure a component can only be used as a client component
            -- 71007, -- TS71007: Props must be serializable for components in the "use client" entry file
            --
            -- 80006 -- TS80006: Could not compile '{0}'.
            -- 2304, -- TS2304: Cannot find name '{0}'.
          },
        },
      }
    end,
  },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
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
            -- TODO add more: https://github.com/nvim-treesitter/nvim-treesitter-textobjects?tab=readme-ov-file#built-in-textobjects
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
    },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },

  -- Syntax-aware text objects, select, move, swap, and peek
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    -- configured in nvim-treesitter
  },

  -- Sets commentstring depending on location of cursor
  {
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
  },

  -- View treesitter information directly in Neovim
  -- :TSPlaygroundToggle
  -- NOTE: how is this different from :InspectTree ?
  {
    'nvim-treesitter/playground',
  },

  -- For splitting and joining lines
  -- NOTE: is this "better enough" than mini.splitjoin ?
  -- NOTE: ^ according to :help mini.splitjoin, treesj...
  -- > Operates based on tree-sitter nodes. This is more accurate in
  -- > some edge cases, but **requires** tree-sitter parser.
  -- > Also doesn't work inside comments or strings (mini.splitjoin does).
  {
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
  },

  -- Treesitter-based context as you scroll through code
  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
      enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
      -- separator = "░", -- Separator between context and content. Should be a single character string, like '-'.
      max_lines = 5, -- How many lines the window should span. Values <= 0 mean no limit.
      trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
      patterns = {
        -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
          'class',
          'function',
          'method',
          'for',
          'while',
          'if',
          'switch',
          'case',
        },
        -- Example for a specific filetype.
        -- If a pattern is missing, *open a PR* so everyone can benefit.
        --   rust = {
        --       'impl_item',
        --   },
      },
      exact_patterns = {
        -- Example for a specific filetype with Lua patterns
        -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
        -- exactly match "impl_item" only)
        -- rust = true,
      },

      -- [!] The options below are exposed but shouldn't require your attention,
      --     you can safely ignore them.

      zindex = 20, -- The Z-index of the context window
      mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
    },
    -- TODO: doesn't load automatically if keys are set (probably just sensible lazy.nvim behavior i think)
    -- keys = {
    --   {
    --     ']c', -- key map
    --     "<cmd>lua require('treesitter-context').go_to_context() <cr>", -- cmd
    --     mode = 'n',
    --     desc = 'Go to context',
    --   },
    -- },
  },

  -- file explorer that lets you edit your filesystem like a normal Neovim buffer
  {
    'stevearc/oil.nvim',
    opts = {
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
      },
    },
    keys = {
      -- run :Oil command
      {
        '<Leader>O', -- key map
        '<cmd>Oil<CR>', -- command
        mode = 'n',
        desc = 'Oil (cwd)',
      },
    },

    -- Optional dependencies
    -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if prefer nvim-web-devicons
  },

  -- Rainbow parens n shit
  {
    'https://gitlab.com/HiPhish/rainbow-delimiters.nvim',
    name = 'rainbow-delimiters',
  },

  -- Guide lines for indents
  -- :help indent_blankline.txt
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    ---@module "ibl"
    ---@type ibl.config
    opts = {
      indent = {},
    },
  },

  -- apply ai suggestions
  -- TODO: seems like this requires rust, would be nice to automate if so
  {
    'yetone/avante.nvim',
    -- commit = '37f0cf1', -- https://github.com/yetone/avante.nvim/commit/a4929104cb857109bdbc9a1cb16400b3fdf67a6c#commitcomment-145906245
    event = 'VeryLazy',
    build = 'make',
    -- build = 'make lua51', -- handles "tiktoken_core is not found!!!!"
    -- build = 'make BUILD_FROM_SOURCE=true luajit', -- handles "tiktoken_core is not found!!!!"
    opts = {
      -- add any opts here
      ---@alias Provider "openai" | "claude" | "azure"  | "copilot" | [string]
      -- provider = 'openai',
      openai = {
        model = 'gpt-4o',
      },
      provider = 'claude',
      claude = {
        endpoint = 'https://api.anthropic.com',
        model = 'claude-3-5-sonnet-20240620',
        temperature = 0,
        max_tokens = 4096,
      },
      mappings = {
        -- ask = '<leader>aa',
        -- edit = '<leader>ae',
        -- refresh = '<leader>ar',
        --- @class AvanteConflictMappings
        diff = {
          ours = '<leader>apo',
          theirs = '<leader>apt',
          both = '<leader>apb',
          next = ']x',
          prev = '[x',
        },
        -- jump = {
        --   next = ']]',
        --   prev = '[[',
        -- },
        -- submit = {
        --   normal = '<CR>',
        --   insert = '<C-s>',
        -- },
        -- toggle = {
        --   debug = '<leader>ad',
        --   hint = '<leader>ah',
        -- },
      },
    },
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- or echasnovski/mini.icons
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      --- The below is optional, make sure to setup it properly if you have lazy=true
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { 'markdown', 'Avante' },
        },
        ft = { 'markdown', 'Avante' },
      },
    },

    -- "Recommended neovim settings"
    -- -- views can only be fully collapsed with the global statusline
    -- vim.opt.laststatus = 3
    -- -- Default splitting will cause your main splits to jump when opening an edgebar.
    -- -- To prevent this, set `splitkeep` to either `screen` or `topline`.
    -- vim.opt.splitkeep = "screen"
  },

  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
    opts = {}, -- NOTE: doesn't seem to work WITHOUT this?
    init = function()
      vim.diagnostic.config {
        -- don't duplicate diagnostic messages with lsp_lines
        virtual_text = false,

        -- virtual_lines = {
        --   -- only_current_line = true,
        -- },

        -- NOTE: keeping here to debug diagnostics as needed
        -- virtual_text = {
        --   source = 'always',
        --   prefix = ' ● ',
        --   format = function(diagnostic)
        --     return string.format('%s %s %s', diagnostic.source, diagnostic.code, diagnostic.message)
        --     -- return string.format('%s %s', diagnostic.source, diagnostic.message)
        --   end,
        -- },
      }
    end,
    lazy = false, -- keys forces lazy loading by default
    keys = {
      {
        '<Leader>tl',
        function()
          require('lsp_lines').toggle()
        end,
        mode = 'n',
        desc = 'Toggle [l]sp_lines',
      },
    },
  },

  {
    'b0o/incline.nvim',
    config = function()
      require('incline').setup {}

      local colors = require('catppuccin.palettes').get_palette()

      vim.api.nvim_set_hl(0, 'InclineNormal', {
        bg = colors.crust,
        fg = colors.lavender,
      })
    end,
    -- Optional: Lazy load Incline
    event = 'VeryLazy',
  },

  {
    'luckasRanarison/tailwind-tools.nvim',
    name = 'tailwind-tools',
    build = ':UpdateRemotePlugins',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim', -- optional
      'neovim/nvim-lspconfig', -- optional
    },
    ---@type TailwindTools.Option
    opts = {
      cmp = {
        highlight = 'background', -- color preview style, "foreground" | "background"
      },
    },
    -- init = function()
    --   -- NOTE: run `TailwindSort` on save
    --   -- like https://github.com/tailwindlabs/prettier-plugin-tailwindcss
    --   -- but without the plugin
    --   vim.api.nvim_create_autocmd('BufWritePre', {
    --     buffer = 0,
    --     command = 'TailwindSort',
    --   })
    -- end,
    init = function()
      -- NOTE: run `TailwindSort` on save only if Tailwind LSP is active
      vim.api.nvim_create_autocmd('BufWritePre', {
        callback = function()
          local clients = vim.lsp.get_active_clients { bufnr = 0 }
          for _, client in ipairs(clients) do
            if client.name == 'tailwindcss' then
              vim.cmd 'TailwindSort'
              return
            end
          end
        end,
      })
    end,
  },

  -- TODO: see if i find this useful
  {
    'sindrets/diffview.nvim',
  },

  {
    'pwntester/octo.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      -- OR 'ibhagwan/fzf-lua',
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      -- https://github.com/pwntester/octo.nvim/blob/fd50872494abd1cb580c604f1f52aae2257f7220/README.md?plain=1#L499
      suppress_missing_scope = {
        projects_v2 = true,
      },
    },
  },

  {
    'piersolenski/wtf.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
    opts = {},
    -- keys = {
    -- 	{
    -- 		"<leader>wa",
    -- 		mode = { "n", "x" },
    -- 		function()
    -- 			require("wtf").ai()
    -- 		end,
    -- 		desc = "Debug diagnostic with AI",
    -- 	},
    -- 	{
    -- 		mode = { "n" },
    -- 		"<leader>ws",
    -- 		function()
    -- 			require("wtf").search()
    -- 		end,
    -- 		desc = "Search diagnostic with Google",
    -- 	},
    -- 	{
    -- 		mode = { "n" },
    -- 		"<leader>wh",
    -- 		function()
    -- 			require("wtf").history()
    -- 		end,
    -- 		desc = "Populate the quickfix list with previous chat history",
    -- 	},
    -- 	{
    -- 		mode = { "n" },
    -- 		"<leader>wg",
    -- 		function()
    -- 			require("wtf").grep_history()
    -- 		end,
    -- 		desc = "Grep previous chat history with Telescope",
    -- 	},
    -- },
  },

  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',

    -- TODO: verify that these bindings aren't conflicting, i just pasted them from the readme
    keys = {
      {
        '<leader>Td',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      -- {
      --   '<leader>xX',
      --   '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      --   desc = 'Buffer Diagnostics (Trouble)',
      -- },
      -- {
      --   '<leader>cs',
      --   '<cmd>Trouble symbols toggle focus=false<cr>',
      --   desc = 'Symbols (Trouble)',
      -- },
      -- {
      --   '<leader>cl',
      --   '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
      --   desc = 'LSP Definitions / references / ... (Trouble)',
      -- },
      -- {
      --   '<leader>xL',
      --   '<cmd>Trouble loclist toggle<cr>',
      --   desc = 'Location List (Trouble)',
      -- },
      {
        -- '<leader>xQ',
        '<leader>Tq',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix list (Trouble)',
      },
    },
  },

  {
    'folke/zen-mode.nvim',
    opts = {
      -- this will change the font size on kitty when in zen mode
      -- to make this work, you need to set the following kitty options:
      -- - allow_remote_control socket-only
      -- - listen_on unix:/tmp/kitty
      kitty = {
        enabled = false,
        font = '+4', -- font size increment
      },
    },
    keys = {
      {
        '<leader>Z',
        '<cmd>ZenMode<cr>',
        desc = 'Zen mode 🪷',
      },
    },
  },

  -- More text objects \o/
  {
    'chrisgrieser/nvim-various-textobjs',
    event = 'UIEnter',
    opts = {
      useDefaultKeymaps = true, -- NOTE: did not verify if this conflicts with other keymaps
    },
  },

  -- [f]ind [a]nd [r]eplace
  {
    'MagicDuck/grug-far.nvim',
    config = function()
      require('grug-far').setup {
        -- options, see Configuration section below
        -- there are no required options atm
        -- engine = 'ripgrep' is default, but 'astgrep' can be specified
      }
    end,
  },

  -- Improve git habits
  -- {
  --   'm4xshen/hardtime.nvim',
  --   dependencies = { 'MunifTanjim/nui.nvim', 'nvim-lua/plenary.nvim' },
  --   opts = {
  --     max_count = 20, -- lol
  --     disable_mouse = false,
  --   },
  -- },

  -- yank history
  {
    'ptdewey/yankbank-nvim',
    config = function()
      require('yankbank').setup()
    end,
  },

  {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup {}
    end,
  },

  {
    'jake-stewart/multicursor.nvim',
    branch = '1.0',
    config = function()
      local mc = require 'multicursor-nvim'

      mc.setup()

      -- Add cursors above/below the main cursor.
      -- vim.keymap.set({ 'n', 'v' }, '<up>', function()
      --   mc.addCursor 'k'
      -- end)
      -- vim.keymap.set({ 'n', 'v' }, '<down>', function()
      --   mc.addCursor 'j'
      -- end)

      -- Add a cursor and jump to the next word under cursor.
      vim.keymap.set({ 'n', 'v' }, '<c-n>', function()
        mc.addCursor '*'
      end)

      -- Jump to the next word under cursor but do not add a cursor.
      vim.keymap.set({ 'n', 'v' }, '<c-s>', function()
        mc.skipCursor '*'
      end)

      -- Rotate the main cursor.
      vim.keymap.set({ 'n', 'v' }, '<left>', mc.nextCursor)
      vim.keymap.set({ 'n', 'v' }, '<right>', mc.prevCursor)

      -- Delete the main cursor.
      vim.keymap.set({ 'n', 'v' }, '<leader>x', mc.deleteCursor)

      -- Add and remove cursors with control + left click.
      vim.keymap.set('n', '<c-leftmouse>', mc.handleMouse)

      -- vim.keymap.set({ 'n', 'v' }, '<c-q>', function()
      --   if mc.cursorsEnabled() then
      --     -- Stop other cursors from moving.
      --     -- This allows you to reposition the main cursor.
      --     mc.disableCursors()
      --   else
      --     mc.addCursor()
      --   end
      -- end)

      -- vim.keymap.set('n', '<esc>', function()
      vim.keymap.set('n', '<c-q>', function() -- esc conflicts with highlight clear
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        elseif mc.hasCursors() then
          mc.clearCursors()
        else
          -- Default <esc> handler.
        end
      end)

      -- Align cursor columns.
      vim.keymap.set('n', '<leader>a', mc.alignCursors)

      -- Split visual selections by regex.
      vim.keymap.set('v', 'S', mc.splitCursors)

      -- Append/insert for each line of visual selections.
      vim.keymap.set('v', 'I', mc.insertVisual)
      vim.keymap.set('v', 'A', mc.appendVisual)

      -- match new cursors within visual selections by regex.
      vim.keymap.set('v', 'M', mc.matchCursors)

      -- Rotate visual selection contents.
      vim.keymap.set('v', '<leader>t', function()
        mc.transposeCursors(1)
      end)
      vim.keymap.set('v', '<leader>T', function()
        mc.transposeCursors(-1)
      end)

      -- Customize how cursors look.
      vim.api.nvim_set_hl(0, 'MultiCursorCursor', { link = 'Cursor' })
      vim.api.nvim_set_hl(0, 'MultiCursorVisual', { link = 'Visual' })
      vim.api.nvim_set_hl(0, 'MultiCursorDisabledCursor', { link = 'Visual' })
      vim.api.nvim_set_hl(0, 'MultiCursorDisabledVisual', { link = 'Visual' })
    end,
  },

  -- Oil-like quickfix list management
  {
    'blanktiger/aqf.nvim',
    config = function()
      require('aqf').setup()
      local telescope = require 'telescope'
      telescope.load_extension 'aqf'
    end,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
  },

  -- Smarter and more intuitive split pane management that uses a mental model
  -- of left/right/up/down instead of wider/narrower/taller/shorter for resizing.
  -- Supports seamless navigation between Neovim and terminal multiplexer split panes
  -- { 'mrjones2014/smart-splits.nvim' },

  -- TODO: see if this is valuable - it basically
  -- "compiles" all the tailwind so you can see the resulting
  -- css for all classes applied to a given element.
  -- https://github.com/MaximilianLloyd/tw-values.nvim

  -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
  -- init.lua. If you want these files, they are in the repository, so you can just download them and
  -- place them in the correct locations.

  -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
  --
  --  Here are some example plugins that I've included in the Kickstart repository.
  --  Uncomment any of the lines below to enable them (you will need to restart nvim).
  --
  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  require 'kickstart.plugins.lint',
  require 'kickstart.plugins.autopairs',
  -- require 'kickstart.plugins.neo-tree',
  require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    This is the easiest way to modularize your config.
  --
  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
  -- { import = 'custom.plugins' },
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

-- Configuration for nvim-ts-context-commentstring with native neovim commenting
local get_option = vim.filetype.get_option
vim.filetype.get_option = function(filetype, option)
  return option == 'commentstring' and require('ts_context_commentstring.internal').calculate_commentstring() or get_option(filetype, option)
end

-- Configuration for indent-blankline, syncs with rainbow-delimiters
local highlight = {
  'RainbowRed',
  'RainbowYellow',
  'RainbowBlue',
  'RainbowOrange',
  'RainbowGreen',
  'RainbowViolet',
  'RainbowCyan',
}
local hooks = require 'ibl.hooks'
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  local colors = require('catppuccin.palettes').get_palette()
  -- vim.api.nvim_set_hl(0, 'RainbowRed', { fg = colors.red })
  -- NOTE: ^ Red feels error-y in the code, so let's use pink instead
  vim.api.nvim_set_hl(0, 'RainbowRed', { fg = colors.pink })
  vim.api.nvim_set_hl(0, 'RainbowYellow', { fg = colors.yellow })
  vim.api.nvim_set_hl(0, 'RainbowBlue', { fg = colors.blue })
  vim.api.nvim_set_hl(0, 'RainbowOrange', { fg = colors.peach })
  vim.api.nvim_set_hl(0, 'RainbowGreen', { fg = colors.green })
  vim.api.nvim_set_hl(0, 'RainbowViolet', { fg = colors.lavender })
  vim.api.nvim_set_hl(0, 'RainbowCyan', { fg = colors.teal })
end)
vim.g.rainbow_delimiters = { highlight = highlight }
require('ibl').setup { scope = { highlight = highlight } }
hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

-- TODO: aka OPEN ISSUES and ROOM FOR IMPROVEMENTS
--
-- ISSUE: 2024-08-25 - Seems like treesitter's JSX parsing is a bit wonky.
--  - This is noticeable with how indent-blankline highlighting shows up in JSX.
--  - This is noticeable when trying to do certain movements/selections in JSX.
--  LOOKS RELATED: https://github.com/tree-sitter/tree-sitter-javascript/issues/329
--  - Probably fixed when version >= v0.21.5 (current is v0.21.4)
