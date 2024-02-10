local opt = vim.opt
local utils = require("custom.core.functions.utils")

opt.foldcolumn = "1"
opt.foldlevelstart = 99
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

utils.rpc()
utils.scrolloff()
utils.colorcolumn()

opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.relativenumber = true
vim.api.nvim_buf_set_var(0, "enableColorColumn", 0)
