require("ship").setup {
  request = {
    timeout = 30,
    autosave = false
  },
  response = {
    show_headers = "all",
    window_type = "v",
    size = 50,
    redraw = true
  },
  output = {
    save = false,
    override = true,
    folder = "tests"
  },
  internal = {
    log_debug = false
  }
}
