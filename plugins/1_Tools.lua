---@type NvPluginSpec[]
---@diagnostic disable: different-requires
return {
  {
    "numToStr/Navigator.nvim",
    config = function()
      require("Navigator").setup()
    end,
  },

  {
    "ethanholz/nvim-lastplace",
    event = "VimEnter",
    config = require "custom.configs.Tools.lastplace",
  },

  {
    "folke/trouble.nvim",
    event = "LspAttach",
    cmd = { "Trouble", "TroubleToggle" },
    config = require "custom.configs.Tools.trouble",
  },

  {
    "roobert/surround-ui.nvim",
    dependencies = {
      "kylechui/nvim-surround",
      version = "*",
      event = "BufWinEnter",
      config = function()
        require("nvim-surround").setup {}
        require("surround-ui").setup { root_key = "S" }
      end,
    },
    config = true,
  },

  {
    "folke/twilight.nvim",
    cmd = { "Twilight", "TwilightEnable", "TwilightDisable" },
    opts = {
      dimming = {
        alpha = 0.25,
        color = { "Normal", "#ffffff" },
        term_bg = "#000000",
        inactive = false,
      },
      context = 15,
      treesitter = true,
      expand = { "function", "method", "table", "if_statement" },
    },
  },

  { "folke/neodev.nvim", ft = "lua" },

  {
    "nacro90/numb.nvim",
    event = "UIEnter",
    config = function()
      require("numb").setup()
    end,
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = require "custom.configs.Tools.zenMode",
  },

  {
    "kevinhwang91/nvim-hlslens",
    event = "BufReadPost",
    config = function()
      require("hlslens").setup {}
    end,
  },

  {
    "toppair/peek.nvim",
    ft = "markdown",
    build = "deno task --quiet build:fast",
    config = require "custom.configs.Tools.peek",
  },

  {
    "vuki656/package-info.nvim",
    ft = "json",
    config = true,
  },

  {
    "ExaFunction/codeium.nvim",
    event = "LspAttach",
    config = function()
      require("codeium").setup {}
    end,
  },

  {
    "laytan/tailwind-sorter.nvim",
    event = "LspAttach",
    build = "cd formatter && npm i && npm run build",
    config = true,
  },

  {
    "mistricky/codesnap.nvim",
    cmd = { "Codesnap", "CodeSnapPreviewOn" },
    build = "make",
    config = function()
      require("codesnap").setup { watermark = "" }
    end,
  },

  {
    "rest-nvim/rest.nvim",
    ft = "http",
    config = require "custom.configs.Tools.rest",
  },
}
