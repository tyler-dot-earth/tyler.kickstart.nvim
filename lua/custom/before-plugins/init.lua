local settings_dir = vim.fn.stdpath 'config' .. '/lua/custom/before-plugins'

for _, file in ipairs(vim.fn.glob(settings_dir .. '/*.lua', true, true)) do
  if not file:match 'init.lua$' then
    local mod = file:match('.*/lua/(.*)%.lua$'):gsub('/', '.')
    local ok, err = pcall(require, mod)
    if not ok then
      vim.notify('Error loading ' .. mod .. '\n\n' .. err, vim.log.levels.ERROR)
    end
  end
end
