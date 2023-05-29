local M = {}

M.keys = {
  {
    "<C-h>",
    function()
      require("tmux").move_left()
    end,
    desc = "Move Left",
  },
  {
    "<C-j>",
    function()
      require("tmux").move_bottom()
    end,
    desc = "Move Down",
  },
  {
    "<C-k>",
    function()
      require("tmux").move_top()
    end,
    desc = "Move Up",
  },
  {
    "<C-l>",
    function()
      require("tmux").move_right()
    end,
    desc = "Move Right",
  },

  -- resize keymaps
  {
    "H",
    function()
      require("tmux").resize_left()
    end,
    desc = "Resize Left",
  },
  {
    "J",
    function()
      require("tmux").resize_bottom()
    end,
    desc = "Resize Down",
  },
  {
    "K",
    function()
      require("tmux").resize_top()
    end,
    desc = "Resize Up",
  },
  {
    "L",
    function()
      require("tmux").resize_right()
    end,
    desc = "Resize Right",
  },
}

M.setup = function()
  require("tmux").setup {
    copy_sync = {
      enable = true,
      sync_clipboard = true,
      sync_registers = true,
      sync_deletes = true,
      sync_unnamed = true,
    },
    navigation = {
      cycle_navigation = true,
      enable_default_keybindings = false,
      persist_zoom = false,
    },
    resize = {
      enable_default_keybindings = false,
      resize_step_x = 2,
      resize_step_y = 2,
    },
  }
end

return M
