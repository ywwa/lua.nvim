return {
  "numToStr/Navigator.nvim",
  event = "VimEnter",
  keys = function()
    local nav = require "Navigator"
    return {
      { "<C-h>", nav.left, desc = "Move left" },
      { "<C-j>", nav.down, desc = "Move down" },
      { "<C-k>", nav.up, desc = "Move up" },
      { "<C-l>", nav.right, desc = "Move right" },
    }
  end,
  opts = {},
}
