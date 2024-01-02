---@type NvPluginSpec[]
return {
	-- {
	--   "andweeb/presence.nvim",
	--   config = function()
	--     require "custom.core.plugin_configs.presence"
	--   end,
	-- },
	--
	{
		"IogaMaster/neocord",
		config = function()
			require("custom.core.plugin_configs.neocord")
		end,
		-- config = {
		-- 	main_image = "logo",
		-- 	logo = "https://0x0.st/H3Rh.png",
		-- 	show_time = true,
		-- 	log_level = "debug",
		-- 	workspace_text = function()
		-- 		return "Manipulating NvChad"
		-- 	end,
		-- },
	},

	{
		"ethanholz/nvim-lastplace",
		event = "VimEnter",
		config = function()
			require("custom.core.plugin_configs.lastplace")
		end,
	},

	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
		config = function()
			require("core.utils").load_mappings("navigation")
		end,
	},

	{
		"elkowar/yuck.vim",
		ft = { "yuck" },
		config = true,
	},
	{
		"HampusHauffman/bionic.nvim",
		cmd = { "Bionic", "BionicOn", "BionicOff" },
	},

	{
		"razak17/tailwind-fold.nvim",
		ft = { "html", "svelte", "astro", "vue", "typescriptreact" },
		opts = {
			min_chars = 50,
		},
	},
}
