local blacklist = {
	"NvimTree",
	"nvdash",
	"nvcheatsheet",
	"terminal",
	"Trouble",
	"help",
	"man",
	"prompt",
}
local scrolloff = 10

local createAutoCmd = vim.api.nvim_create_autocmd
local tbl_contains = vim.tbl_contains

createAutoCmd("BufEnter", {
	callback = function()
		if
			tbl_contains(blacklist, vim.bo.filetype)
			or tbl_contains(blacklist, vim.bo.buftype)
		then
			vim.opt.so = 0
		end
		vim.opt.so = scrolloff
	end,
})
