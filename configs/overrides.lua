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
    "c",
    "markdown",
    "markdown_inline",
    "prisma",
    "http",
    "json"
  },
  indent = {
    enable = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

  },
}

-- git support in nvimtree
M.nvimtree = {
  view = {
    side = "left",
    signcolumn = "no"
  },
  git = {
    enable = true,
  },

  renderer = {
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
        relative = 'editor',
        row = 0.15,
        col = 0.1,
        width = 0.8,
        height = 0.6,
        border = "single"
      }
    }
  }
}

return M
