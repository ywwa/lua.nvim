---@diagnostic disable: different-requires
return {
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
  opts = function()
    return require "plugins.config.pretty-fold"
  end,
  config = function(_, opts)
    require("pretty-fold").setup(opts)
    vim.cmd.hi "Folded guibg=NONE"
  end,
}
