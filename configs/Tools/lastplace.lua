return function()
  require("nvim-lastplace").setup {
    lastplace_ignore_buftype = {
      "nvdash",
      "NvimTree",
      "terminal",
      "help",
      "Trouble",
      "mason",
      "lazy",
    },
    lastplace_ignore_filetype = {
      "nvdash",
      "NvimTree",
      "terminal",
      "help",
      "Trouble",
      "mason",
      "lazy",
    },
    lastplace_open_folds = true,
  }
end
