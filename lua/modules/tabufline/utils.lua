local M = {}
local api = vim.api
local buf_name = api.nvim_buf_get_name
local cur_buf = api.nvim_get_current_buf
local fn = vim.fn
local get_hl = api.nvim_get_hl
local strep = string.rep
local get_opt = api.nvim_get_option_value

M.txt = function(str, hl)
  str = str or ""
  local a = "%#Tb" .. hl .. "#" .. str
  return a
end

M.btn = function(str, hl, func, arg)
  str = hl and M.txt(str, hl) or str
  arg = arg or ""
  return "%" .. arg .. "@Tb" .. func .. "@" .. str .. "%X"
end

local function filename(str)
  return str:match "([^/\\]+)[/\\]*$"
end

local btn = M.btn
local txt = M.txt

local function new_hl(group1, group2)
  local fg = get_hl(0, { name = group1 }).fg
  local bg = get_hl(0, { name = "Tb" .. group2 }).bg
  api.nvim_set_hl(0, group1 .. group2, { fg = fg, bg = bg })
  return "%#" .. group1 .. group2 .. "#"
end

local function gen_unique_name(oldname, index)
  for i2, nr2 in ipairs(vim.t.bufs) do
    if index ~= i2 and filename(buf_name(nr2)) == oldname then
      return fn.fnamemodify(buf_name(vim.t.bufs[index]), ":p:.")
    end
  end
end

M.style_buf = function(nr, i, w)
  local icon = "󰈚 "
  local is_curbuf = cur_buf() == nr
  local tbHlName = "Buf0" .. (is_curbuf and "n" or "ff")
  local icon_hl = new_hl("DevIconDefault", tbHlName)

  local name = filename(buf_name(nr))
  name = gen_unique_name(name, i) or name
  name = (name == "" or not name) and " No Name " or name

  if name ~= " No Name " then
    local devicon, devicon_hl = require("nvim-web-devicons").get_icon(name)

    if devicon then
      icon = " " .. devicon .. " "
      icon_hl = new_hl(devicon_hl, tbHlName)
    end
  end

  local pad = math.floor((w - #name - 5) / 2)
  pad = pad <= 0 and 1 or pad

  local maxname_len = 15

  name = string.sub(name, 1, 13) .. (#name > maxname_len and ".." or "")
  name = M.txt(name, tbHlName)

  name = strep(" ", pad - 1) .. (icon_hl .. icon .. name) .. strep(" ", pad - 1)

  local close_btn = btn(" 󰅖 ", nil, "KillBuf", nr)
  name = btn(name, nil, "GoToBuf", nr)

  local mod = get_opt("mod", { buf = nr })
  local cur_mod = get_opt("mod", { buf = 0 })

  if is_curbuf then
    close_btn = cur_mod and txt("  ", "BufOnModified") or txt(close_btn, "BufOnClose")
  else
    close_btn = mod and txt("  ", "BufOffModified") or txt(close_btn, "BufOffClose")
  end

  name = txt(name .. close_btn, "Buf0" .. (is_curbuf and "n" or "ff"))

  return name
end

return M
