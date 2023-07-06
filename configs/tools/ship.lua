local M = {}

M.setup = function()
  require("ship").setup {
    request = {
      timeout = 30,
      autosave = false,
    },

    response = {
      show_headers = "all",
      window_type = "h",
      redraw = true,
    },

    output = {
      save = false,
      override = true,
      folder = "tests",
    },

    internal = {
      log_debug = false,
    },
  }
end

return M
