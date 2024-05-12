local config = require "env.config.visual"

return {
  {
    "Aasim-A/scrollEOF.nvim",
    event = { "CursorMoved", "WinScrolled" },
    opts = {
      pattern = "*",
      insert_mode = true,
      disabled_filetypes = { "NvimTree", "lazy" },
    },
    config = function(_, opts)
      require("scrollEOF").setup(opts)
    end,
  },

  {
    "karb94/neoscroll.nvim",
    event = { "BufReadPost" },
    keys = { "<C-d>", "<C-u>" },
    opts = function()
      return config.neoscroll
    end,
    config = function(_, opts)
      require("neoscroll").setup(opts)
    end,
  },

  {
    "nacro90/numb.nvim",
    event = "UIEnter",
    config = function()
      require("numb").setup()
    end,
  },

  {
    "kevinhwang91/nvim-hlslens",
    event = "BufReadPost",
    config = function()
      require("hlslens").setup {}
    end,
  },
}
