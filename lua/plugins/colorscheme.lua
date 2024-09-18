return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = "medium" -- Choose 'soft', 'medium', or 'hard'
      vim.g.gruvbox_material_foreground = "material" -- Options: 'material', 'mix', 'original'
      vim.g.gruvbox_material_better_performance = 1 -- Enable for faster performance
      vim.g.gruvbox_material_transparent_background = 2

      vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#fb4934" })           -- Red for errors
      vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#fabd2f" })            -- Yellow for warnings
      vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#fb4934" })       -- Red for error signs
      vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#fabd2f" })        -- Yellow for warning signs
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#fb4934" }) -- Red for virtual text errors
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#fabd2f" }) -- Yellow for virtual text warnings
      vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultError", { fg = "#fb4934" }) -- LSP error override
      vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultWarning", { fg = "#fabd2f" }) -- LSP warning override

      -- Set the Gruvbox Material colorscheme
      vim.cmd("colorscheme gruvbox-material")
    end,
  },
}
