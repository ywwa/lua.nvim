local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options ---------------------------------------

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

  -- override plugin configs --------------------------------------------------
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

  -- Custom plugins -----------------------------------------------------------
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },


  -- Utilities ----------------------------------------------------------------
  {
    "rest-nvim/rest.nvim",
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

  -- Yoinked from siducks .'s -------------------------------------------------
  {
    "folke/trouble.nvim",
    cmd = "Trouble",
    config = function()
      require("trouble").setup()
    end,
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require "custom.configs.zenmode"
    end,
  },


  -- Github -------------------------------------------------------------------
  {
    "f-person/git-blame.nvim",
    cmd = "GitBlameToggle"
  },


  -- Smoother workflow --------------------------------------------------------
  {
    "aserowy/tmux.nvim",
    keys = require "custom.configs.tmux".keys,
    config = function()
      require "custom.configs.tmux".setup()
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
    "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("neoscroll").setup()
    end,
  },

  {
    "Aasim-A/scrollEOF.nvim",
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("scrollEOF").setup({
        insert_mode = true
      })
    end,
  },

  {
    "lukas-reineke/virt-column.nvim",
    keys = "<leader>cc",
    config = function()
      require("virt-column").setup({
        char = "┃"
      })
    end,
  },


  -- Language support ---------------------------------------------------------
  {
    "elkowar/yuck.vim",
    config = function()
      vim.opt.ft = "yuck"
    end,
  },


  -- UI -----------------------------------------------------------------------
  {
    "folke/noice.nvim",
    dependencies = {
      { "MunifTanjim/nui.nvim" },
      -- { "rcarriga/nvim-notify" }
    },
    event = "VeryLazy",
    config = function()
      require "custom.configs.noice"
    end,
  },


  -- Useless plugins ( better delete them kekw ) ------------------------------
  {
    "andweeb/presence.nvim",
    config = function()
      require "custom.configs.presence"
    end,
  },

}

return plugins
