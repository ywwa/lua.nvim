local config = require "env.config.tools"
return {
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    opts = function()
      return config.todoComments
    end,
    config = function(_, opts)
      require("todo-comments").setup(opts)
    end,
  },

  {
    "folke/trouble.nvim",
    event = "LspAttach",
    keys = function()
      return config.troubleKeys()
    end,
    cmd = { "Trouble", "TroubleToggle" },
    opts = function()
      return config.trouble
    end,
    config = function(_, opts)
      require("trouble").setup(opts)
    end,
  },

  {
    "folke/which-key.nvim",
    keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    cmd = "WhichKey",
    opts = {},
    config = function(_, opts)
      require("which-key").setup(opts)
    end,
  },

  {
    "toppair/peek.nvim",
    ft = { "md", "mdx" },
    build = "deno task --quiet build:fast",
    keys = function()
      return config.peekKeys()
    end,
    opts = function()
      return config.peek
    end,
    config = function(_, opts)
      require("peek").setup(opts)
    end,
  },

  {
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
    opts = function()
      return config.zenMode
    end,
    config = function(_, opts)
      require("zen-mode").setup(opts)
    end,
  },
}
