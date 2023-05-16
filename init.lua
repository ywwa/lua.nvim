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

if package.loaded["peek"] then
  vim.api.nvim_create_user_command(
    "PeekOpen",require("peek").open, {}
  )
  vim.api.nvim_create_user_command(
  "PeekClose",
  require("peek").close,
  {}
  )
end


if vim.g.neovide then
  -- Neovide configuration
  vim.o.guifont = "CaskaydiaCove Nerd Font:h12"
  vim.opt.linespace=0
  vim.neovide_scale_factor = 0.85
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_refresh_rate = 120
  vim.g.neovide_fullscreen = true
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_cursor_trail_size=0.3
end
