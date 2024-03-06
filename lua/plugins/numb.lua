return {
  "nacro90/numb.nvim",
  event = "UIEnter",
  config = function()
    require("numb").setup()
  end,
}
