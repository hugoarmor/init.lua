return {
  {
    "onsails/lspkind.nvim",
  },
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Define Gruvbox color palette
      local gruvbox_colors = {
        bg_dark = "#282828",
        bg_light = "#3c3836",
        fg_light = "#ebdbb2",
        yellow = "#d8a657",
        red = "#ea6962",
        green = "#a9b665",
        blue = "#7daea3",
        aqua = "#89b482",
        orange = "#e78a4e",
        purple = "#d3869b",
      }

      -- Set up cmp_kinds icons
      local cmp_kinds = {
        Text = "  ",
        Method = "  ",
        Function = "  ",
        Constructor = "  ",
        Field = "  ",
        Variable = "  ",
        Class = "  ",
        Interface = "  ",
        Module = "  ",
        Property = "  ",
        Unit = "  ",
        Value = "  ",
        Enum = "  ",
        Keyword = "  ",
        Snippet = "  ",
        Color = "  ",
        File = "  ",
        Reference = "  ",
        Folder = "  ",
        EnumMember = "  ",
        Constant = "  ",
        Struct = "  ",
        Event = "  ",
        Operator = "  ",
        TypeParameter = "  ",
      }

      -- Setup nvim-cmp with Gruvbox colors applied to completion and documentation windows
      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-k>"] = cmp.mapping.select_prev_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete({}),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp",
            entry_filter = function(entry, ctx)
              local kind = entry:get_kind()
              if kind == cmp.lsp.CompletionItemKind.Text then
                return false
              end
              return true
            end
            , priority = 1000 },
          { name = "luasnip",  priority = 750 }, -- For luasnip users.
        }, {
          { name = "buffer" },
        }),
        window = {
          completion = cmp.config.window.bordered({
            border = "none",
            winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:CmpPmenuSel,Search:None",
            side_padding = 0,
          }),
          documentation = cmp.config.window.bordered({
            winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:CmpPmenuSel,Search:None",
            side_padding = 2,
          }),
        },
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            local vim_item_kind = vim_item.kind or "Text"
            local kind =
                require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)

            -- Set the kind and menu
            kind.kind = " " .. (cmp_kinds[vim_item_kind] or cmp_kinds.Text)

            -- Use the entry's source name for the menu
            kind.menu = " (" .. (vim_item_kind or "Text") .. ")"

            -- Apply the background color directly using highlight groups
            local kind_bg_colors = {
              Text = gruvbox_colors.green,
              Method = gruvbox_colors.green,
              Function = gruvbox_colors.purple,
              Constructor = gruvbox_colors.blue,
              Field = gruvbox_colors.blue,
              Variable = gruvbox_colors.blue,
              Class = gruvbox_colors.yellow,
              Interface = gruvbox_colors.yellow,
              Module = gruvbox_colors.green,
              Property = gruvbox_colors.blue,
              Unit = gruvbox_colors.blue,
              Value = gruvbox_colors.yellow,
              Enum = gruvbox_colors.yellow,
              Keyword = gruvbox_colors.red,
              Snippet = gruvbox_colors.aqua,
              Color = gruvbox_colors.blue,
              File = gruvbox_colors.bg_light,
              Reference = gruvbox_colors.bg_light,
              Folder = gruvbox_colors.bg_light,
              EnumMember = gruvbox_colors.blue,
              Constant = gruvbox_colors.yellow,
              Struct = gruvbox_colors.green,
              Event = gruvbox_colors.red,
              Operator = gruvbox_colors.red,
              TypeParameter = gruvbox_colors.blue,
            }

            -- Set the highlight group for the kind
            local bg_color = kind_bg_colors[vim_item_kind] or gruvbox_colors.green
            vim.api.nvim_set_hl(
              0,
              "CmpItemKind" .. vim_item_kind,
              { bg = bg_color, fg = gruvbox_colors.bg_light }
            )

            return kind
          end,
        },
      })

      -- Define custom highlight groups for the Gruvbox colors
      vim.api.nvim_set_hl(0, "CmpPmenu", { bg = gruvbox_colors.bg_light, fg = gruvbox_colors.fg_light })
      vim.api.nvim_set_hl(0, "CmpPmenuSel", { bg = gruvbox_colors.aqua, fg = gruvbox_colors.bg_dark })
      vim.api.nvim_set_hl(0, "CmpPmenuBorder", { bg = gruvbox_colors.bg_light, fg = gruvbox_colors.bg_light })
    end,
  },
}
