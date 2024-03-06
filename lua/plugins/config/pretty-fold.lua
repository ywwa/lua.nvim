return {
  keep_indentation = false,
  fill_char = " ",
  sections = {
    left = {
      function()
        return string.rep("*", vim.v.foldlevel)
      end,
    },
    right = {},
  },

  ft_ignore = {
    "NvimTree",
    "help",
    "vim",
    "Trouble",
    "lazy",
    "toggleterm",
  },
}
