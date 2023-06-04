---@type ChadrcConfig
local M = {}

local highlights = require "custom.highlights"

M.ui = {
  theme = "decay",
  theme_toggle = { "decay", "decay" },
  transparency = false,
  hl_add = highlights.add,
  hl_override = highlights.override,

  cmp = {
    icons = true,
    style = "flat_dark",
    selected_item_bg = "simple",
    lspkind_text = true,
  },

  lsp = {
    signature = {
      disabled = false,
      silent = true,
    },
  },

  tabufline = {
    enabled = true,
    lazyload = true,
    show_numbers = false,
    -- overriden_modules = function() end,
  },

  telescope = { style = "bordered" },

  statusline = {
    theme = "minimal",
  },

  cheatsheet = {
    theme = "grid",
  },

  nvdash = {
    load_on_startup = true,
    header = {
      "▓██   ██▓ █     █░ █     █░ ▄▄▄      ",
      " ▒██  ██▒▓█░ █ ░█░▓█░ █ ░█░▒████▄    ",
      "  ▒██ ██░▒█░ █ ░█ ▒█░ █ ░█ ▒██  ▀█▄  ",
      "  ░ ▐██▓░░█░ █ ░█ ░█░ █ ░█ ░██▄▄▄▄██ ",
      "  ░ ██▒▓░░░██▒██▓ ░░██▒██▓  ▓█   ▓██▒",
      "   ██▒▒▒ ░ ▓░▒ ▒  ░ ▓░▒ ▒   ▒▒   ▓▒█░",
      " ▓██ ░▒░   ▒ ░ ░    ▒ ░ ░    ▒   ▒▒ ░",
      " ▒ ▒ ░░    ░   ░    ░   ░    ░   ▒   ",
      " ░ ░         ░        ░          ░  ░",
      " ░ ░   git@github.com:yuukilla       ",
    },
  },
}

M.lazy_nvim = {
  ui = {
    border = "solid",
  },
}

M.mappings = require "custom.mappings"

M.plugins = "custom.plugins"

return M
