return {
  "s1n7ax/nvim-terminal",
  keys = { "<leader>1", "<leader>2", "<leader>3", "<leader>4", "<leader>5" },
  opts = {
    window = {
      position = "botright",
      split = "sp",
      width = 30,
      height = 15,
    },

    disable_default_keymaps = false,

  },
  config = function(_, opts)
    vim.o.hidden = true

    require("nvim-terminal").setup(opts)
    

  end,
}
