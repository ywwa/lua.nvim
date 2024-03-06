---@diagnostic disable: different-requires
return {
  "folke/trouble.nvim",
  event = "LspAttach",
  cmd = { "Trouble", "TroubleToggle" },
  opts = function()
    return require "plugins.config.trouble"
  end,
  config = function(_, opts)
    require("trouble").setup(opts)
  end,
}
