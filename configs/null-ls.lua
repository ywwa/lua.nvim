local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  b.formatting.deno_fmt,
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } },
  b.formatting.stylua,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
