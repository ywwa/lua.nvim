return {
  "ethanholz/nvim-lastplace",
  event = "VimEnter",
  opts = function()
    return require "plugins.config.lastplace"
  end,
  config = function(_, opts)
    require("nvim-lastplace").setup(opts)
  end,
}
