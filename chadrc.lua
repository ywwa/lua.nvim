local highlghts = require "custom.core.highlights"

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "ashes",
  hl_override = highlghts.override,
  hl_add = highlghts.add,
  cmp = {
    icons = true,
    style = "flat_dark",
    lspkind_text = true,
    selected_item_bg = "colored",
  },
  tabufline = {
    lazyload = false,
    show_numbers = true,
  },
  statusline = {
    theme = "vscode",
  },
  lsp = {
    signature = false,
    semantic_tokens = false,
  },
  term = {
    float = {
      relative = "editor",
      row = 0.12,
      col = 0.15,
      width = 0.70,
      height = 0.70,
      border = "single",
    },
  },
}

M.plugins = "custom.plugins"
M.mappings = require "custom.core.mappings"

M.lazy_nvim = {
  checker = { enabled = true },
  change_detection = {
    notify = false,
  },
}

return M
