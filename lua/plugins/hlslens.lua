return {
  "kevinhwang91/nvim-hlslens",
  event = "BufReadPost",
  config = function()
    require("hlslens").setup {}
  end,
}
