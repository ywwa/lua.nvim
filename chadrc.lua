---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "catppuccin",
  cmp = {
    style = "atom_colored",
    selected_item_bg = "simple"
  },
  -- statusline = {
  --   theme = "minimal"
  -- },
  telescope = {
    style = "bordered"
  },

  hl_override = highlights.override,
  hl_add = highlights.add,
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
    }
  },
}

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

M.plugins = "custom.plugins"

return M
