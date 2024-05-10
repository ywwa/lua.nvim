local M = {}

function M.navigatorKeys()
  local navigator = require "Navigator"

  return {
    {
      "<C-h>",
      function()
        navigator.left()
      end,
      desc = "Move left",
    },

    {
      "<C-j>",
      function()
        navigator.down()
      end,
      desc = "Move down",
    },
    {
      "<C-k>",
      function()
        navigator.up()
      end,
      desc = "Move up",
    },
    {
      "<C-l>",
      function()
        navigator.right()
      end,
      desc = "Move right",
    },
  }
end

return M
