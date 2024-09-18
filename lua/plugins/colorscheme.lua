return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,    -- Load it immediately
    priority = 1000, -- Ensure it loads early
    config = function()

      -- Optional: Customize the gruvbox-material settings here
      -- Example settings:
      vim.g.gruvbox_material_background = 'medium'   -- Choose 'soft', 'medium', or 'hard'
      vim.g.gruvbox_material_foreground = 'material' -- Options: 'material', 'mix', 'original'
      vim.g.gruvbox_material_better_performance = 1  -- Enable for faster performance
      vim.g.gruvbox_material_transparent_background = 2

      vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#fb4934" })  -- Red for errors
      vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#fabd2f" })  -- Yellow for warnings
      vim.api.nvim_set_hl(0, "DiagnosticSignError", { fg = "#fb4934" })  -- Red for error signs
      vim.api.nvim_set_hl(0, "DiagnosticSignWarn", { fg = "#fabd2f" })  -- Yellow for warning signs
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#fb4934" })  -- Red for virtual text errors
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#fabd2f" })  -- Yellow for virtual text warnings
      vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultError", { fg = "#fb4934" })  -- LSP error override
      vim.api.nvim_set_hl(0, "LspDiagnosticsDefaultWarning", { fg = "#fabd2f" })  -- LSP warning override

      -- Set the Gruvbox Material colorscheme
      vim.cmd("colorscheme gruvbox-material")
    end,
  },
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   config = function()
  --     require("gruvbox").setup({
  --       terminal_colors = true, -- add neovim terminal colors
  --       undercurl = true,
  --       underline = true,
  --       cursorline = false,
  --       bold = true,
  --       italic = {
  --         strings = true,
  --         emphasis = true,
  --         comments = true,
  --         operators = false,
  --         folds = true,
  --       },
  --       strikethrough = false,
  --       invert_selection = false,
  --       invert_signs = false,
  --       invert_tabline = false,
  --       invert_intend_guides = false,
  --       inverse = true, -- invert background for search, diffs, statuslines and errors
  --       contrast = "",  -- can be "hard", "soft" or empty string
  --       palette_overrides = {},
  --       overrides = {},
  --       dim_inactive = false,
  --       transparent_mode = true,
  --     })
  --
  --     vim.cmd.colorscheme("gruvbox")
  --     -- Override the gutter colors
  --     vim.cmd([[highlight SignColumn guibg=NONE]])
  --     vim.cmd([[highlight LineNr guibg=NONE]])
  --
  --     vim.cmd([[highlight LspReferenceText guibg=#3c3836 guifg=NONE]])
  --     vim.cmd([[highlight LspReferenceRead guibg=#3c3836 guifg=NONE]])
  --     vim.cmd([[highlight LspReferenceWrite guibg=#3c3836 guifg=NONE]])
  --   end,
  -- },
}
