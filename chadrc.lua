---@type ChadrcConfig
local M = {}

local highlights = require "custom.highlights"

M.ui = {
  theme = "decay",
  hl_override = highlights.override,
  hl_add = highlights.add,

  cmp = {
    icons = true,
    style = "flat_dark",
    lspkind_text = true,
    selected_item_bg = "colored",
  },

  tabufline = {
    -- remove buttons on right side
    overriden_modules = function(modules)
      table.remove(modules, #modules)
    end,
  },
  lsp_semantic_tokens = false,
  statusline = {
    theme = "minimal",
  },
  extended_integrations = {
    "rainbowdelimiters",
    "trouble"
  }
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
