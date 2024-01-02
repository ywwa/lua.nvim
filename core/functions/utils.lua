---@diagnostic disable: need-check-nil

local M = {}
M.replace_word = function(old, new)
	local varslua = vim.fn.stdpath("config")
		.. "/lua/custom/core/"
		.. "vars.lua"
	local file = io.open(varslua, "r")
	local added_pattern = string.gsub(old, "-", "%%-") -- add % before - if exists
	local new_content = file:read("*all"):gsub(added_pattern, new)

	file = io.open(varslua, "w")
	file:write(new_content)
	file:close()
end

return M
