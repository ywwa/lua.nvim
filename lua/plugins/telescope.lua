---@diagnostic disable: different-requires
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-telescope/telescope-media-files.nvim",
    "tsakirist/telescope-lazy.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
  },
  cmd = { "Telescope" },
  keys = { "<leader>ff", "<leader>lg", "<leader>ca" },
  opts = function()
    return require "plugins.config.telescope"
  end,
  config = function(_, opts)
    require("telescope").setup(opts)

    pcall(require("telescope").load_extension "ui-select")
    pcall(require("telescope").load_extension "fzf")
    pcall(require("telescope").load_extension "media_files")
    pcall(require("telescope").load_extension "lazy")
  end,
}
