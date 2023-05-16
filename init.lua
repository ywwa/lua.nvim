require "custom.commands"
require "custom.neovide"

-- Custom code snippets
local snippetpath = vim.fn.stdpath "config" .. "/lua/custom/snippets"
vim.g.vscode_snippets_path = snippetpath


-- vim.cmd("set nowrap")

vim.opt.colorcolumn = "80"
vim.opt.rnu = true

