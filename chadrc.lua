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
    -- remove buttons and padding
    overriden_modules = function(modules)
      table.remove(modules, #modules)
      table.remove(modules, 1)
    end,
  },

  statusline = {
    theme = "minimal",
    overriden_modules = function(modules)
      local StCCModules = require "custom.utils.statusline.colorcolumn"
      table.insert(modules, 9, StCCModules.StMod_Cc_Width())
      table.insert(modules, 11, StCCModules.StMod_Cc_Status())
    end,
  },

  lsp = {
    signature = false,
    semantic_tokens = false,
  },
}

M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

return M
