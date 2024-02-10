require("presence").setup {
  auto_update = true,
  neovim_image_text = ":!q <- this",
  main_image = "file",
  client_id = "793271441293967371",
  log_level = nil,
  debounce_timeout = 10,
  enable_line_number = true,
  blacklist = {},
  buttons = false,
  file_assets = {
    main_image = {
      "https://camo.githubusercontent.com/7ef2897c4de6940f119595f50119a887b538d42d4a0b65a15bd0148e2b6bec5b/68747470733a2f2f692e696d6775722e636f6d2f654e62643975442e706e67",
    },
  },
  show_time = true,

  editing_text = "breaking %s",
  file_explorer_text = "searching %s",
  git_commit_text = "yeeting to repo",
  plugin_manager_text = "messing config dir",
  reading_text = '"reading" %s',
  workspace_text = "working? on %s",
  line_number_text = "at line %s of %s",
}
