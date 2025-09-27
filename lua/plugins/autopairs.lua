return {
  {
    "cohama/lexima.vim",
    config = function()
      vim.g.lexima_enable_basic_rules = 1
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  }
}
