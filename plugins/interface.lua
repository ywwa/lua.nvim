---@type NvPluginSpec[]
return {
  { -- lspsaga
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require "custom.core.plugin_configs.lspsaga"
    end,
  },

  { -- ufo
    "kevinhwang91/nvim-ufo",
    event = "VimEnter",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          require "custom.core.plugin_configs.statuscol"
        end,
      },
    },
    config = function()
      require "custom.core.plugin_configs.ufo"
    end,
  },

  { -- prettyfold
    "anuvyklack/pretty-fold.nvim",
    event = "VimEnter",
    dependencies = {
      "anuvyklack/keymap-amend.nvim",
      {
        "anuvyklack/fold-preview.nvim",
        opts = {
          border = {
            "╭",
            "─",
            "╮",
            "│",
            "╯",
            "─",
            "╰",
            "│",
          },
        },
      },
    },
    config = function()
      require "custom.core.plugin_configs.pretty-fold"
    end,
  },

  { -- scrolleof
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

  { -- neoscroll
    "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require "custom.core.plugin_configs.neoscroll"
    end,
  },

  { -- virtcolumn
    "xiyaowong/virtcolumn.nvim",
    event = "BufWinEnter",
  },

  { -- hlslens
    "kevinhwang91/nvim-hlslens",
    event = "BufReadPost",
    config = function()
      require("hlslens").setup {}
    end,
  },

  { -- hlargs
    "m-demare/hlargs.nvim",
    event = "BufWinEnter",
    config = function()
      require "custom.core.plugin_configs.hlargs"
    end,
  },

  { -- todo-comments
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require "custom.core.plugin_configs.todo-comments"
    end,
  },

  { -- ZenMode
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
    config = function()
      require "custom.core.plugin_configs.zen-mode"
    end,
  },

  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    event = "VeryLazy",
    config = function()
      require("tailwindcss-colorizer-cmp").setup {
        color_square_width = 2,
      }
    end,
  },

  {
    "nacro90/numb.nvim",
    event = "VeryLazy",
    config = function()
      require("numb").setup()
    end,
  },
}
