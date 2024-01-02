local createAutoCmd = vim.api.nvim_create_autocmd
local tbl_contains = vim.tbl_contains

createAutoCmd("BufEnter", {
  callback = function()
    if vim.bo.filetype == "httpResponse" then
      vim.opt_local.wrap = false
    end
  end,
})
