require("pretty-fold").setup {
  keep_indentation = false,
  fill_char = " ",
  sections = {
    left = {
      function()
        return string.rep("*", vim.v.foldlevel)
      end,
      "content",
    },
    right = {},
  },
  ft_ignore = {
    "NvimTree",
    "dashboard",
    "nvcheatsheet",
    "dapui_watches",
    "dap-repl",
    "dapui_console",
    "dapui_stacks",
    "dapui_breakpoints",
    "dapui_scopes",
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
