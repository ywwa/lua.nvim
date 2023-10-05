---@type NvPluginSpec[]
return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    opts = {},
    config = function()
      require("custom.plugins.configs.ui.noice")
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("custom.plugins.configs.ui.lspsaga")
    end,
  },

  {
    "kevinhwang91/nvim-ufo",
    event = "VimEnter",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          require("custom.plugins.configs.ui.ufo").statuscol()
        end,
      },
    },
    config = function()
      require("custom.plugins.configs.ui.ufo").ufo()
    end,
  },

  {
    "anuvyklack/pretty-fold.nvim",
    event = "VimEnter",
    dependencies = {
      "anuvyklack/keymap-amend.nvim",
      {
        "anuvyklack/fold-preview.nvim",
        opts = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
      },
    },
    config = function()
      require("custom.plugins.configs.ui.pretty-fold")
    end,
  },

  {
    "Aasim-A/scrollEOF.nvim",
    event = "BufEnter",
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("scrollEOF").setup({
        pattern = "*",
        insert_mode = true,
        disabled_filetypes = { "NvimTree" },
      })
    end,
  },

  {
    "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("custom.plugins.configs.ui.neoscroll")
    end,
  },

  {
    "xiyaowong/virtcolumn.nvim",
    event = "BufWinEnter",
  },

  {
    "shellRaining/hlchunk.nvim",
    event = "UIEnter",
    config = function()
      require("custom.plugins.configs.ui.hlchunk")
    end,
  },

  {
    "kevinhwang91/nvim-hlslens",
    event = "BufReadPost",
    config = function()
      require("custom.plugins.configs.ui.hlslens")
    end,
  },

  {
    "m-demare/hlargs.nvim",
    event = "BufWinEnter",
    config = function()
      require("custom.plugins.configs.ui.hlargs")
    end,
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufWinEnter",
    config = function()
      require("custom.plugins.configs.ui.rainbow-delimiters")
    end,
  },

  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("custom.plugins.configs.ui.todo-comments")
    end,
  },

  {
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
    config = function()
      require("custom.plugins.configs.ui.zen-mode")
    end,
  },
}
