return {
  "ethanholz/nvim-lastplace",
  event = "VimEnter",
  opts = {

    lastplace_ignore_buftype = {
      "Telescope",
      "NvimTree",
      "terminal",
      "help",
      "Trouble",
      "mason",
      "lazy",
    },
    lastplace_ignore_filetype = {
      "Telescope",
      "NvimTree",
      "terminal",
      "help",
      "Trouble",
      "mason",
      "lazy",
    },
    lastplace_open_folds = true,
  },
}
