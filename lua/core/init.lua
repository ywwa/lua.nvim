local opt = vim.opt
local g = vim.g

local api = vim.api

g.mapleader = " "
g.maplocalleader = " "

opt.number = true
opt.relativenumber = true
opt.ruler = false

-- disable intro
opt.shortmess:append "sI"

-- indent
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.laststatus = 3
opt.showmode = false
opt.clipboard = "unnamedplus"
opt.mouse = "a"

opt.cursorline = true
opt.cursorlineopt = "number"

opt.foldcolumn = "1"
opt.foldlevelstart = 99
opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
opt.ignorecase = true
opt.smartcase = true

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.timeoutlen = 400
opt.undofile = true

opt.updatetime = 250

g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0
g.loaded_node_provider = 0
g.loaded_perl_provider = 0

vim.cmd.colorscheme "habamax"

-- dont list quickfix buffers
api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.fn.stdpath "data"
  .. "/mason/bin"
  .. (is_windows and ";" or ":")
  .. vim.env.PATH

api.nvim_create_autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
  group = api.nvim_create_augroup("NvFilePost", { clear = true }),
  callback = function(args)
    local file = api.nvim_buf_get_name(args.buf)
    local buftype = api.nvim_buf_get_option(args.buf, "buftype")

    if not g.ui_entered and args.event == "UIEnter" then
      g.ui_entered = true
    end

    if file ~= "" and buftype ~= "nofile" and g.ui_entered then
      api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
      api.nvim_del_augroup_by_name "NvFilePost"

      vim.schedule(function()
        api.nvim_exec_autocmds("FileType", {})

        if g.editorconfig then
          require("editorconfig").config(args.buf)
        end
      end, 0)
    end
  end,
})
