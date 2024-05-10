---@diagnostic disable: different-requires
local config = require "env.config.terminal"

return {
  "akinsho/toggleterm.nvim",
  version = "*",
  lazy = false,
  keys = function()
    return config.keys()
  end,
  opts = function()
    return config.opts
  end,
  config = function(_, opts)
    require("toggleterm").setup(opts)
  end,
}
