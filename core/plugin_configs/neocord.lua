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

	-- Rich Presence text options
	-- editing_text = "Editing %s", -- Format string rendered when an editable file is loaded in the buffer (either string or function(filename: string): string)
	editing_text = function(filename)
		return "stackoverflowing " .. filename
	end,
	-- file_explorer_text = "Browsing %s", -- Format string rendered when browsing a file explorer (either string or function(file_explorer_name: string): string)
	file_explorer_text = function(file_explorer_name)
		return "Scouting files in " .. file_explorer_name
	end,
	git_commit_text = "Committing changes", -- Format string rendered when committing changes in git (either string or function(filename: string): string)
	-- plugin_manager_text = "Managing plugins", -- Format string rendered when managing plugins (either string or function(plugin_manager_name: string): string)
	plugin_manager_text = function(plugin_manager_name)
		return "Managing " .. plugin_manager_name .. " plugins"
	end,
	-- reading_text = "Reading %s", -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer (either string or function(filename: string): string)
	reading_text = function(filename)
		return "idling in " .. filename
	end,
	-- workspace_text = "Working on %s", -- Format string rendered when in a git repository (either string or function(project_name: string|nil, filename: string): string)
	workspace_text = function(project_name, filename)
		return "real vscode"
	end,
	line_number_text = "Line %s out of %s", -- Format string rendered when `enable_line_number` is set to true (either string or function(line_number: number, line_count: number): string)
})
