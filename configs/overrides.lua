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
    "php",
    "jsdoc",
    "scss",
    "vue",
    "c",
    "markdown",
    "markdown_inline",
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
    "deno",
    "prettier",
    "emmet-language-server",
    "prisma-language-server",
    "vue-language-server",
    "tailwindcss-language-server",
    "intelephense",
    "marksman",
    "clangd",
    "clang-format",
    "shfmt",
  },
}

M.nvimtree = {
  git = { enable = true },
  renderer = {
    add_trailing = true,
    group_empty = true,
    highlight_git = true,
    highlight_opened_files = "name",
    indent_markers = { enable = true },
    icons = {
      show = {
        git = false,
      },
    },
  },
}

return M
