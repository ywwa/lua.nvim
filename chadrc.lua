---@type ChadrcConfig
local M = {}

local highlights = require("custom.highlights")

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
    enabled = true,
    -- remove buttons and padding
    overriden_modules = function(modules)
      table.remove(modules, #modules)
    end,
  },

  statusline = {
    theme = "vscode_colored",
    -- overriden_modules = function(modules)
    --   local StModules = require("custom.core.statusline.modules")
    --   local StCCModules = require("custom.core.statusline.modules.colorcolumn")
    --   table.insert(modules, 9, StCCModules.StMod_Cc_Width())
    --   table.insert(modules, 11, StCCModules.StMod_Cc_Status())
    --   table.insert(modules, 1, StModules.StModPadding())
    -- end,
  },

  lsp = {
    signature = true,
    semantic_tokens = false,
  },
}

M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

return M
