return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  opts = {
    symbol_in_winbar = {
      enable = true,
      separator = "/",
      hide_keyword = false,
      show_file = true,
      folder_level = 2,
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
    lightbulb = {
      enable = false,
    },
    ui = {
      devicon = true,
      theme = "round",
      title = true,
      border = "rounded",
    },
  },
}
