return {
  "stevearc/conform.nvim",
  opts = function()
    return require "plugins.config.conform"
  end,
  config = function(_, opts)
    ---@diagnostic disable-next-line: different-requires
    require("conform").setup(opts)
  end,
}
