local config = require "env.config.misc"

return {
  "IogaMaster/neocord",
  event = "UIEnter",
  opts = function()
    return config.neocord
  end,
  config = function(_, opts)
    local function instance()
      local handle = io.popen "pgrep nvim | wc -l"

      if handle then
        local output = handle:read "*a"
        handle:close()
        return tonumber(output)
      else
        vim.api.nvim_err_message "Error: Could not get nvim process ID"
        return nil
      end
    end

    if instance() == 2 then
      require("neocord").setup(opts)
    end
  end,
}
