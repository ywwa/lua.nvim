return {
  "Aasim-A/scrollEOF.nvim",
  event = { "CursorMoved", "WinScrolled" },
  opts = {
    pattern = "*",
    insert_mode = true,
    disabled_filetypes = { "NvimTree", "lazy", "Telescope" },
  },
}
