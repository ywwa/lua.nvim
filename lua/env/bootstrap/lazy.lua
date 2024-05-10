local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

local function setup()
  vim.opt.rtp:prepend(lazypath)
  local config = require "env.config.lazy"
  require("lazy").setup("plugins", config)
end

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  }
  setup()
  vim.cmd "MasonInstallAll"
end

setup()
