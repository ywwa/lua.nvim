local highlghts = require "custom.core.highlights"

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "jellybeans",
  hl_override = highlghts.override,
  hl_add = highlghts.add,
  cmp = {
    icons = true,
    style = "default",
    lspkind_text = true,
    selected_item_bg = "colored",
  },
  tabufline = {
    enabled = true,
  },
  statusline = {
    theme = "vscode_colored",
  },
  lsp = {
    signature = false,
    semantic_tokens = false,
  },
}

M.plugins = "custom.plugins"
M.mappings = require "custom.core.mappings"

M.lazy_nvim = {
  change_detection = {
    notify = false
  }
}

return M
