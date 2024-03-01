local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
  Folded = {
    bg = "NONE",
    fg = "grey",
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
  FoldColumn = {
    fg = "grey",
    bg = "NONE",
    bold = true,
    sp = "NONE",
  },
}

return M
