--type conform.options
local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },

    javascript = { "deno_fmt" },
    javascriptreact = { "deno_fmt" },
    typescript = { "deno_fmt" },
    typescriptreact = { "deno_fmt" },

    css = { "prettier" },
    html = { "prettier" },

    json = { "prettier" },
    jsonc = { "prettier" },
    markdown = { "prettier" },

    sh = { "shfmt" },
  },
}

require("conform").setup(options)
