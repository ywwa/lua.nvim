local overrides = require "custom.plugins.configs.overrides"
---@type NvPluginSpec[]
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "nvimtools/none-ls.nvim",
        config = function()
          require "custom.plugins.configs.defaults.none-ls"
        end,
      },
      {
        "pmizio/typescript-tools.nvim",
        ft = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
        },
        opts = {},
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.configs.defaults.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    opts = overrides.treesitter,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      "ray-x/cmp-treesitter",
      "hrsh7th/cmp-calc",
      "chrisgrieser/cmp-nerdfont",
      {
        "David-Kunz/cmp-npm",
        ft = "json",
        config = function()
          require("cmp-npm").setup {}
        end,
      },
      {
        "KadoBOT/cmp-plugins",
        ft = "lua",
        config = function()
          require("cmp-plugins").setup {
            files = { ".*\\.lua" },
          }
        end,
      },
    },
    opts = overrides.cmp,
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
    },
    opts = overrides.telescope,
  },

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
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      ft = { "typescript", "javascriptreact" },
      config = function()
        require "custom.plugins.configs.defaults.comment"
      end,
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      indent = { char = "│" },
    },
  },
}
