return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "clangd",
          "dockerls",
          "elixirls",
          "gopls",
          "pyright",
          "tsserver",
          "tailwindcss",
          "yamlls",
          "solargraph",
        },
        automatic_installation = true,
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,
      })

      require("lspconfig").tsserver.setup({})

      -- Define Gruvbox color palette
      local gruvbox_colors = {
        bg_dark = "#282828",
        bg_light = "#3c3836",
        fg_light = "#ebdbb2",
        yellow = "#fabd2f",
        red = "#fb4934",
        green = "#b8bb26",
        blue = "#83a598",
      }

      -- Customizing diagnostics
      vim.diagnostic.config({
        update_in_insert = true,
        virtual_text = {
          prefix = "●", -- You can use a different prefix symbol if desired
          spacing = 4,
        },
        signs = true,
        underline = true,
        severity_sort = true,
        float = {
          source = "always", -- Or "if_many"
          border = "none",
        },
      })

      -- Key mappings for diagnostics
      vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", {})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
