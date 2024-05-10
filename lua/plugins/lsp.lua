local config = require 'env.config.lspConfig'

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "pmizio/typescript-tools.nvim",
        config = function()
          require("typescript-tools").setup {
            on_attach = function(client, _)
              client.server_capabilities.semanticTokensProvider = nil
            end,
          }
        end,
      },
      { "folke/neodev.nvim", ft = "lua" },
    },
    event = "User FilePost",
    config = function()
      config.setup()
    end,
  },
}
