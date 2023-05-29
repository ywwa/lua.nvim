local M = {}

M.setup = function()
  require("neodim").setup {
    refresh_delay = 75,
    alpha = 0.75,
    blend_color = "#000000",
    hide = {
      underline = true,
      virtual_text = true,
      signs = true,
    },
    priority = 100,
    disable = {},
  }
end

return M
