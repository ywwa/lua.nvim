return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    {
      "folke/ts-comments.nvim",
      opts = {},
      event = "VeryLazy",
      enabled = vim.fn.has "nvim-0.10.0" == 1,
    },
  },
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  opts = function()
    return require "env.config.treesitter"
  end,
  config = function(_, opts)
    local configs = require "nvim-treesitter.configs"
    configs.setup(opts)
  end,
}
