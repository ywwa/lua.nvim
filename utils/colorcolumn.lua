vim.g.virtcolumn_char = "│"
-- vim.g.virtcolumn_char = "▕"
vim.g.virtcolumn_priority = 50
-- vim.opt.cc = "80"

local createCmd = vim.api.nvim_create_user_command
local createAutoCmd = vim.api.nvim_create_autocmd

createCmd("ToggleColorColumn", function()
  vim.g.enableColorColumn = not vim.g.enableColorColumn

  if vim.g.enableColorColumn then
    vim.opt.cc = "80"
  else
    vim.opt.cc = "0"
  end
end, {})

createAutoCmd({ "BufEnter" }, {
  callback = function()
    if vim.g.enableColorColumn then
      local blacklist = require("custom.confrc").blacklist
      if vim.tbl_contains(blacklist, vim.bo.ft) or vim.tbl_contains(blacklist, vim.bo.bt) then
        vim.opt_local.cc = "0"
      end
    end
  end,
})
