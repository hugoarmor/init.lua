return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local colors = {
      blue = "#7daea3",
      cyan = "#89b482",
      black = "#282828",
      white = "#ddc7a1",
      red = "#ea6962",
      violet = "#d3869b",
      grey = "#45403d",
    }

    local gruvbox_material_theme = {
      normal = {
        a = { fg = colors.black, bg = colors.violet },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.white },
      },

      insert = { a = { fg = colors.black, bg = colors.blue } },
      visual = { a = { fg = colors.black, bg = colors.cyan } },
      replace = { a = { fg = colors.black, bg = colors.red } },

      inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.white },
      },
    }

    require("lualine").setup({
      options = {
        theme = gruvbox_material_theme,
        component_separators = "",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            separator = { left = "" },
            padding = { left = 0, right = 1 },
            color = { gui = "bold" },
          },
        },
        lualine_b = {
          {
            "filetype",
            icon_only = true,
            colored = true,
            padding = { left = 2, right = 0 },
            separator = "",
          },
          {
            "filename",
            path = 1,
            color = { gui = "bold" },
            padding = { left = 0, right = 1 },
          },
        },
        lualine_c = {
          "%=",
        },
        lualine_x = {},
        lualine_y = { "diagnostics", { "branch", icon = "" } },
        lualine_z = {
          { "progress", separator = { right = "" }, padding = { left = 1, right = 0 } },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
      tabline = {},
      extensions = {},
    })
  end,
}
