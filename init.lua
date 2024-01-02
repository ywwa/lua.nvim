vim.opt.foldcolumn = "1"
vim.opt.foldlevelstart = 99
vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

require("custom.core.functions.presence")
require("custom.core.functions.colorcolumn")
require("custom.core.functions.scrolloff")
require("custom.core.functions.wrap")

vim.opt.relativenumber = true
vim.api.nvim_buf_set_var(0, "enableColorColumn", 0)
