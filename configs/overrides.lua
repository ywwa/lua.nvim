local M = {}

M.mason = {
  ensure_installed = {
    "lua-language-server",
    "stylua",

    "css-lsp",
    "html-lsp",

    "typescript-language-server",
    "eslint-lsp",
    "deno",

    "prisma-language-server",
    "prettier",

    "tailwindcss-language-server",
  },

  ui = {
    icons = {
      package_pending = " ",
      package_installed = "󰄳 ",
      package_uninstalled = " 󰇚",
    },
    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
      cancel_installation = "<C-c>",
    },
  },
}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "bash",
    "html",
    "css",
    "json",
    "jq",
    "javascript",
    "typescript",
    "tsx",
    "regex",
    "markdown",
    "markdown_inline",
    "prisma",
  },
  indent = {
    enabled = true,
  },
  rainbow = {
    enabled = true,
    extended_mode = false,
    max_file_lines = 1000,
    query = {
      "rainbow-parens",
      html = "rainbow-tags-react",
      javascript = "rainbow-tags-react",
      typescript = "rainbow-tags-react",
      tsx = "rainbow-tags-react",
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

M.nvimtree = {
  view = {
    side = "left",
    signcolumn = "no",
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
        border = "none",
      },
    },
  },
}

M.cmp = {
  sources = {
    { name = "nvim_lsp" },
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
