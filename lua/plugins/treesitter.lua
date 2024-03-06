return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  config = function(_, opts)
    local configs = require "nvim-treesitter.configs"
    configs.setup {
      ensure_installed = { "lua", "vim", "vimdoc" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    }
  end,
}
