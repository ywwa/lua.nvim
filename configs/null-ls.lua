local null_ls = require("null-ls")

local b = null_ls.builtins

local sources = {
  b.formatting.prettier.with {
    filetypes = {
      "html",
      "markdown",
      "css"
    }
  },
  b.formatting.stylua,
  b.formatting.eslint_d
}
null_ls.setup {
  debug = true,
  sources = sources
}
