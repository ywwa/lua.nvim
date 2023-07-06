local M = {}

M.setup = function()
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
      "nvdash",
      "terminal",
      "NvimTree",
      "nvcheatsheet",
    },
  }
end

return M
