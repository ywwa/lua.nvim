local config = require("custom.chadrc").utils
local autocmd = vim.api.nvim_create_autocmd
local winsetopt = vim.api.nvim_win_set_option
local M = {}

M.setup = function()
  autocmd({ "BufEnter" }, {
    callback = function()
      if config.so.enabled then
        if
          vim.tbl_contains(config.blacklist, vim.bo.filetype)
          or vim.tbl_contains(config.blacklist, vim.bo.buftype)
        then
          winsetopt(0, "scrolloff", 0)
        else
          winsetopt(0, "scrolloff", config.so.value)
        end
      end
    end,
  })
end

return M
