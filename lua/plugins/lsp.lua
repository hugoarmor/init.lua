return {
  {
    "nvim-java/nvim-java",
    lazy = false,
  },
  {
    "williamboman/mason.nvim",
    lazy = false,
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
      require("java").setup({
        java_debug_adapter = {
          enable = false,
        },
        notifications = {
          dap = false,
        },
      })
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "clangd",
          "dockerls",
          "elixirls",
          "gopls",
          "pyright",
          "tailwindcss",
          "yamlls",
          "jsonls",
        },
        automatic_installation = true,
      })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Function to auto-detect Poetry virtual environment
      local function get_poetry_venv()
        local handle = io.popen("poetry env info --path 2>/dev/null")
        if handle then
          local venv_path = handle:read("*a"):gsub("\n", "")
          handle:close()
          if venv_path and venv_path ~= "" then
            return venv_path .. "/bin/python"
          end
        end
        return nil
      end

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          return require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,
      })

      local poetry_python = get_poetry_venv() or "python"
      vim.keymap.set("n", "<leader>l", ":PyrightSetPythonPath " .. poetry_python .. "<CR>")

      -- Customizing diagnostics
      vim.diagnostic.config({
        update_in_insert = true,
        virtual_text = {
          prefix = "●", -- Custom prefix
          spacing = 4,
        },
        signs = true,
        underline = true,
        severity_sort = true,
        float = {
          source = "always", -- Always show source of the diagnostic
          border = "none",
        },
      })

      -- Key mappings for LSP and diagnostics
      vim.api.nvim_set_keymap("n", "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", {})
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})

      -- Highlighting diagnostic messages
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#fb4934", bg = "NONE", bold = true })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#fabd2f", bg = "NONE", bold = true })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#83a598", bg = "NONE", bold = true })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#8ec07c", bg = "NONE", bold = true })

      -- Disable LSP semantic tokens for jdtls to avoid highlight conflicts with Treesitter
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("DisableJdtlsSemanticTokens", { clear = true }),
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client and client.name == "jdtls" then
            client.server_capabilities.semanticTokensProvider = nil
          end
        end,
      })
    end,
  },
}
