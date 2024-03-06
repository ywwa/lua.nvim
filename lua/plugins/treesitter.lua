return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  opts = function()
    return require "plugins.config.treesitter"
  end,
  config = function(_, opts)
    local configs = require "nvim-treesitter.configs"
    configs.setup(opts)
  end,
}
