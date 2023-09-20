local M = {}

M.setup = function()
  require("peek").setup {
    auto_laod = false,
    close_on_delete = true,
    syntax = true,
    theme = "dark",
    update_on_change = true,
    app = "chromium",
    filetype = { "markdown" },
    throttle_at = 200000,
    throttle_time = "auto",
  }

  vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
  vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
end

return M
