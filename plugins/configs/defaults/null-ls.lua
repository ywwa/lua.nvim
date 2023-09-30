local null_ls = require("null-ls")

local b = null_ls.builtins

local sources = {
  -- lua
  -- b.diagnostics.luacheck,
  b.formatting.stylua,

}

null_ls.setup {
  debug = true,
  sources = sources
}
