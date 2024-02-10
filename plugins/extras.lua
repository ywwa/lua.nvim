---@type NvPluginSpec[]
return {
  {
    "IogaMaster/neocord",
    config = function()
      require "custom.core.plugin_configs.neocord"
    end,
  },

  {
    "ethanholz/nvim-lastplace",
    event = "VimEnter",
    config = function()
      require "custom.core.plugin_configs.lastplace"
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    config = function()
      require("core.utils").load_mappings "navigation"
    end,
  },

  {
    "elkowar/yuck.vim",
    ft = { "yuck" },
    config = true,
  },
  {
    "HampusHauffman/bionic.nvim",
    cmd = { "Bionic", "BionicOn", "BionicOff" },
  },
}
