---@diagnostic disable: different-requires
return {
  "nvim-tree/nvim-tree.lua",
  event = "UIEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    return require "plugins.config.nvim-tree"
  end,
  config = function(_, opts)
    require("nvim-tree").setup(opts)
    vim.keymap.set("n", "<C-n>", function()
      require("nvim-tree.api").tree.toggle()
    end, { desc = "Toggle NvimTree" })
  end,
}
