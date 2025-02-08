return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  cmd = { "Telescope" },
  dependencies = { "nvim-telescope/telescope-ui-select.nvim" },
  keys = function()
    local builtin = require "telescope.builtin"
    return {
      { "<leader>ff", builtin.find_files, desc = "Find files" },
      { "<leader>lg", builtin.live_grep, desc = "Live grep" },
      {
        "<leader>fh",
        function()
          builtin.find_files { hidden = true, ignore = true, no_ignore = true }
        end,
        desc = "Find All files",
      },
      {
        "<leader>lh",
        function()
          builtin.live_grep {
            glob_pattern = { "!.next/", "!node_modules" },
            additional_args = { "--hidden", "--no-ignore" },
          }
        end,
        desc = "Live grep all",
      },
    }
  end,
  opts = {
    defaults = {
      prompt_prefix = "   ",
      selection_caret = " ",
      entry_prefix = " ",
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
        },
        width = 0.87,
        height = 0.80,
      },
      mappings = {
        n = { ["q"] = require("telescope.actions").close },
      },
    },

    extensions = {
      ["ui-select"] = { require("telescope.themes").get_dropdown {} },
    },
  },
  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension "ui-select"
  end,
}
