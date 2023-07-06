require "custom.autocmd"

local opt = vim.opt

opt.backup = false
opt.swapfile = false
opt.relativenumber = true
opt.wrap = false
opt.foldcolumn = "1"
opt.foldlevel = 1
opt.foldnestmax = 2
opt.foldlevelstart = 99
opt.foldenable = true
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
opt.signcolumn = "auto:1-2"
