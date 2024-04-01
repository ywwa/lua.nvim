---@diagnostic disable: different-requires
return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  opts = function()
    return require "plugins.config.lspsaga"
  end,
  config = function(_, opts)
    require("lspsaga").setup(opts)
  end,
}
