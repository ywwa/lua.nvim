local opts = {
  keywords = {
    FIX = {
      icon = " ",
      color = "error",
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
    },
    TODO = { icon = "󰔟 ", color = "todo" },
    HACK = { icon = "󱗗 ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = "󱢍 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = "󱞁 ", color = "info", alt = { "INFO" } },
    TEST = {
      icon = "󰙨 ",
      color = "test",
      alt = { "TESTING", "PASSED", "FAILED" },
    },
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

return opts
