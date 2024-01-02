local options = {
	formatters_by_ft = {
		lua = { "stylua" },

		javascript = { "deno_fmt" },
		javascriptreact = { "deno_fmt" },
		typescript = { "deno_fmt" },
		typescriptreact = { "deno_fmt" },

		json = { "prettier" },
		jsonc = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		markdown = { "deno_fmt" },
	},
}

require("conform").setup(options)

require("core.utils").load_mappings("conform")
