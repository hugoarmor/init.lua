return {
  {
    "sindrets/diffview.nvim",
    config = function()
      require("diffview").setup()

      vim.keymap.set("n", "<leader>gd", function()
        if next(require("diffview.lib").views) == nil then
          vim.cmd("DiffviewOpen")
        else
          vim.cmd("DiffviewClose")
        end
      end)
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    config = function()
      require("gitsigns").setup()
    end,
  },
  {
    "f-person/git-blame.nvim",
    config = function()
      require("gitblame").setup()
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
}
