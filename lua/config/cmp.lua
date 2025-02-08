return function()
  local cmp = require "cmp"

  local function border(hl_name)
    return {
      { "╭", hl_name },
      { "─", hl_name },
      { "╮", hl_name },
      { "│", hl_name },
      { "╯", hl_name },
      { "─", hl_name },
      { "╰", hl_name },
      { "│", hl_name },
    }
  end

  local formatting_style = {
    fields = { "abbr", "kind", "menu" },
    format = function(_, item)
      local icons = {
        Namespace = "󰌗",
        Text = "󰉿",
        Method = "󰆧",
        Function = "󰆧",
        Constructor = "",
        Field = "󰜢",
        Variable = "󰀫",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "󰑭",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈚",
        Reference = "󰈇",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "󰙅",
        Event = "",
        Operator = "󰆕",
        TypeParameter = "󰊄",
        Table = "",
        Object = "󰅩",
        Tag = "",
        Array = "[]",
        Boolean = "",
        Number = "",
        Null = "󰟢",
        String = "󰉿",
        Calendar = "",
        Watch = "󰥔",
        Package = "",
        Copilot = "",
        Codeium = "",
        TabNine = "",
      }
      local icon = icons[item.kind]

      item.kind = string.format("%s %s", icon, item.kind)
      return item
    end,
  }

  return {
    completion = { completeopt = "menu,menuone" },
    window = {
      completion = {
        col_offset = -1,
        side_padding = 0,
        scrollbar = false,
        border = border "CmpDocBorder",
      },
      documentation = {
        border = border "CmpDocBorder",
        winhighlight = "Normal:CmpDoc",
      },
    },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },

    formatting = formatting_style,
    mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<c-y>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif require("luasnip").expand_or_jumpable() then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif require("luasnip").jumpable(-1) then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
        else
          fallback()
        end
      end, { "i", "s" }),
    },
    sources = {
      { name = "nvim_lsp", max_item_count = 30 },
      { name = "luasnip" },
      -- { name = "lab.quick_data", keyword_length = 4 },
      -- { name = "codeium" },
      { name = "buffer" },
      { name = "nvim_lua" },
      { name = "path" },
    },
  }
end
