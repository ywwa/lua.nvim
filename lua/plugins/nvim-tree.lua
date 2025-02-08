return {
  "nvim-tree/nvim-tree.lua",
  keys = {
    {
      "<C-n>",
      function()
        require("nvim-tree.api").tree.toggle()
      end,
      desc = "Toggle filetree",
    },
  },
  opts = require "config.nvim-tree",
}
