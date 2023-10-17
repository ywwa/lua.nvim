local create_autocmd = vim.api.nvim_create_autocmd
local presence = require("custom.confrc").presence

create_autocmd({ "UIEnter" }, {
  callback = function()
    local handle = io.popen "pgrep nvim | wc -l"
    local output = handle:read "*a"
    handle:close()

    if tonumber(output) == presence then
      require("lazy").load {
        plugins = {
          "presence.nvim",
        },
      }
    end
  end,
})
