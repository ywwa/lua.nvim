local config = require "env.config.formatter"

return {
  "stevearc/conform.nvim",
  keys = function()
    return config.conformKeys()
  end,
  opts = function()
    return config.conformConfig
  end,
  config = function(_, opts)
    require("conform").setup(opts)
  end,
}
