local config = require "env.config.tabline"

return {
  "romgrk/barbar.nvim",
  event = "UIEnter",
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  keys = function()
    return config.tablineKeys()
  end,
  opts = function()
    return config.tablineConfig
  end,
  config = function(_, opts)
    require("barbar").setup(opts)
  end,
}
