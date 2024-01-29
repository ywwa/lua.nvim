require("neocord").setup({
	-- General options
	logo = "https://i.pinimg.com/564x/07/ae/37/07ae3794f2353ee98f298960573f4bc8.jpg", -- "auto" or url
	logo_tooltip = "Visual Studio Code", -- nil or string
	main_image = "logo", -- "language" or "logo"
	client_id = "1157438221865717891", -- Use your own Discord application client id (not recommended)
	log_level = nil, -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
	debounce_timeout = 5, -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
	blacklist = {}, -- A list of strings or Lua patterns that disable Rich Presence if the current file name, path, or workspace matches
	file_assets = {}, -- Custom file asset definitions keyed by file names and extensions (see default config at `lua/presence/file_assets.lua` for reference)
	show_time = true, -- Show the timer

	editing_text = "stackoverflowing %s",

	file_explorer_text = "scouting files in %s",

	git_commit_text = "Committing changes",
	plugin_manager_text = function(plugin_manager_name)
		return "Managing " .. plugin_manager_name .. " plugins"
	end,
	reading_text = "AFKing in %s",
	workspace_text = function(project_name, filename)
		if project_name ~= nil then
			return "patching " .. project_name
		end

		return "editing " .. filename
	end,
	line_number_text = "Line %s out of %s",
})
