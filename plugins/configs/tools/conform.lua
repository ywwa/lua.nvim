require("conform").setup({
  settings = {
    tsserver_plugins = {
      "@styled/typescript-styled-plugin",
    },
  },

  formatters_by_ft = {
    typescript = { "prettierd" },
    -- javascript = { "deno_fmt" },
    -- typescript = { "deno_fmt" },
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

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

require("core.utils").load_mappings("conform")
