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

return M
