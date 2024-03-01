return function()
  require("peek").setup {
    auto_load = true,
    close_on_delete = true,
    syntax = true,
    theme = "dark",
    update_on_change = true,
    app = "floorp",
    filetype = { "markdown" },
    throttle_at = 200000,
    throttle_time = "auto",
  }
end
