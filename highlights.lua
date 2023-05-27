local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
  NvDashAscii = {
    bg = "none",
    fg = "pink",
  },
  NvDashButtons = {
    fg = "grey_fg",
    bg = "none",
  },
  ColorColumn = {
    bg = "NONE",
  },
  NvimTreeRootFolder = {
    fg = "darker_black",
    bg = "darker_black",
  },
  Folded = {
    bg = "black",
  },
  IndentBlanklineContextStart = {
    bg = "none",
  },
}

---@type HLTable
M.add = {
  FoldColumn = {
    bg = "black",
  },
}

return M
