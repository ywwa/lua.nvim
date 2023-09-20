local M = {}

M.setup = function()
  require("hlargs").setup {
    paint_arg_declarations = true,
    paint_arg_usages = true,
    extras = {
      named_parameters = true,
    },
  }
end

return M
