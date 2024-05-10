local M = {}

M.neocord = {
  logo = "https://i.pinimg.com/564x/07/ae/37/07ae3794f2353ee98f298960573f4bc8.jpg",
  logo_tooltip = "Confign`t",
  main_image = "logo",
  client_id = "1157438221865717891",
  log_level = nil,
  debounce_timeout = 5,
  blacklist = {},
  file_assets = {},
  show_time = true,
  global_timer = true,
  editing_text = "stackoverflowing %s",
  file_explorer_text = "scouting files in %s",
  git_commit_text = "Committing crimes",
  plugin_manager_text = function(plugin_manager_name)
    return "Managing " .. plugin_manager_name .. " plugins"
  end,
  reading_text = "AFKing in %s",
  workspace_text = function(project_name, file_name)
    if project_name ~= nil then
      if project_name == "portfolio" then
        return "meow"
      end
      return "FUCKINGUP " .. project_name
    else
      return "FUCKINGUP " .. file_name
    end
  end,
  line_number_text = "Line %s out of %s",
}

return M
