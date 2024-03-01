return function()
  require("pretty-fold").setup {
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
      "dashboard",
      "nvcheatsheet",
      "help",
      "vim",
      "alpha",
      "dashboard",
      "neo-tree",
      "Trouble",
      "noice",
      "lazy",
      "toggleterm",
    },
  }
end
