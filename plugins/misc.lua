---@type NvPluginSpec[]
return {
  {
    "andweeb/presence.nvim",
    config = function()
      require("custom.plugins.configs.misc.presence")
    end,
  },

  {
    "ethanholz/nvim-lastplace",
    event = "BufWinEnter",
    config = function()
      require("custom.plugins.configs.misc.lastplace")
    end,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    config = function()
      require("core.utils").load_mappings("navigation")
    end
  },
}
