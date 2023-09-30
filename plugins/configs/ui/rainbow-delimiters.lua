local rd = require "rainbow-delimiters"

require "rainbow-delimiters.setup" {
  strategy = {
    [""] = rd.strategy["global"],
    vim = rd.strategy["local"],
  },
  query = {
    [""] = "raindow-delimiters",
    lua = "rainbow-blocks",
  },
  highlights = {
    "RainbowDelmitersRed",
    "RainbowDelmitersYellow",
    "RainbowDelmitersBlue",
    "RainbowDelmitersOrange",
    "RainbowDelmitersGreen",
    "RainbowDelmitersViolet",
    "RainbowDelmitersCyan",
  },
  blacklist = { "c", "cpp" },
}
