return {
  'ravitemer/mcphub.nvim',

  opts = {
    extensions = {
      avante = {
        make_slash_commands = true, -- make /slash commands from MCP server prompts
      },
    },
  },

  config = function(_, opts)
    -- vim.notify(vim.inspect(opts))

    local uname = vim.loop.os_uname()
    local platform = uname.sysname:lower()

    local function run_install(cmd, label)
      vim.notify('Installing ' .. label .. '...', vim.log.levels.INFO)

      -- run as shell command so pipes work
      local output = vim.fn.system(cmd)
      local success = vim.v.shell_error == 0

      if success then
        vim.notify(label .. ' installed successfully', vim.log.levels.INFO)
      else
        vim.notify(label .. ' install failed:\n' .. output, vim.log.levels.ERROR)
      end
    end

    -- mcp-hub install if missing
    if vim.fn.executable 'mcp-hub' == 0 then
      run_install({ 'npm', 'install', '-g', 'mcp-hub' }, 'mcp-hub')
    end

    -- uv install if missing
    if vim.fn.executable 'uv' == 0 then
      local uname = vim.loop.os_uname()
      local platform = uname.sysname:lower()

      if platform == 'darwin' or platform == 'linux' then
        run_install('curl -sSfL https://astral.sh/uv/install.sh | sh', 'uv')
      else
        vim.notify('Please install uv manually: https://docs.astral.sh/uv/', vim.log.levels.WARN)
      end
    end

    -- python (mac/linux)
    if vim.fn.executable 'python' == 0 then
      if vim.fn.executable 'python3' == 1 then
        -- create symlink python → python3
        local python3 = vim.fn.system('which python3'):gsub('%s+', '')
        local python = vim.fn.fnamemodify(python3, ':h') .. '/python'
        os.execute('ln -sfn ' .. python3 .. ' ' .. python)
        vim.notify('Symlinked python → python3', vim.log.levels.INFO)
      elseif platform == 'darwin' and vim.fn.executable 'brew' == 1 then
        run_install('brew install python', 'python (via Homebrew)')
      -- elseif platform == 'linux' and vim.fn.executable 'apt' == 1 then
      --   run_install('sudo apt update && sudo apt install -y python3 && sudo ln -s $(which python3) /usr/local/bin/python', 'python (via apt)')
      else
        vim.notify('Python not found. Please install manually.', vim.log.levels.WARN)
      end
    end

    vim.fn.system { 'uvx', '--version' }

    require('mcphub').setup(opts)
  end,
}
