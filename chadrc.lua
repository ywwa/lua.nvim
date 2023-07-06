---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "catppuccin",
  theme_toggle = { "catppuccin", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
  cmp = {
    icons = true,
    style = "flat_dark",
    lspkind_text = true,
    selected_item_bg = "colored",
  },
  tabufline = {
    overriden_modules = function()
      return {
        buttons = function()
          return ""
        end,
      }
    end,
    lazyload = false,
    show_numbers = true,
  },
  nvdash = {
    header = {
      " ▄· ▄▌▄▄▌ ▐ ▄▌▄▄▌ ▐ ▄▌ ▄▄▄· ",
      "▐█▪██▌██· █▌▐███· █▌▐█▐█ ▀█ ",
      "▐█▌▐█▪██▪▐█▐▐▌██▪▐█▐▐▌▄█▀▀█ ",
      " ▐█▀·.▐█▌██▐█▌▐█▌██▐█▌▐█ ▪▐▌",
      "  ▀ •  ▀▀▀▀ ▀▪ ▀▀▀▀ ▀▪ ▀  ▀ ",
      "      git@github:ywwa/      ",
    },
    load_on_startup = true,
  },
  lsp_semantic_tokens = false,
  statusline = {
    theme = "vscode_colored",
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

M.custom = {
  -- Discord Rich Presence
  -- When to load presence.nvim plugin
  -- If set to event="VeryLazy" presence will overlap and cause bugs
  -- e.g. Broken timer. So load only in first instance of neovim
  -- to get value open neovim and then in new terminal execute command
  -- `pgrep nvim | wc -l` and returned number enter here
  presence = 3,

  -- ScrollOff & ColorColumn
  -- Whenever filetype matches `ignoreFt` entries disable scrolloff
  -- and colorcolumn for that buffer
  ignoreFt = {
    "NvimTree",
    "nvdash",
    "nvcheatsheet",
    "terminal",
    "Trouble",
    "help",
    "man",
  },

  colorcolumn = "80",
  scrolloff = 10,
}

return M
