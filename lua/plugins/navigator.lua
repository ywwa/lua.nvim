return {
  "numToStr/Navigator.nvim",
  event = { "UIEnter" },
  config = function()
    require("Navigator").setup()
  end,
}
