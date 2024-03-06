return {
  "nvim-lualine/lualine.nvim",
  event = "UIEnter",
  opts = {},
  config = function(_, opts)
    require("lualine").setup(opts)
  end,
}
