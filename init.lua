vim.opt.foldcolumn = "1"
vim.opt.foldlevelstart = 99
vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
require("custom.core.presence")
require("custom.core.colorcolumn")
require("custom.core.scrolloff")
-- vim.g.enableColorColumn = false
vim.opt.relativenumber = true
