local M = {}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "stylua",
    "deno",
    "typescript-language-server",
    "html-lsp",
    "css-lsp",
    "tailwindcss-language-server",
    "emmet-ls",
    "prisma-language-server",
    "prettier",
    "marksman",
    "intelephense",
    "clangd",
  },
}

M.treesitter = {
  ensure_installed = {
    "lua",
    "prisma",
    "javascript",
    "typescript",
    "php",
    "tsx",
    "jsdoc",
    "html",
    "css",
    "scss",
  },
  indent = { enable = true },
}

M.telescrope = {
  extensions = { http = { open_url = "xdg-open %s" } },
  extensions_list = {
    "themes",
    "terms",
    "file_browser",
    "http",
    "tailiscope",
    "nodua",
  },
}

M.nvimtree = {
  git = { enable = true },
  renderer = {
    add_trailing = true,
    full_name = true,
    group_empty = true,
    highlight_git = true,
    highlight_opened_files = "all",
    indent_markers = {
      enable = true,
    },
    icons = {
      show = {
        git = false,
      },
    },
  },
  view = {
    side = "left",
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  filters = {
    git_ignored = true,
    dotfiles = true,
  },
  sort = {
    sorter = "case_sensitive",
  },
}

return M
