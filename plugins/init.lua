local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "pmizio/typescript-tools.nvim",
      ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      config = function()
        require("typescript-tools").setup {
          on_attach = function(client, _)
            client.server_capabilities.semanticTokensProvider = nil
          end,
        }
      end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.init.lspconfig"
    end,
  },

  { "williamboman/mason.nvim", opts = overrides.mason },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      {
        "numToStr/Comment.nvim",
        opts = function()
          return {
            pre_hook = require(
              "ts_context_commentstring.integrations.comment_nvim"
            ).create_pre_hook(),
          }
        end,
      },
    },
    opts = overrides.treesitter,
  },

  { "nvim-tree/nvim-tree.lua", opts = overrides.nvimtree },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup {
        clear_empty_lines = true,
      }
    end,
  },


  {
    "lukas-reineke/indent-blankline.nvim",
    opts = { indent = { char = "." } },
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = require "custom.configs.init.cmp"
  },

  -- disabled core plugins
  {
    "windwp/nvim-autopairs",
    enabled = false,
  },
}
