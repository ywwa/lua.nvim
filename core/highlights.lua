local M = {}

---@type Base46HLGroupsList
M.override = {
	Folded = {
		bg = "NONE",
		fg = "grey",
	},
	CursorLineNr = {
		fg = "pink",
	},
}

---@type HLTable
M.add = {
	FoldColumn = {
		fg = "grey",
		bg = "NONE",
		bold = true,
		sp = "NONE",
	},
	VirtColumn = {
		fg = "lightbg",
	},
	StCcIcon = {
		fg = "black",
		bg = "pink",
	},
	StCcText = {
		fg = "pink",
		bg = "#262a2f",
	},
}

return M
