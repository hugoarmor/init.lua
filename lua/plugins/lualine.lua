return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lsp = {
      function()
        local msg = "no lsp"
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          if client.name == "null-ls" then
            goto continue
          end
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
          ::continue::
        end
        return msg
      end,
      icon = "\u{f473} ",
      color = { gui = "bold" },
    }

    local function relative_filepath()
      local filepath = vim.fn.expand("%:p")
      local oil_prefix = "oil://"
      if filepath:sub(1, #oil_prefix) == oil_prefix then
        filepath = filepath:sub(#oil_prefix + 1)
        return filepath
      end

      local git_root = vim.fn.systemlist("git -C " .. vim.fn.fnamemodify(filepath, ":h") .. " rev-parse --show-toplevel")
          [1]
      if vim.v.shell_error == 0 and git_root ~= "" then
        return filepath:sub(#git_root + 2)
      else
        local home = vim.fn.expand("~")
        if filepath:sub(1, #home) == home then
          return "~" .. filepath:sub(#home + 1)
        else
          return filepath
        end
      end
    end

    require("lualine").setup({
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { relative_filepath },
        lualine_x = {
          lsp,
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    })
  end,
}
