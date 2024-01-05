local M = {}

M.mason = {
	ensure_installed = {
		"lua-language-server",
		"stylua",

		"typescript-language-server",
		"html-lsp",
		"css-lsp",
		"tailwindcss-language-server",

		"deno",
		"emmet-ls",

		"prisma-language-server",

		"prettier",
		"marksman",
		"intelephense",
	},
}

M.treesitter = {
	ensure_installed = {
		"lua",
		"prisma",
		"javascript",
		"typescript",
    "php",
		"tsx",
		"jsdoc",
		"html",
		"css",
		"scss",
	},
	indent = { enable = true },
}

M.cmp = {
	sources = {
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "vim_lsp" },
		{ name = "codeium" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
		{ name = "emoji" },
		{ name = "nerdfont" },
	},
}

M.telescope = {
	extensions = {
		file_browser = {
			hijack_netrw = true,
		},
		http = {
			open_url = "xdg-open %s",
		},
	},
	extensions_list = {
		"themes",
		"terms",
		"file_browser",
		"http",
		"tailiscope",
		"nodua",
		-- "persisted"
	},
}

M.nvimtree = {
	git = { enable = true },
	renderer = {
		add_trailing = true,
		group_empty = true,
		-- root_folder_label = function()
		--   return ":~:s?$?/..?"
		-- end,
		highlight_git = true,
		highlight_opened_files = "all",
		indent_markers = {
			enable = true,
		},
		icons = {
			show = {
				git = false,
			},
		},
	},
	view = {
		side = "left",
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
	},
	filters = {
		git_ignored = true,
		dotfiles = true,
	},
	sort = {
		sorter = "case_sensitive",
	},
}

return M
