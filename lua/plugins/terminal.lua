return {
  "Dan7h3x/neaterm.nvim",
  branch = "stable",
  event = "VeryLazy",
  opts = {
    -- Terminal settings
    shell = vim.o.shell,
    float_width = 0.5,
    float_height = 0.4,
    move_amount = 3,
    resize_amount = 2,
    border = "rounded",

    -- Appearance
    highlights = {
      normal = "Normal",
      border = "FloatBorder",
      title = "Title",
    },

    -- Window management
    min_width = 20,
    min_height = 2,

    terminals = {},

    use_default_keymaps = true,
    keymaps = {
      toggle = "<A-t>",
      new_vertical = "<A-v>",
      new_horizontal = "<A-h>",
      new_float = "<A-u>",
      close = "<A-q>",
    },
    features = {
      auto_insert = true,
      auto_close = true,
      restore_layout = true,
      smart_sizing = true,
      persistent_history = true,
      native_search = true,
      clipboard_sync = true,
      shell_integration = true,
    },
  },

  config = function(_, opts)
    require("neaterm").setup(opts)
  end,
  dependencies = {
    "ibhagwan/fzf-lua",
  },
}
