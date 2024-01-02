vim.g.virtcolumn_char = "│"
vim.g.virtcolumn_priority = 666

local createCmd = vim.api.nvim_create_user_command
local createAutoCmd = vim.api.nvim_create_autocmd

local blacklist = {
	"NvimTree",
	"nvdash",
	"nvcheatsheet",
	"terminal",
	"Trouble",
	"help",
	"man",
	"prompt",
  "plain text"
}

local bufnr = vim.fn.bufnr
local getbufvar = vim.fn.getbufvar
local bufsetvar = vim.api.nvim_buf_set_var
local winsetopt = vim.api.nvim_win_set_option

local function toggle_color_column()
	local currBuf = bufnr()
	local enableCC = getbufvar(currBuf, "enableCC")

	if enableCC ~= nil and enableCC == 1 then
		bufsetvar(currBuf, "enableCC", 0)
		winsetopt(0, "colorcolumn", "")
	else
		bufsetvar(currBuf, "enableCC", 1)
		winsetopt(0, "colorcolumn", "80,120")
	end
end

createCmd("ToggleColorColumn", function()
	toggle_color_column()
end, {})

createAutoCmd({ "BufWinEnter" }, {
	callback = function()
		if
			vim.tbl_contains(blacklist, vim.bo.buftype)
			or vim.tbl_contains(blacklist, vim.bo.filetype)
		then
      winsetopt(0, "colorcolumn", "")
		end
	end,
})
createAutoCmd({ "BufLeave" }, {
	callback = function()
		winsetopt(0, "colorcolumn", "")
	end,
})
