---@diagnostic disable: different-requires, need-check-nil
return {
  "IogaMaster/neocord",
  -- enabled = false,
  event = "UIEnter",
  opts = function()
    return require "plugins.config.neocord"
  end,
  config = function(_, opts)
    -- vim.api.nvim_create_autocmd("UIEnter", {
    --   callback = function()
    --     -- check instance
    local function instance()
      local handle = io.popen "pgrep nvim | wc -l"
      local output = handle:read "*a"
      handle:close()

      return tonumber(output)
    end

    if instance() == 2 then
      require("neocord").setup(opts)
    end
    --   end,
    -- })
  end,
}
