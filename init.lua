local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

autocmd({"ModeChanged"}, {
  pattern = { "s:n", "i:*" },
  callback = function ()
    if
      require("luasnip").session.current_nodes[
        vim.api.nvim_get_current_buf()
      ]
      and not require("luasnip").session.jump_active
    then
      require("luasnip").unlink_current()
    end
  end,
})

-- Custom code snippets
local snippetpath = vim.fn.stdpath "config" .. "/lua/custom/snippets"
vim.g.vscode_snippets_path = snippetpath


-- vim.cmd("set nowrap")

vim.opt.colorcolumn = "80"
vim.opt.rnu = true
