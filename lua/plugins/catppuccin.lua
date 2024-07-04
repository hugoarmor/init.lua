return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function(something)
    print(something)
    require("catppuccin").setup({
      no_italic = false,    -- Force no italic
      no_bold = false,      -- Force no bold
      no_underline = false, -- Force no underline

      dim_inactive = {
        enabled = false,   -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },

      transparent_background = true,

      styles = {                 -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = {},
        loops = {},
        functions = {},
        keywords = { "bold" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = { "bold" },
        properties = {},
        types = { "italic", "bold" },
        operators = {},
      },

      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
      },
    })

    vim.cmd.colorscheme("catppuccin-mocha")
  end,
  enabled = true
}
