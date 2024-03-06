return {
  "Aasim-A/scrollEOF.nvim",
  event = "BufEnter",
  keys = { "<C-d>", "<C-u>" },
  opts = {
    pattern = "*",
    insert_mode = true,
    disabled_filetypes = { "NvimTree" },
  },
  config = function(_, opts)
    require("scrollEOF").setup(opts)
  end,
}
