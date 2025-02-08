return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "folke/neodev.nvim", ft = "lua" },
    { "Issafalcon/lsp-overloads.nvim" },
    { "pmizio/typescript-tools.nvim" },
    { "luckasRanarison/tailwind-tools.nvim", name = "tailwind-tools", build = ":UpdateRemotePlugins" },
  },
  event = "User FilePost",
  config = function()
    require "config.lspconfig"
  end,
}
