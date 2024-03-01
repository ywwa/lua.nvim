local opt = vim.opt

opt.foldcolumn = "1"
opt.foldlevelstart = 99
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

require "custom.utils"
