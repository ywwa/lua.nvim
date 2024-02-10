require("ufo").setup {
  close_fold_kinds = { "imports" },
  provider_selector = function()
    return { "treesitter", "indent" }
  end,
}
