local M = {}

M.mason = {
  ensure_installed = {
    -- lua
    "lua-language-server",
    "stylua",

    -- javascript & typescript
    "typescript-language-server",

    -- html
    "html-lsp",

    -- css, scss, tailwind
    "css-lsp",
    "tailwindcss-language-server",

    -- php
    "intelephense",

    -- misc
    "deno",
    "emmet-ls"
  },
}

M.treesitter = {
  ensure_installed = {
    -- lua
    "lua",

    -- js,ts
    "javascript",
    "typescript",

    -- html
    "html",

    -- css, scss
    "css",
    "scss",

    -- php
    "php",

    -- c-family
    "c",
    "c_sharp",
    "cpp",

    -- prisma
    "prisma"
  },
  indent = { enable = true },
  context_commentstring = { enable = true },
}

M.cmp = {
  sources = {
    { name = "plugins" },
    { name = "nvim_lsp" },
    { name = "codeium" },
    { name = "nvim_lua" },
    {
      name = "npm",
      keyword_length = 4,
    },
    { name = "calc" },
    { name = "vim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
    { name = "emoji" },
    { name = "nerdfont" },
  },
}

M.nvimtree = {
  git = { enable = true },
  renderer = {
    add_trailing = true,
    group_empty = true,
    root_folder_label = function()
      return ""
    end,
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
}

M.telescope = {
  extensions = {
    file_browser = {
      hijack_netrw = true,
    },
  },
  extensions_list = {
    "themes",
    "terms",
    "fzf",
    "file_browser",
  },
}

return M
