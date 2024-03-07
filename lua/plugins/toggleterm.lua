return {
  "akinsho/toggleterm.nvim",
  version = "*",
  cmd = { "ToggleTerm" },
  opts = {},
  config = function(_, opts)
    require("toggleterm").setup(opts)
  end,
}
