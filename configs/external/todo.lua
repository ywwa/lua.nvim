local M = {}

M.setup = function()
  require("todo-comments").setup {
    keywords = {
      FIX = {
        icon = " ", -- icon used for the sign, and in search results
        color = "error", -- can be a hex color, or a named color (see below)
        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
        -- signs = false, -- configure signs for some keywords individually
      },
      TODO = { icon = "󰔟 ", color = "todo" },
      HACK = { icon = "󱗗 ", color = "warning" },
      WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
      PERF = { icon = "󱢍 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
      NOTE = { icon = "󱞁 ", color = "info", alt = { "INFO" } },
      TEST = { icon = "󰙨 ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
    },
    colors = {
      error = { "DiagnosticError", "ErrorMsg", "#ff6c6b" },
      warning = { "DiagnosticWarn", "WarningMsg", "#ECBE7B" },
      todo = { "DiagnosticOk", "#66c4ff" },
      info = { "DiagnosticInfo", "#98be65" },
      default = { "Identifier", "#dc8ef3" },
      test = { "Identifier", "#ff75a0" },
    },
  }
end

return M
