---@diagnostic disable: different-requires
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-telescope/telescope-media-files.nvim",
    "tsakirist/telescope-lazy.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
    },
    "barrett-ruth/telescope-http.nvim",
  },
  cmd = { "Telescope" },
  -- keys = { "<leader>ff", "<leader>lg", "<leader>ca" },
  keys = {
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Telescope Find files",
    },
    {
      "<leader>FF",
      function()
        require("telescope.builtin").find_files { hidden = true }
      end,
      desc = "Telescope Find files (hidden)",
    },
    {
      "<leader>lg",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Telescope Live grep",
    },
  },
  opts = function()
    return require "plugins.config.telescope"
  end,
  config = function(_, opts)
    require("telescope").setup(opts)

    pcall(require("telescope").load_extension "fzf")
    pcall(require("telescope").load_extension "media_files")
    pcall(require("telescope").load_extension "lazy")
    pcall(require("telescope").load_extension "http")
  end,
}
