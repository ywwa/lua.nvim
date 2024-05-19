local M = {}

M.conformConfig = {
  lsp_fallback = true,

  formatters_by_ft = {
    lua = { "stylua" },
    sh = { "shfmt" },

    javascript = { "deno_fmt" },
    javascriptreact = { "deno_fmt" },
    typescript = { "prettierd" },
    typescriptreact = { "prettierd" },

    css = { "prettier" },
    html = { "prettier" },

    json = { "prettier" },
    jsonc = { "prettier" },
    markdown = { "prettier" },
    mdx = { "prettier" },

    php = { "pint" },

    sql = { "sqlfmt" },
  },
}
function M.conformKeys()
  local conform = require "conform"

  return {
    {
      "<leader>fm",
      function()
        conform.format()
      end,
      desc = "Format Code",
    },
  }
end

return M
