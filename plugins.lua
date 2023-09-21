local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  {
    "NvChad/nvterm",
    enabled = false,
  },

  {
    "NvChad/ui",
    branch = "term",
  },

  {
    "NvChad/nvcommunity",
    { import = "nvcommunity.editor.biscuits" },
    { import = "nvcommunity.motion.hop" },
  },

  -- Overrides
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    opts = overrides.blankline,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "ray-x/cmp-treesitter",
    },
    opts = overrides.cmp,
  },

  -- plugins

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      ft = "javascriptreact",
    },
    config = function()
      require("custom.configs.comment").setup()
    end,
  },

  -- UI

  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("custom.configs.lspsaga").setup()
    end,
  },

  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          require("custom.configs.statuscol").setup()
        end,
      },
    },
    event = "BufReadPost",
    keys = require("custom.configs.ufo").keys,
    config = function()
      require("custom.configs.ufo").setup()
    end,
  },

  {
    "anuvyklack/pretty-fold.nvim",
    event = "BufWinEnter",
    dependencies = {
      "anuvyklack/keymap-amend.nvim",
      {
        "anuvyklack/fold-preview.nvim",
        opts = {
          border = {
            "╭",
            "─",
            "╮",
            "│",
            "╯",
            "─",
            "╰",
            "│",
          },
        },
      },
    },
    config = function()
      require("custom.configs.prettyfold").setup()
    end,
  },

  {
    "Aasim-A/scrollEOF.nvim",
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("scrollEOF").setup { insert_mode = true }
    end,
  },

  {
    "karb94/neoscroll.nvim",
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("neoscroll").setup {
        mappings = {
          "<C-u>",
          "<C-d>",
        },
      }
    end,
  },

  {
    "lukas-reineke/virt-column.nvim",
    event = "BufWinEnter",
    config = function()
      require("virt-column").setup {
        char = "│",
      }
    end,
  },

  {
    "shellRaining/hlchunk.nvim",
    event = "BufReadPost",
    config = function()
      require("custom.configs.hlchunk").setup()
    end,
  },

  {
    "kevinhwang91/nvim-hlslens",
    event = "BufReadPost",
    config = function()
      require("hlslens").setup()
    end,
  },

  {
    "m-demare/hlargs.nvim",
    event = "BufWinEnter",
    config = function()
      require("custom.configs.hlargs").setup()
    end,
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    event = "BufWinEnter",
    config = function()
      require("custom.configs.rainbow-delimiters").setup()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "BufWinEnter",
    config = function()
      require("custom.configs.treesitter-textobjects").setup()
    end,
  },

  {
    "Pocco81/true-zen.nvim",
    cmd = {
      "TZAtaraxis",
      "TZMinimalist",
      "TZNarrow",
      "TZFocus",
    },
    config = function()
      require("custom.configs.truezen").setup()
    end,
  },

  {
    "ethanholz/nvim-lastplace",
    event = "BufWinEnter",
    config = function()
      require("custom.configs.lastplace").setup()
    end,
  },

  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("custom.configs.todo-comments").setup()
    end,
  },

  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
      require("custom.configs.trouble").setup()
    end,
  },

  {
    "javiorfo/nvim-ship",
    ft = "ship",
    dependencies = {
      "javiorfo/nvim-spinetta",
      "javiorfo/nvim-popcorn",
    },
    config = function()
      require("custom.configs.ship").setup()
    end,
  },

  {
    "Saimo/peek.nvim",
    ft = "markdown",
    build = "deno task --quiet build:fast",
    config = function()
      require("custom.configs.peek").setup()
    end,
  },

  {
    "vuki656/package-info.nvim",
    ft = { "json" },
    config = true,
  },

  {
    "andweeb/presence.nvim",
    config = function()
      require("custom.configs.presence").setup()
    end,
  },

  {
    "jcdickinson/codeium.nvim",
    cmd = "Codeium",
    event = "BufReadPost",
    config = function()
      require("codeium").setup {}
    end,
  },
}

return plugins
