return {
  -- mason
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = function()
      return require "plugins.config.mason"
    end,
    config = function(_, opts)
      ---@diagnostic disable-next-line: different-requires
      require("mason").setup(opts)
      vim.api.nvim_create_user_command("MasonInstallAll", function()
        if opts.ensure_installed and #opts.ensure_installed > 0 then
          vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
        end
      end, {})
    end,
  },

  -- lspconfig
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
      require("plugins.config.lspconfig").setup()
    end,
  },
}
