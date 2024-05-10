local config = require "env.config.motion"

return {
  {
    "numToStr/Navigator.nvim",
    event = { "VimEnter" },
    keys = function()
      return config.navigatorKeys()
    end,
    config = function()
      require("Navigator").setup()
    end,
  },
}
