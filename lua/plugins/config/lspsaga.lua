return {
  symbol_in_winbar = {
    enable = true,
    separator = " › ",
    hide_keyword = true,
    show_file = true,
    folder_level = 1,
    color_mode = true,
    delay = 300,
  },
  code_action = {
    num_shortcut = true,
    show_server_name = true,
    extend_gitsigns = false,
    keys = {
      quit = "q",
      exec = "<CR>",
    },
  },
  implement = {
    enable = true,
    sign = false,
    virtual_text = true,
    priority = 100,
  },
  lightbulb = {
    enable = false,
  },
  ui = { theme = "round", title = true, border = "rounded" },
}
