local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

local function install()
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"

  local output = vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "--branch=stable",
    lazyrepo,
    lazypath,
  }

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim\n", "ErrorMsg" },
      { output, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})

    vim.fn.getchar()
    os.exit(1)
  end
end

local function init()
  vim.opt.rtp:prepend(lazypath)
  require("lazy").setup(require "config.lazy")
end

if not vim.uv.fs_stat(lazypath) then
  install()
  init()
-- vim.cmd("MasonInstallAll")
else
  init()
end
