return {
  {
    "bluz71/vim-nightfly-colors",
    lazy = false,
    name = "nightfly",
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = true,
  },
  {
    "decaycs/decay.nvim",
    name = "decay",
    lazy = false,
    priority = 1000,
    opts = {
      style = "dark",
      nvim_tree = { contrast = true },
    },
    config = function(_, opts)
      require("decay").setup(opts)
      vim.cmd.hi "NvimTreeWinSeparator guibg=NONE"
      vim.cmd.hi "ColorColumn guibg=#282e33"
      vim.cmd.hi "IblIndent guifg=#2D3130 "
      vim.cmd.hi "StatusLine guifg=NONE"
    end,
  },
}
