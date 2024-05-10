local config = require "env.config.files"

return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-telescope/telescope-media-files.nvim",
      "tsakirist/telescope-lazy.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      },
    },
    cmd = { "Telescope" },
    keys = function()
      return config.telescopeKeys()
    end,
    opts = function()
      return config.telescope()
    end,
    config = function(_, opts)
      require("telescope").setup(opts)

      pcall(require("telescope").load_extension "fzf")
      pcall(require("telescope").load_extension "media_files")
      pcall(require("telescope").load_extension "lazy")
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    event = "UIEnter",
    keys = function()
      return config.nvimTreeKeys()
    end,
    opts = function()
      return config.nvimTree
    end,
    config = function(_, opts)
      require("nvim-tree").setup(opts)
    end,
  },
}
