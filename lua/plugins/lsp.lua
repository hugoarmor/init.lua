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
      auto_install = true, },
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
          -- if tsserver, ignore
          if server_name == "tsserver" then
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
              init_options = {
                preferences = {
                  importModuleSpecifier = "non-relative",
                },
              },
            })
            return
          end

          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,
      })

      require("lspconfig").tsserver.setup({})

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

      vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", {})

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
