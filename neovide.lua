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
