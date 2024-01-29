local utils = require("custom.core.functions.utils")

vim.opt.foldcolumn = "1"
vim.opt.foldlevelstart = 99
vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

utils.rpc()
utils.scrolloff()
utils.colorcolumn()

vim.opt.relativenumber = true
vim.api.nvim_buf_set_var(0, "enableColorColumn", 0)
