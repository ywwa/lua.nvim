local M = {}

M.setup = function()
  require("nvim-lastplace").setup {
    lastplace_ignore_buftype = {
      "nvdash",
      "NvimTree",
      "terminal",
      "help",
      "Trouble",
    },
    lastplace_ignore_filetype = {
      "nvdash",
      "NvimTree",
      "terminal",
      "help",
      "Trouble",
    },
    lastplace_open_folds = true,
  }
end

return M
