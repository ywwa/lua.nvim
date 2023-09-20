local M = {}

local rd = require "rainbow-delimiters"

M.setup = function()
  require "rainbow-delimiters.setup" {
    strategy = {
      [""] = rd.strategy["global"],
      commonlisp = rd.strategy["local"],
    },
    query = {
      [""] = "rainbow-delimiters",
      latex = "rainbow-blocks",
    },
    highlight = {
      "RainbowDelimiterRed",
      "RainbowDelimiterYellow",
      "RainbowDelimiterBlue",
      "RainbowDelimiterOrange",
      "RainbowDelimiterGreen",
      "RainbowDelimiterViolet",
      "RainbowDelimiterCyan",
    },
    blacklist = { "c", "cpp" },
  }
end

return M
