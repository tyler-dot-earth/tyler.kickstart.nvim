vim.diagnostic.config {
  -- false because i prefer virtual_lines
  virtual_text = false,

  virtual_lines = {
    -- show only the current line
    current_line = true,

    -- show on all lines
    -- virtual_lines = true,
  },

  -- underline = { severity = vim.diagnostic.severity.ERROR },
  underline = true, -- pairs well with virutal_lines

  -- Diagnostic sign tweaks
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '🔴',
      [vim.diagnostic.severity.WARN] = '🟠',
      [vim.diagnostic.severity.INFO] = '🔵',
      [vim.diagnostic.severity.HINT] = '⚪',
    },
  },
}
