require "custom.commands"
require "custom.neovide"

-- Custom code snippets
local snippetpath = vim.fn.stdpath "config" .. "/lua/custom/snippets"
vim.g.vscode_snippets_path = snippetpath


-- vim.cmd("set nowrap")
vim.opt.rnu = true
vim.opt.ruler = true
