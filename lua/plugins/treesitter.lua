return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = { "lua", "vim", "javascript", "typescript", "ruby", "java" },
      sync_install = false,
      auto_install = true,

      indent = { enable = true },

      highlight = {
        enable = true,
        -- Enable extra regex highlighting only for Java to avoid annotation-related glitches
        additional_vim_regex_highlighting = true,
      },
    }
  end,
}
