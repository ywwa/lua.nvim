local config = require("custom.core.config")
local create_autocmd = vim.api.nvim_create_autocmd
local create_cmd = vim.api.nvim_create_user_command
local tbl_contains = vim.tbl_contains

local getbufvar = vim.fn.getbufvar
local bufsetvar = vim.api.nvim_buf_set_var
local winsetopt = vim.api.nvim_win_set_option

---@diagnostic disable: need-check-nil
local function nvimInstance()
	local handle = io.popen("pgrep nvim | wc -l")
	local output = handle:read("*a")
	handle:close()

	return tonumber(output)
end

---@diagnostic disable: need-check-nil
local M = {}

M.replace_word = function(old, new)
	local varslua = vim.fn.stdpath("config")
		.. "/lua/custom/core/"
		.. "config.lua"
	local file = io.open(varslua, "r")
	local added_pattern = string.gsub(old, "-", "%%-") -- add % before - if exists
	local new_content = file:read("*all"):gsub(added_pattern, new)

	file = io.open(varslua, "w")
	file:write(new_content)
	file:close()
end

M.rpc = function()
	if config.enableRPC == true then
		create_autocmd({ "UIEnter" }, {
			callback = function()
				if nvimInstance() == 2 then
					require("lazy").load({ plugins = { "neocord" } })
				end
			end,
		})
	end
end

M.scrolloff = function()
	if config.enableSO == true then
		create_autocmd({ "BufEnter" }, {
			callback = function()
				if
					tbl_contains(config.blackList, vim.bo.filetype)
					or tbl_contains(config.blackList, vim.bo.buftype)
				then
					vim.opt_local.so = 0
				else
					vim.opt_local.so = config.soValue
				end
			end,
		})
	end
end

M.colorcolumn = function()
	vim.g.virtcolumn_char = "│"
	vim.g.virtcolumn_priority = 666

	local function toggleColorColumn()
		local currBuf = vim.fn.bufnr()
		local enableCC = getbufvar(currBuf, "enableCC")

		if enableCC ~= nil and enableCC == 1 then
			bufsetvar(currBuf, "enableCC", 0)
			winsetopt(0, "colorcolumn", "")
		else
			bufsetvar(currBuf, "enableCC", 1)
			winsetopt(0, "colorcolumn", config.ccValue)
		end
	end

	create_cmd("ToggleColorColumn", function()
		toggleColorColumn()
	end, {})

	create_autocmd({ "BufWinEnter" }, {
		callback = function()
			if
				tbl_contains(config.blackList, vim.bo.filetype)
				or tbl_contains(config.blackList, vim.bo.buftype)
			then
				winsetopt(0, "colorcolumn", "")
			end
		end,
	})

	create_autocmd({ "BufLeave" }, {
		callback = function()
			winsetopt(0, "colorcolumn", "")
		end,
	})
end

return M
