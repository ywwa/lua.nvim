return {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },
    sh = { "shfmt" },

    javascript = { "deno_fmt" },
    javascriptreact = { "deno_fmt" },
    typescript = { "deno_fmt" },
    typescriptreact = { "deno_fmt" },

    css = { "prettier" },
    html = { "prettier" },

    json = { "prettier" },
    jsonc = { "prettier" },
    markdown = { "prettier" },
    mdx = { "prettier" },

    php = { "pint" },

    sql = { "sqlfmt" }
  },
}
