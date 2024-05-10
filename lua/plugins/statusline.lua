return {
  "nvim-lualine/lualine.nvim",
  event = "UIEnter",
  opts = function()
    return require "env.config.statusline"
  end,
  config = function(_, opts)
    require("lualine").setup(opts)
  end,
}
