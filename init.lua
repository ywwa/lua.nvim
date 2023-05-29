require "custom.commands"
require "custom.extras"

local opt = vim.opt
local g = vim.g

-- Custom snippets
local spath = vim.fn.stdpath "config" .. "/lua/custom/snippet"
g.vscode_snippets_path = spath

opt.backup = false
opt.swapfile = false

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.relativenumber = true
opt.wrap = false
vim.o.spelllang = "en_us"

opt.foldcolumn = "1"
opt.foldlevel = 1
opt.foldnestmax = 2
opt.foldlevelstart = 99
opt.foldenable = true
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
opt.signcolumn = "auto:1-2"
