---@type ChadrcConfig
local M = {}

local highlights = require "custom.highlights"

M.ui = {
  theme = "doomchad",
  theme_toggle = { "doomchad", "catppuccin" },
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
    theme = "vscode_colored",
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

M.mappings = require "custom.mappings"

M.plugins = "custom.plugins"

return M
