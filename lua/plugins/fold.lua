local config = require "env.config.fold"
return {
  {
    "kevinhwang91/nvim-ufo",
    event = "UIEnter",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        opts = function()
          return config.statuscol()
        end,
        config = function(_, opts)
          require("statuscol").setup(opts)
        end,
      },
    },
    opts = function()
      return config.ufo()
    end,
    config = function(_, opts)
      require("ufo").setup(opts)
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
        config = function(_, opts)
          require("fold-preview").setup(opts)
          vim.api.nvim_set_hl(0, "FoldPreviewBorder", { fg = "#333333" })
        end,
      },
    },
    opts = function()
      return config.prettyFold
    end,
    config = function(_, opts)
      require("pretty-fold").setup(opts)
      vim.api.nvim_set_hl(0, "Folded", { bg = "NONE" })
    end,
  },
}
