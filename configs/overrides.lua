local M = {}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "stylua",
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "prettier",
    "eslint-lsp",
    "jsonlint",
    "json-lsp",
  },
}

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
    "json",
    "json5",
  },
  indent = {
    enable = true,
  },
}

M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = false,
      },
    },
  },
}

M.cmp = {
  sources = {
    { name = "nvim_lsp" },
    { name = "codeium" },
    { name = "nvim_lua" },
    { name = "vim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "path" },
    { name = "emoji" },
  },
}

M.blankline = {
  filetype_exclude = {
    "help",
    "terminal",
    "lspinfo",
    "Empty",
    "nvcheatsheet",
    "nvdash",
    "TelescopePrompt",
    "TelescropeResults",
    "lsp-installer",
  },

  buftype_exclude = {
    "terminal",
    "nofile",
  },
  show_end_of_line = true,
  show_foldtext = true,
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  show_current_context = true,
  show_current_context_start = true,
  vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", {
    nocombine = true,
    fg = "none",
  }),
  vim.api.nvim_set_hl(0, "IndentBlanklineContextStart", {
    nocombine = false,
    underline = false,
    special = "none",
  }),
}

return M
