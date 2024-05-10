return {
  "nyoom-engineering/oxocarbon.nvim",
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
  end,
}
