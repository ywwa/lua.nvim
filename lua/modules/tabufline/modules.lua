local api = vim.api
local fn = vim.fn
local g = vim.g

local txt = require("modules.tabufline.utils").txt
local btn = require("modules.tabufline.utils").btn
local strep = string.rep
local style_buf = require("modules.tabufline.utils").style_buf
local cur_buf = api.nvim_get_current_buf
local opts = require("modules.config").tabufline

local M = {}

-- button functions
vim.cmd [[
  function! TbGoToBuf(bufnr,b,c,d)
    call luaeval('require("modules.tabufline").goto_buf(_A)', a:bufnr)
  endfunction]]

vim.cmd [[
  function! TbKillBuf(bufnr,b,c,d) 
    call luaeval('require("modules.tabufline").close_buffer(_A)', a:bufnr)
  endfunction]]

vim.cmd "function! TbNewTab(a,b,c,d) \n tabnew \n endfunction"
vim.cmd "function! TbGotoTab(tabnr,b,c,d) \n execute a:tabnr ..'tabnext' \n endfunction"
vim.cmd "function! TbCloseAllBufs(a,b,c,d) \n lua require('modules.tabufline').closeAllBufs() \n endfunction"
vim.cmd "function! TbToggleTabs(a,b,c,d) \n let g:TbTabsToggled = !g:TbTabsToggled | redrawtabline \n endfunction"

-- functions

local function getNvimTreeWidth()
  for _, win in ipairs(api.nvim_tabpage_list_wins(0)) do
    if vim.bo[api.nvim_win_get_buf(win)].ft == "NvimTree" then
      return api.nvim_win_get_width(win)
    end
  end

  return 0
end

local function available_space()
  local str = ""

  for _, key in ipairs(opts.order) do
    if key ~= "buffers" then
      str = str .. M[key]()
    end
  end

  local modules = api.nvim_eval_statusline(str, { use_tabline = true })
  return vim.o.columns - modules.width
end

-- modules

M.treeOffset = function()
  local w = getNvimTreeWidth()
  return w == 0 and "" or "%#NvimTreeNormal#" .. strep(" ", w) .. "%#NvimTreeWinSeparator#" .. "│"
end

M.buffers = function()
  local buffers = {}
  local has_current = false

  for i, nr in ipairs(vim.t.bufs) do
    if ((#buffers + 1) * opts.bufWidth) > available_space() then
      if has_current then
        break
      end

      table.remove(buffers, 1)
    end

    has_current = cur_buf() == nr or has_current
    table.insert(buffers, style_buf(nr, i, opts.bufWidth))
  end

  return table.concat(buffers) .. txt("%=", "Fill")
end

g.TbTabsToggled = 0

M.tabs = function()
  local result, tabs = "", fn.tabpagenr "$"

  if tabs > 1 then
    for nr = 1, tabs, 1 do
      local tab_hl = "Tab0" .. (nr == fn.tabpagenr() and "n" or "ff")
      result = result .. btn(" " .. nr .. " ", tab_hl, "GotoTab", nr)
    end

    local new_tabBtn = btn(" 󰐕 ", "TabNewBtn", "NewTab")
    local tabstoggleBtn = btn(" TABS ", "TabTitle", "ToggleTabs")
    local small_btn = btn(" 󰅁 ", "TabTitle", "ToggleTabs")

    return g.TbTabsToggled == 1 and small_btn or new_tabBtn .. tabstoggleBtn .. result
  end

  return ""
end

M.btns = function()
  local closeAllBufs = btn(" 󰅖 ", "CloseAllBufsBtn", "CloseAllBufs")

  return closeAllBufs
end

return function()
  local result = {}

  if opts.modules then
    for key, value in ipairs(opts.modules) do
      M[key] = value
    end
  end

  for _, v in ipairs(opts.order) do
    table.insert(result, M[v]())
  end

  return table.concat(result)
end
