local config = require("custom.chadrc").utils

local setvar = vim.api.nvim_set_var
local getvar = vim.api.nvim_get_var
local winsetopt = vim.api.nvim_win_set_option
local autocmd = vim.api.nvim_create_autocmd

local M = {}

-- Toggle colorcolumn on/off
M.toggleCC = function()
  local state = getvar "enable_cc"
  if state == true then
    setvar("enable_cc", not state)
    winsetopt(0, "colorcolumn", "")
  else
    setvar("enable_cc", not state)
    winsetopt(0, "colorcolumn", config.cc.values)
  end
end

M.setup = function()
  setvar("enable_cc", config.cc.enabled)
  if getvar "enable_cc" == true then
    winsetopt(0, "colorcolumn", config.cc.values)
  end

  autocmd({ "BufCreate", "BufEnter", "BufWinEnter" }, {
    callback = function()
      if
        vim.tbl_contains(config.blacklist, vim.bo.filetype)
        or vim.tbl_contains(config.blacklist, vim.bo.buftype)
        or (vim.api.nvim_get_mode()["mode"] == "t")
      then
        winsetopt(0, "colorcolumn", "")
      end
    end,
  })
end

return M
