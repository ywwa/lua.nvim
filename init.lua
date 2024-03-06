require "core"

-- setup lazy.nvim plugin manager
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }

  vim.opt.rtp:prepend(lazypath)
  local config = require "plugins.config.lazy"
  require("lazy").setup("plugins", config)
  vim.cmd "MasonInstallAll"
end
vim.opt.rtp:prepend(lazypath)
local config = require "plugins.config.lazy"
require("lazy").setup("plugins", config)

require "core.mappings"
