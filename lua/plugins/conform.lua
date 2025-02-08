return {
  "stevearc/conform.nvim",
  keys = {
    {
      "<leader>fm",
      function()
        require("conform").format()
      end,
      desc = "Conform: Format Code",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "eslint_d", "prettierd" },
      javascriptreact = { "eslint_d", "prettierd" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
    },
  },
}
