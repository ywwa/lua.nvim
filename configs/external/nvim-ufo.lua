local M = {}

-- Dependency configuration ---------------------------------------------------

M.statuscolSetup = function()
  local builtin = require "statuscol.builtin"
  require("statuscol").setup {
    relculright = true,
    segments = {
      { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
      { text = { "%s" }, click = "v:lua.ScSa" },
      { text = { builtin.lnumfunc, " " }, click = "v.lua.ScLa" },
    },
  }
end

-- Main configuration ---------------------------------------------------------

M.ufoKeys = { "zf", "zo", "za", "zc", "zM", "zR" }

M.ufoSetup = function()
  require("ufo").setup {
    provider_selector = function ()
      return { "treesitter", "indent" }
    end
  }
end

return M
