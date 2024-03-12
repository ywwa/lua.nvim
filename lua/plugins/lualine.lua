return {
  "nvim-lualine/lualine.nvim",
  event = "UIEnter",
  opts = {
    -- theme = "decay"
  },
  config = function(_, opts)
    require("lualine").setup(opts)
  end,
}
