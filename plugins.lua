local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Temp fix: /issues/591
  {
    "lukas-reineke/indent-blankline.nvim",
    commit = "b7aa0aed55887edfaece23f7b46ab22232fc8741",
  },

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
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "ray-x/cmp-treesitter",
    },
    opts = overrides.cmp,
  },

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
      require("custom.configs.qol.comment").setup()
    end,
  },

  -- USER INTERFACE -----------------------------------------------------------

  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("custom.configs.ui.lspsaga").setup()
    end,
  },

  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          require("custom.configs.ui.statuscol").setup()
        end,
      },
    },
    event = "BufReadPost",
    keys = require("custom.configs.ui.ufo").keys,
    config = function()
      require("custom.configs.ui.ufo").setup()
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
      require("custom.configs.ui.prettyfold").setup()
    end,
  },

  {
    "shellRaining/hlchunk.nvim",
    event = "BufReadPost",
    config = function()
      require("custom.configs.ui.hlchunk").setup()
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
      require("hlargs").setup {}
    end,
  },

  {
    "HiPhish/nvim-ts-rainbow2",
    event = "BufWinEnter",
    config = function()
      require("custom.configs.ui.ts-rainbow").setup()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "BufWinEnter",
    config = function()
      require("custom.configs.ui.ts-textobjects").setup()
    end,
  },

  {
    "lukas-reineke/virt-column.nvim",
    event = "BufWinEnter",
    config = function()
      require("virt-column").setup {
        char = "┃",
      }
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
    "Aasim-A/scrollEOF.nvim",
    keys = { "<C-d>", "<C-u>" },
    config = function()
      require("scrollEOF").setup {
        insert_mode = true,
      }
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
      require("custom.configs.ui.truezen").setup()
    end,
  },

  {
    "anuvyklack/windows.nvim",
    event = "WinNew",
    dependencies = {
      { "anuvyklack/middleclass" },
      { "anuvyklack/animation.nvim", enabled = true },
    },
    keys = { { "<leader>Z", "<cmd>WindowsMaximize<cr>", desc = "Zoom" } },
    config = function()
      vim.o.winwidth = 10
      vim.o.equalalways = false
      require("windows").setup {
        animation = { enable = true, duration = 150 },
      }
    end,
  },

  -- QOL ----------------------------------------------------------------------

  {
    "ethanholz/nvim-lastplace",
    event = "VeryLazy",
    config = function()
      require("custom.configs.qol.lastplace").setup()
    end,
  },

  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("custom.configs.ui.todo").setup()
    end,
  },

  -- TOOLS --------------------------------------------------------------------

  {
    "jcdickinson/codeium.nvim",
    cmd = "Codeium",
    event = "BufReadPost",
    commit = "b1ff0d6c993e3d87a4362d2ccd6c660f7444599f",
    config = function()
      require("codeium").setup {}
    end,
  },

  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
      require("custom.configs.tools.trouble").setup()
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
      require("custom.configs.tools.ship").setup()
    end,
  },

  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  {
    "vuki656/package-info.nvim",
    ft = { "json", "lua" },
    config = true,
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
  },

  -- MISC ---------------------------------------------------------------------

  {
    "andweeb/presence.nvim",
    config = function()
      require "custom.configs.misc.presence"
    end,
  },
}

return plugins
