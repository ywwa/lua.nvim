require("conform").setup({
  formatters_by_ft = {
    javascript = { { "prettierd", "prettier" } },
    typescript = { { "prettierd", "prettier" } },
    prisma = { "prisma" },
    lua = { "stylua" },
    php = { "phpcbf" },
    json = { "jq" },
  },

  formatters = {
    prisma = {
      command = "prisma",
      args = { "format", "$FILENAME" },
      stdin = false,
    },
  },
})

require("core.utils").load_mappings("conform")
