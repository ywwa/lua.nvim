return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  opts = function()
    return require "env.config.winbar"
  end,
  config = function(_, opts)
    require("lspsaga").setup(opts)
  end,
}
