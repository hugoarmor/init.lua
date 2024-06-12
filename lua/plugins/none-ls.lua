return { 
  "nvimtools/none-ls.nvim", 
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.prettier.with({
          filetypes = {
            "css",
            "graphql",
            "html",
            "javascript",
            "javascriptreact",
            "json",
            "less",
            "markdown",
            "scss",
            "typescript",
            "typescriptreact",
            "yaml",
          },
        }),
        null_ls.builtins.formatting.rubocop,
        null_ls.builtins.diagnostics.rubocop,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.formatting.golines,
      },
    })

    vim.keymap.set("n", "<leader>fm", function()
      vim.lsp.buf.format({ async = true })
    end)
  end
}

