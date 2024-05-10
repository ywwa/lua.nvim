local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.maplocalleader = " "

vim.cmd "colorscheme habamax"

opt.number = true
opt.numberwidth = 2
opt.relativenumber = true
opt.ruler = false

-- disable intro
opt.shortmess:append "sI"

-- wrap cursor when reach line start/end
opt.whichwrap:append "<>[]hl"

-- indent
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

-- statusline
opt.laststatus = 3
opt.showmode = false

-- clipboard
opt.clipboard = "unnamedplus"

-- mouse
opt.mouse = "a"

-- cursorline
opt.cursorline = true
opt.cursorlineopt = "number"

-- foldcolumn
opt.foldcolumn = "1"
opt.foldlevelstart = 99
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- signcolumn
opt.signcolumn = "yes"

-- misc
opt.ignorecase = true
opt.smartcase = true
opt.splitbelow = true
opt.splitright = true
opt.timeoutlen = 400
opt.undofile = true
opt.updatetime = 250

opt.colorcolumn = "80"
opt.scrolloff = 10
opt.wrap = false

-- disabling some builtin vim plugins
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0
g.loaded_node_provider = 0
g.loaded_perl_provider = 0

-- TODO: Add option to add node_modules binaries to path aswell
-- (mostly for just typescript in nextjs projects)
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.fn.stdpath "data"
  .. "/mason/bin"
  .. (is_windows and ";" or ":")
  .. vim.env.PATH
