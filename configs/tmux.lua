local M = {}

M.setup = function()
  require("tmux").setup {
    copy_sync = {
      enable = true,
      sync_clipboard = true,
      sync_registers = true,
      sync_deletes   = true,
      sync_unnamed   = true
    },
    navigation = {
      cycle_navigation = true,
      enable_default_keybindings = false,
      persist_zoom = false
    },
    resize = {
      enable_default_keybindings = true,
      resize_step_x = 2,
      resize_step_y = 2
    }
  }
end

M.keys = {
  {
    "<C-h>",
    "<cmd> lua require('tmux').move_left() <CR>",
    desc = "Move Left"
  },
  {
    "<C-j>",
    "<cmd> lua require('tmux').move_bottom() <CR>",
    desc = "Move Down"
  },
  {
    "<C-k>",
    "<cmd> lua require('tmux').move_top() <CR>",
    desc = "Move Up"
  },
  {
    "<C-l>",
    "<cmd> lua require('tmux').move_right() <CR>",
    desc = "Move Right"
  }

}

return M
