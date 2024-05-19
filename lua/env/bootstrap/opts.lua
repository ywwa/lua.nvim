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


local cwd = vim.fn.getcwd()
local tsserverBin = cwd .. "/node_modules/typescript/bin"

local function is_dir(path)
  local stat = vim.loop.fs_stat(path)
  return stat and stat.type == "directory"
end

local function is_file(path)
  local stat = vim.loop.fs_stat(path)
  return stat and stat.type == "file"
end

-- add tsserver binary from node_modules to path 
if is_dir(cwd .. "/node_modules") then
  if is_file(tsserverBin .. "/tsserver") then
    local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
    vim.env.PATH = tsserverBin
      .. (is_windows and ";" or ":")
      .. vim.fn.stdpath "data"
      .. "/mason/bin"
      .. (is_windows and ";" or ":")
      .. vim.env.PATH
  end
else
  local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
  vim.env.PATH = vim.fn.stdpath "data"
    .. "/mason/bin"
    .. (is_windows and ";" or ":")
    .. vim.env.PATH
end
