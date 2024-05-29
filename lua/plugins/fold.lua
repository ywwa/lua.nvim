local config = require "env.config.fold"

return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        opts = function()
          return config.statuscol()
        end,
      },
    },
    event = "VimEnter",
    opts = function()
      return config.ufo
    end,
    config = function(_, opts)
      require("ufo").setup(opts)
    end,
  },
}
