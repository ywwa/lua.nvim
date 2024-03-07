---@diagnostic disable: different-requires
return {
  "folke/todo-comments.nvim",
  event = "BufRead",
  opts = function()
    return require "plugins.config.todo-comments"
  end,
  config = function(_, opts)
    require("todo-comments").setup(opts)
  end,
}
