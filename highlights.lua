local M = {}

---@type Base46HLGroupsList
M.override = {
  Folded = {
    bg = "NONE",
    fg = "grey",
  }
}

---@type HLTable
M.add = {
  FoldColumn = {
    fg = "grey",
    bg = "black",
    bold = true,
    sp = "NONE"
  },
  VirtColumn = {
    fg="lightbg"
  },
  StCcIcon= {
    fg = "black",
    bg = "pink"
  },
  StCcText = {
    fg = "pink",
    bg = "#262a2f"
  }
}

return M
