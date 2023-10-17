local M = {}

M.StModCCStatus = function()
  local blacklist = require("custom.confrc").blacklist

  if not vim.tbl_contains(blacklist, vim.bo.ft) then
    if not vim.g.enableColorColumn then
      return "%#StCcIcon# 󰛑 %#StCcText# OFF %#ST_EmptySpace# "
    end
    return "%#StCcIcon# 󰛐 %#StCcText# ON %#ST_EmptySpace# "
  end
  return ""
end

M.StModCCWidth = function()
  local blacklist = require("custom.confrc").blacklist

  local function genString(table)
    local tmp = ""
    for i, value in ipairs(table) do
      if i > 1 then
        tmp = ";" .. tmp
      end
      tmp = value .. tmp
    end
    return tmp
  end

  if
    not vim.tbl_contains(blacklist, vim.bo.ft)
    and not vim.tbl_contains(blacklist, vim.bo.bt)
    and vim.g.enableColorColumn
  then
    return "%#St_giticons#"
      .. genString(vim.b.virtcolumn_items)
      .. "%#ST_EmptySpace#"
  end
  return ""
end

M.StModNvimTreePadding = function()
  local function getNvimTreeWidth()
    for _, win in pairs(vim.api.nvim_tabpage_list_wins(0)) do
      if vim.bo[vim.api.nvim_win_get_buf(win)].ft == "NvimTree" then
        return vim.api.nvim_win_get_width(win) + 1
      end
    end
    return 0
  end

  return "%#NvimTreeNormal#"
    .. (
      vim.g.nvimtree_side == "right" and ""
      or string.rep(" ", getNvimTreeWidth())
    )
end

return M
