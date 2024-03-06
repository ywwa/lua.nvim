---@diagnostic disable: different-requires
return {
  "karb94/neoscroll.nvim",
  keys = { "<C-d>", "<C-u>" },
  opts = function()
    return require "plugins.config.neoscroll"
  end,
  config = function(_, opts)
    require("neoscroll").setup(opts)
  end,
}
