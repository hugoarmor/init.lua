return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    require("telescope").setup({
      extensions = {
        fzf = {},
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
      defaults = {
        prompt_prefix = "   ",
        selection_caret = " ",
        entry_prefix = " ",
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
          },
          width = 0.87,
          height = 0.80,
        },
        mappings = {
          n = { ["q"] = require("telescope.actions").close },
        },
      },
      pickers = {
        colorscheme = {
          enable_preview = true,
        },
        find_files = {
          border = false,
        },
      },
    })

    local function set_telescope_colors()
      local TelescopeColor = {
        TelescopeMatching = { fg = "#fabd2f" }, -- Gruvbox yellow
        TelescopeSelection = { fg = "#ebdbb2", bg = "#3c3836", bold = true },

        TelescopePromptPrefix = { bg = "#3c3836" },
        TelescopePromptNormal = { bg = "#3c3836" },
        TelescopeResultsNormal = { bg = "#32302f" },
        TelescopePreviewNormal = { bg = "#32302f" },
        TelescopePromptBorder = { bg = "#3c3836", fg = "#3c3836" },
        TelescopeResultsBorder = { bg = "#32302f", fg = "#32302f" },
        TelescopePreviewBorder = { bg = "#32302f", fg = "#32302f" },
        TelescopePromptTitle = { bg = "#fb4934", fg = "#282828" },
        TelescopeResultsTitle = { fg = "#32302f" },
        TelescopePreviewTitle = { bg = "#b8bb26", fg = "#282828" },
      }

      for hl, col in pairs(TelescopeColor) do
        vim.api.nvim_set_hl(0, hl, col)
      end
    end

    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        set_telescope_colors()
      end,
    })

    set_telescope_colors()

    pcall(require("telescope").load_extension, "fzf")
    pcall(require("telescope").load_extension, "ui-select")
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<leader>ff", builtin.git_files)
    vim.keymap.set("n", "<C-p>", builtin.find_files)
    vim.keymap.set("n", "<leader>fg", builtin.live_grep)
    vim.keymap.set("n", "<leader>fb", builtin.buffers)
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics)
    vim.keymap.set("n", "<space>/", builtin.current_buffer_fuzzy_find)
    vim.keymap.set("n", "<leader>?", builtin.oldfiles)
    vim.keymap.set("n", "<leader>gr", builtin.lsp_references)
  end,
}
