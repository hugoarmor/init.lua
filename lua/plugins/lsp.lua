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

      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.rust_analyzer.setup({
        capabilities = capabilities,
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
      })
      lspconfig.yamlls.setup({
        capabilities = capabilities,
      })
      lspconfig.gopls.setup({
        capabilities = capabilities,
      })
      lspconfig.pyright.setup({
        capabilities = capabilities,
      })
      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
      })
      lspconfig.vale_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.elixirls.setup({
        capabilities = capabilities,
      })
      lspconfig.solargraph.setup({
        capabilities = capabilities,
      })

      vim.diagnostic.config({
        update_in_insert = true,
        virtual_text = true,
        signs = true,
        underline = true,
        severity_sort = true,
        float = {
          source = "always", -- Or "if_many"
          border = "rounded",
        },
      })

      vim.api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", {})

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
