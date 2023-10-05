require("conform").setup({
  formatters_by_ft = {
    javascript = { { "prettierd", "prettier" } },
    typescript = { { "prettierd", "prettier" } },
    prisma = { "prisma" },
    lua = { "stylua" },
    php = { "phpcbf" },
    json = { "jq" },
  },

  format_on_save = {
    lsp_fallback = true,
    async = false,
    timeout_ms = 500,
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

-- vim.api.nvim_set_keymap({ "n", "v" }, "<leader>fm", function()
--   require("conform").format({
--     lsp_fallback = true,
--     async = false,
--     timeout_ms = 500,
--   })
-- end)
