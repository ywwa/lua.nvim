---@type NvPluginSpec[]
return {
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = require "custom.configs.UI.todoComments",
  },

  {
    "xiyaowong/virtcolumn.nvim",
    event = "BufWinEnter",
    config = function()
      vim.g.virtcolumn_char = "│"
      vim.g.virtcolumn_priority = 666
    end,
  },

  {
    "m-demare/hlargs.nvim",
    event = "BufWinEnter",
    config = require "custom.configs.UI.hlargs",
  },

  {
    "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>" },
    config = require "custom.configs.UI.neoscroll",
  },

  {
    "Aasim-A/scrollEOF.nvim",
    event = "BufEnter",
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("scrollEOF").setup {
        pattern = "*",
        insert_mode = true,
        disabled_filetypes = { "NvimTree" },
      }
    end,
  },
  {
    "anuvyklack/pretty-fold.nvim",
    event = "UIEnter",
    dependencies = {
      "anuvyklack/keymap-amend.nvim",
      {
        "anuvyklack/fold-preview.nvim",
        opts = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
      },
    },
    config = require "custom.configs.UI.prettyFold",
  },

  {
    "kevinhwang91/nvim-ufo",
    event = "UIEnter",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = require "custom.configs.UI.statusCol",
      },
    },
    config = require "custom.configs.UI.nvimUfo",
  },

  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        mode = "foreground",
      },
    },
  },
}
