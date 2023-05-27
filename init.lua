require "custom.commands"
require "custom.neovide"

local opt = vim.opt
local g = vim.g

-- Custom code snippets
local snippetpath = vim.fn.stdpath "config" .. "/lua/custom/snippets"
g.vscode_snippets_path = snippetpath


opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.relativenumber = true
opt.wrap = false

vim.o.spelllang = "en_us"

opt.foldcolumn = "1"
opt.foldlevel = 1
opt.foldnestmax = 2
opt.foldenable = true
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

