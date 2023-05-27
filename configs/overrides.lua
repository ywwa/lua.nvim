local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "markdown",
    "markdown_inline",
    "prisma",
    "http",
    "json",
  },
  indent = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = false,
    max_file_lines = 1000,
    query = {
      "rainbow-parens",
      html = "rainbow-tags",
      javascript = "rainbow-tags-react",
      tsx = "rainbow-tags",
    },
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  autotag = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "stylua",

    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "tailwindcss-language-server",
    "prisma-language-server",
    "deno",
    "prettier",
  },
}

M.cmp = {
  sources = {
    {
      name = "cmp-spell",
      option = {
        keep_all_entries = true,
        enable_in_context = function()
          return true
        end,
      },
    },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
}

-- git support in nvimtree
M.nvimtree = {
  view = {
    side = "left",
    signcolumn = "no",
  },
  git = {
    enable = true,
  },

  renderer = {
    root_folder_label = function()
      return ""
    end,
    group_empty = true,
    highlight_git = true,
    icons = {
      show = {
        git = false,
      },
    },
  },

  tab = {
    sync = {
      open = true,
      close = true,
    },
  },
}

M.nvterm = {
  terminals = {
    type_opts = {
      float = {
        -- relative = "editor",
        -- row = 0.15,
        -- col = 0.1,
        -- width = 0.8,
        -- height = 0.6,
        border = "none",
      },
    },
  },
}

M.blankline = {
  filetype_exclude = {
    "help",
    "terminal",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "nvcheatsheet",
    "lsp-installer",
    "norg",
    "Empty",
    "",
  },
  -- char = "¦",
  -- context_char = "¦",
  buftype_exclude = { "terminal", "nofile" },
  show_end_of_line = true,
  show_foldtext = true,
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  show_current_context = true,
  show_current_context_start = true,
  vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { nocombine = true, fg = "none" }),
  vim.api.nvim_set_hl(0, "IndentBlanklineContextStart", { nocombine = false, underline = false, special = "none" }),
}

return M
