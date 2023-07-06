local M = {}

M.setup = function()
  require("peek").setup {
    auto_load = true,
    close_on_bdelete = true,
    syntax = true,
    theme = "dark",
    update_on_change = true,
    app = "chromium",
    filetype = { "markdown" },
    throttle_at = 200000,
    throttle_time = "auto",
  }
end

return M
