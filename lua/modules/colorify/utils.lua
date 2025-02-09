local M = {}
local api = vim.api
local get_extmarks = api.nvim_buf_get_extmarks
local conf = require("modules.config").colorify
local ns = require("modules.colorify.state").ns

M.is_dark = function(hex)
  hex = hex:gsub("#", "")

  local r, g, b = tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
  local brightness = (r * 299 + g * 587 + b * 114) / 1000

  return brightness < 128
end

M.add_hl = function(hex)
  local name = "hex_" .. hex:sub(2)

  local fg, bg = hex, hex

  if conf.mode == "bg" then
    fg = M.is_dark(hex) and "white" or "black"
  else
    bg = "none"
  end

  api.nvim_set_hl(0, name, { fg = fg, bg = bg, default = true })
  return name
end

M.not_colored = function(buf, linenr, col, hl_group, opts)
  local ms = get_extmarks(buf, ns, { linenr, col }, { linenr, opts.end_col }, { details = true })

  if #ms == 0 then
    return true
  end

  ms = ms[1]
  opts.id = ms[1]
  return hl_group ~= (ms[4].hl_group or ms[4].virt_text[1][2])
end

return M
