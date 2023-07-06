local M = {}

M.keys = {
  "zf",
  "zo",
  "za",
  "zc",
  "zM",
  "zR",
}

M.setup = function()
  require("ufo").setup {
    provider_selector = function()
      return { "treesitter", "indent" }
    end,
  }
end

return M
