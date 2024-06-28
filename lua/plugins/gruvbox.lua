return {
  "ellisonleao/gruvbox.nvim",
  priority = 10000,
  config = function()
    require("gruvbox").setup()

    vim.cmd("colorscheme gruvbox")
  end,
}
