local create_autocmd = vim.api.nvim_create_autocmd

local settings = require("custom.chadrc").custom

-- Discord RPC
create_autocmd({ "UIEnter" }, {
  callback = function()
    local handle = io.popen "pgrep nvim | wc -l"
    local output = handle:read "*a"
    handle:close()

    if tonumber(output) == settings.presence then
      require("lazy").load { plugins = { "presence.nvim" } }
    end
  end,
})

create_autocmd({ "BufEnter" }, {
  callback = function()
    vim.o.scrolloff = (vim.tbl_contains(settings.ignoreFt, vim.bo.ft) and 0 or settings.scrolloff)
  end,
})

create_autocmd({ "FileType" }, {
  callback = function()
    if vim.g.ccEnable then
      vim.opt_local.cc = (vim.tbl_contains(settings.ignoreFt, vim.bo.ft) and "0" or settings.colorcolumn)
    end
  end,
})
