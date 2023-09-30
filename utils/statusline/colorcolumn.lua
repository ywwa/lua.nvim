local M = {}

M.StMod_Cc_Status = function()
	local blacklist = require("custom.confrc").blacklist

	-- if not in blacklist
	if not vim.tbl_contains(blacklist, vim.bo.filetype) then
		-- if colorcolumn is enabled
		if vim.g.enableColorColumn then
			return "%#StCcIcon# 󰛐 %#StCcText# ON %#ST_EmptySpace# "
		end
		return "%#StCcIcon# 󰛑 %#StCcText# OFF %#ST_EmptySpace# "
	end
	return ""
end

M.StMod_Cc_Width = function()
	local blacklist = require("custom.confrc").blacklist

	-- if not in blacklist
	if
		not vim.tbl_contains(blacklist, vim.bo.filetype)
		and not vim.tbl_contains(blacklist, vim.bo.buftype)
	then
		-- if cc enabled
		if vim.g.enableColorColumn then
			return "%#St_giticons#"
				.. tostring(vim.b.virtcolumn_items[1])
				.. "%#ST_EmptySpace# "
		end
	end
	return ""
end

return M
