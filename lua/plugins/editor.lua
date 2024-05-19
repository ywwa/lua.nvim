local config = require "env.config.editor"

return {
  {
    "mcauley-penney/visual-whitespace.nvim",
    event = "BufEnter",
    opts = { highlight = { link = "VisualWhitespace" } },
    config = function(_, opts)
      require("visual-whitespace").setup(opts)

      vim.api.nvim_set_hl(0, "VisualWhitespace", {
        bg = "#393939",
        fg = "#525252",
      })
    end,
  },

  {
    "ethanholz/nvim-lastplace",
    event = "VimEnter",
    opts = function()
      return config.lastPlace
    end,
    config = function(_, opts)
      require("nvim-lastplace").setup(opts)
    end,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    version = "v3.5.4",
    event = "User FilePost",
    opts = {
      indent = { char = "." },
      scope = { enabled = false },
    },
    config = function(_, opts)
      local hooks = require "ibl.hooks"
      hooks.register(
        hooks.type.WHITESPACE,
        hooks.builtin.hide_first_space_indent_level
      )
      require("ibl").setup(opts)
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "BufEnter",
    opts = {},
    config = function(_, opts)
      require("nvim-surround").setup(opts)
    end,
  },

  {
    "winston0410/range-highlight.nvim",
    event = "BufEnter",
    dependencies = { "winston0410/cmd-parser.nvim" },
    opts = {},
    config = function(_, opts)
      require("range-highlight").setup(opts)
    end,
  },

  {
    "laytan/cloak.nvim",
    event = "UIEnter",
    opts = function()
      return config.cloak
    end,
    config = function(_, opts)
      require("cloak").setup(opts)
    end,
  },

  {
    "m-demare/hlargs.nvim",
    event = "BufEnter",
    opts = function()
      return config.hlargs
    end,
    config = function(_, opts)
      require("hlargs").setup(opts)
    end,
  },
}
