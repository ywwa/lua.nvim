return {
  "xiyaowong/virtcolumn.nvim",
  event = "UIEnter",
  config = function()
    vim.g.virtcolumn_char = "▕"
    vim.g.virtcolumn_priority = 10
  end,
}
