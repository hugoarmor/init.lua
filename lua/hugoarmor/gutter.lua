vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "\u{ea87}",  -- U+EA87 or your preferred glyph
      [vim.diagnostic.severity.WARN]  = "",  -- Customize or leave "" for no icon
      [vim.diagnostic.severity.INFO]  = "",
      [vim.diagnostic.severity.HINT]  = "",
    },
  }
})
