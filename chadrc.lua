---@type ChadrcConfig
local M = {}

local highlights = require "custom.highlights"

M.ui = {
  theme = "jellybeans",

  hl_override = highlights.override,
  hl_add = highlights.add,

  cmp = {
    style = "flat_dark",
    lspkind_text = true,
    selected_item_bg = "colored",
  },

  tabufline = {
    lazyload = false,
    show_numbers = true,
  },

  -- TODO: write own statusline theme
  statusline = {
    theme = "vscode",
  },

  lsp = {
    signature = false,
    semantic_tokens= false,
  },

  term = {
    float = {
      relative = "editor",
      row = 0.12,
      col = 0.15,
      width = 0.7,
      height = 0.7,
      border = "single",
    },
  },
}

---@diagnostic disable: inject-field
M.utils = {
  enable_rpc = true,
  cc = {
    enabled = true,
    values = "80",
  },
  so = {
    enabled = true,
    value = 8,
  },
  blacklist = {
    "NvimTree",
    "nvdash",
    "nvcheatsheet",
    "terminal",
    "Trouble",
    "help",
    "man",
    "prompt",
    "nofile",
  },
}

M.plugins = "custom.plugins"

return M
