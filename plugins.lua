---@diagnostic disable: different-requires
local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  --{{

  -- "pwntester/octo.nvim" -- github integration
  -- "phaazon/hop.nvim" -- navigation in code
  --}}

  -- Replace core plugins -----------------------------------------------------

  {
    "NvChad/ui",
    enabled = false,
  },

  {
    "yuukilla/nvchad-ui",
    branch = "prettify_str",
    lazy = false,
    config = function()
      require "nvchad_ui"
    end,
  },

  -- Override plugin definition options ---------------------------------------

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  -- Override plugin configs --------------------------------------------------

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = { "windwp/nvim-ts-autotag" },
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "NvChad/nvterm",
    opts = overrides.nvterm,
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
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
    opts = overrides.blankline,
  },

  -- User Interface -----------------------------------------------------------
  {
    "anuvyklack/pretty-fold.nvim",
    event = "BufWinEnter",
    dependencies = {
      {
        "anuvyklack/fold-preview.nvim",
        dependencies = {
          "anuvyklack/keymap-amend.nvim",
        },
        opts = {
          border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
      },
    },
    config = function()
      require "custom.configs.external.pretty-fold"
    end,
  },

  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          require("custom.configs.external.nvim-ufo").statuscolSetup()
        end,
      },
    },
    event = "BufReadPost",
    keys = require("custom.configs.external.nvim-ufo").ufoKeys,
    config = function()
      require("custom.configs.external.nvim-ufo").ufoSetup()
    end,
  },

  {
    "lukas-reineke/virt-column.nvim",
    event = "VeryLazy",
    config = function()
      require("virt-column").setup {
        char = "┃",
      }
    end,
  },

  {
    "andreadev-it/shade.nvim",
    keys = "<Bslash>",
    config = function()
      require("shade").setup {
        exclude_filetypes = { "NvimTree" },
      }
    end,
  },

  {
    "zbirenbaum/neodim",
    event = "LspAttach",
    branch = "v2",
    config = function()
      require("custom.configs.external.neodim").setup()
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
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    config = function()
      require "custom.configs.external.zenmode"
    end,
  },

  {
    "danilamihailov/beacon.nvim",
    event = "BufReadPost",
    config = function()
      require "custom.configs.external.beacon"
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require "custom.configs.external.lspsaga"
    end,
  },

  {
    "aserowy/tmux.nvim",
    keys = require("custom.configs.external.tmux").keys,
    config = function()
      require("custom.configs.external.tmux").setup()
    end,
  },

  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("custom.configs.external.todo").setup()
    end,
  },

  {
    "folke/noice.nvim",
    event = "UIEnter",
    dependencies = {
      "MunifTanjim/nui.nvim",
      -- "rcarriga/nvim-notify",
    },
    config = function()
      require "custom.configs.external.noice"
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
      vim.o.winwidth = 5
      vim.o.equalalways = false
      require("windows").setup {
        animation = { enable = true, duration = 150 },
      }
    end,
  },
  -----------------------------------------------------------------------------

  -- Development --------------------------------------------------------------
  {
    "javiorfo/nvim-ship",
    ft = "ship",
    dependencies = {
      "javiorfo/nvim-spinetta",
      "javiorfo/nvim-popcorn",
    },
    config = function()
      require "custom.configs.external.ship"
    end,
  },

  {
    "toppair/peek.nvim",
    build = "deno task --quiet build:debug",
    config = function()
      require "custom.configs.external.peek"
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

  -- Debugging ----------------------------------------------------------------
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    config = function()
      require "custom.configs.external.trouble"
    end,
  },

  {
    "CRAG666/code_runner.nvim",
    cmd = { "RunCode" },
    config = function()
      require "custom.configs.external.codeRunner"
    end,
  },

  -----------------------------------------------------------------------------

  -- Language Support ---------------------------------------------------------
  {
    "elkowar/yuck.vim",
    config = function()
      vim.opt.ft = "yuck"
    end,
  },

  -----------------------------------------------------------------------------

  -- QOL ----------------------------------------------------------------------
  {
    "abecodes/tabout.nvim",
    event = "BufEnter",
    config = function()
      require("tabout").setup()
    end,
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
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },

  {
    "m-demare/hlargs.nvim",
    event = "BufWinEnter",
    config = function()
      require("hlargs").setup()
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
    "shellRaining/hlchunk.nvim",
    event = "BufReadPost",
    config = function()
      require "custom.configs.external.hlchunk"
    end,
  },

  {
    "mrjones2014/nvim-ts-rainbow",
    event = "BufReadPost",
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufWinEnter",
    config = function()
      require "custom.configs.external.ts-context"
    end,
  },

  {
    "ofirgall/open.nvim",
    config = function()
      require("open").setup()
      -- require("custom.configs.external.open").openers() -- add custom openers
    end,
  },

  {
    "ethanholz/nvim-lastplace",
    event = "VeryLazy",
    config = function()
      require("custom.configs.external.lastplace").setup()
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "BufWinEnter",
    config = function()
      require "custom.configs.external.textobjects"
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },
  -----------------------------------------------------------------------------

  -- Fun ----------------------------------------------------------------------
  {
    "andweeb/presence.nvim",
    config = function()
      require "custom.configs.external.presence"
    end,
  },

  {
    "alanfortlink/blackjack.nvim",
    cmd = { "BlackJackNewGame" },
    config = function()
      require("blackjack").setup {
        card_style = "large",
        suit_style = "white",
      }
    end,
  },

  {
    "alec-gibson/nvim-tetris",
    cmd = { "Tetris" },
  },
}

return plugins
