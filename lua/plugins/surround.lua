return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  opts = {},
  config = function(_, opts)
    require("nvim-surround").setup(opts)
  end,
}
