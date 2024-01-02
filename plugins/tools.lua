---@type NvPluginSpec[]
return {
	{ -- trouble
		"folke/trouble.nvim",
		event = "LspAttach",
		cmp = { "TroubleToggle", "Trouble" },
		config = function()
			require("custom.core.plugin_configs.trouble")
		end,
	},

	-- { -- nvim-ship
	--   "javiorfo/nvim-ship",
	--   ft = "ship",
	--   cmd = { "ShipCreate", "ShipCreateEnv" },
	--   dependencies = {
	--     "javiorfo/nvim-spinetta",
	--     "javiorfo/nvim-popcorn",
	--   },
	--   config = function()
	--     require "custom.core.plugin_configs.ship"
	--   end,
	-- },

	{ -- peek
		"toppair/peek.nvim",
		ft = { "markdown" },
		build = "deno task --quiet build:fast",
		config = function()
			require("custom.core.plugin_configs.peek")
		end,
	},

	{ -- package info
		"vuki656/package-info.nvim",
		ft = { "json" },
		config = true,
	},

	{ -- conform
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("custom.core.plugin_configs.conform")
		end,
	},

	{
		"rest-nvim/rest.nvim",
		ft = { "http" },
		config = function()
			require("custom.core.plugin_configs.rest")
		end,
	},

	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},

	{ "rafcamlet/nvim-luapad", ft = "lua" },
	{ "folke/neodev.nvim", opts = {}, ft = "lua" },
	{
		"ExaFunction/codeium.nvim",
		event = "LspAttach",
		config = function()
			require("codeium").setup({})
		end,
	},
}
