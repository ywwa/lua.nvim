local settings = {
  presence = 2,
  scrolloff = 10,
  colorcolumn = "80",

  ignoreFt = {
    "NvimTree",
    "nvdash",
    "nvcheatsheet",
    "terminal",
    "Trouble",
    "help",
    "man",
  },
}

local create_cmd = vim.api.nvim_create_user_command
local create_autocmd = vim.api.nvim_create_autocmd

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

-- commands

create_cmd("ToggleColorColumn", function()
  vim.b.enableColorColumn = not vim.b.enableColorColumn

  if vim.b.enableColorColumn then
    vim.opt_local.cc = settings.colorcolumn
  else
    vim.opt_local.cc = "0"
  end
end, {})

-- autocommands

create_autocmd({ "UIEnter" }, {
  callback = function()
    local handle = io.popen "pgrep nvim | wc -l"
    local output = handle:read "*a"
    handle:close()
    if tonumber(output) == settings.presence then
      require("lazy").load { plugins = { "presence.nvim" } }
    end
  end,
})

create_autocmd({ "BufEnter" }, {
  callback = function()
    vim.o.scrolloff = (vim.tbl_contains(settings.ignoreFt, vim.bo.ft) and 0 or settings.scrolloff)
  end,
})

create_autocmd({ "FileType" }, {
  callback = function()
    if vim.g.enableColorColumn then
      vim.opt_local.cc = (vim.tbl_contains(settings.ignoreFt, vim.bo.ft) and "0" or settings.colorcolumn)
    end
  end,
})
