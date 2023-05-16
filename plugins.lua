local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options --------------------------------------

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs -------------------------------------------------
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "NvChad/nvterm",
    opts = overrides.nvterm
  },

  -- Install a plugin --------------------------------------------------------
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "alexghergh/nvim-tmux-navigation",
    lazy = false, -- BRO STOP! USE LAZY LOAD { later }
    config = function()
      require("nvim-tmux-navigation").setup({
        disable_when_zoomed = false,
        keybinding = {
          left = "<C-h>",
          down = "<C-j>",
          up   = "<C-k>",
          right= "<C-l>"
        }
      })
    end,
  },

  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = {
      "nvim-lua/plenary.nvim",
      config = function()
        require("plenary")
      end,
    },
    config = function()
      require "custom.configs.rest"
    end,
  },

  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:debug",
    config = function()
      require "custom.configs.peek"
    end,
  },

  {
    "andreadev-it/shade.nvim",
    keys = "<Bslash>",
    config = function()
      require("shade").setup {
        exclude_filetypes = { "NvimTree" },
      }
    end,
  },

  {
    "andweeb/presence.nvim",
    event = "VeryLazy",
    config = function()
      require "custom.configs.presence"
    end,
  },

}

return plugins
