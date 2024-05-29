return {
  {
    "nyoom-engineering/oxocarbon.nvim",
    enabled = false,
    lazy = false,
    priority = 10000,
    config = function()
      vim.opt.background = "dark"
      vim.cmd.colorscheme "oxocarbon"
      vim.api.nvim_set_hl(
        0,
        "NvimTreeWinSeparator",
        { bg = "none", fg = "#262626" }
      )

      vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none", fg = "#262626" })
    end,
  },

  {
    "folke/tokyonight.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme "tokyonight-night"
      vim.api.nvim_set_hl(0, "Folded", { bg = "none" })
    end,
  },

  { -- this one requires some patching
    "ellisonleao/gruvbox.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.o.background = "dark"
      vim.cmd.colorscheme "gruvbox"
    end,
  },

  { -- requires patches aswell
    "rebelot/kanagawa.nvim",
    enabled = false,
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd.colorscheme "kanagawa"
    end,
  },

  { -- visual selection broken but w/e
    "decaycs/decay.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "dark",
      italics = {
        comments = true,
      },
      nvim_tree = {
        contrast = false,
      },
    },
    config = function(_, opts)
      vim.o.background = "dark"
      require("decay").setup(opts)
    end,
  },
}
