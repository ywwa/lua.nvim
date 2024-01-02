local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

local servers = {
	"lua_ls",
	"html",
	"cssls",
	"tailwindcss",
	"emmet_ls",
	"prismals",
	"marksman",
}

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig["lua_ls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			completion = {
				callSnippet = "replace",
			},
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "use", "vim" },
			},
			telemetry = {
				enable = false,
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					[vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types"] = true,
					[vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
				},
			},
		},
	},
})

lspconfig["tailwindcss"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		tailwindCSS = {
			experemental = {
				classRegex = {
					-- "tw`([^`]*)", -- tw`...`
					-- "tw='([^']*)", -- <div tw="..." />
					-- "tw={`([^`}]*)", -- <div tw={"..."} />
					-- "tw\\.\\w+`([^`]*)", -- tw.xxx`...`
					-- "tw\\(.*?\\)`([^`]*)", -- tw(component)`...`
					-- "styled\\(.*?, '([^']*)'\\)",
					-- { "cn\\(([^)]*)\\)", "(?:'|\"|`)([^\"'`]*)(?:'|\"|`)" },
				},
			},
		},
	},
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
	vim.lsp.diagnostic.on_publish_diagnostics,
	{ virtual_text = true }
)
