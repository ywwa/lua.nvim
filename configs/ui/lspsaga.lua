local M = {}
M.setup = function()
  require("lspsaga").setup {
    preview = {
      lines_above = 0,
      lines_below = 10,
    },

    symbol_in_winbar = {
      enable = true,
      separator = " ",
      hide_keyword = true,
      show_file = true,
      folder_level = 2,
      respect_root = false,
      color_mode = true,
    },
  }
end
return M
