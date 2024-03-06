return {
  "ExaFunction/codeium.nvim",
  event = "LspAttach",
  config = function()
    require("codeium").setup {}
  end,
}
