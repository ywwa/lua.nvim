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

  -- special = {
  --   name = "authentication_service",
  --   take = {
  --     ship_file = "/home/yuukiwwa/app@Deskify/backend/tests/routes/users/POST.login.ship",
  --     ship_field = "user.token"
  --   },
  --   update = {
  --     lua_file = "/home/yuukiwwa/app@Deskify/backend/tests/environment/dev.lua",
  --     lua_field = "token"
  --   }
  -- },
}
