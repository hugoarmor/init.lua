return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",   -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    -- config neo-tree to open fullscreen and close itself when selecting a filer
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {
            "node_modules"
          },
          never_show = {
            ".DS_Store",
            "thumbs.db"
          },
        },
        follow_current_file = true,
      },
      window = {
        position = "current"
      }
    })

    vim.keymap.set({ "n" }, "-", ":Neotree position=current toggle<cr>", { desc = "Toggle neotree" })
  end
}
