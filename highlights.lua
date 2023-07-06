-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
  NvDashAscii = {
    bg = "NONE",
    fg = "baby_pink",
  },
  NvDashButtons = {
    bg = "NONE",
    fg = "grey",
    italic = true,
  },
  Folded = { bg = "NONE" },
}

---@type HLTable
M.add = {
  FoldColumn = { bg = "black", bold = true },
}

return M
