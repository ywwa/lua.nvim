return function()
  require("hlargs").setup {
    paint_catch_blocks = {
      declarations = true,
      usages = true,
    },
    excluded_argnames = {
      usages = { lua = { "self" } },
    },
  }
end
