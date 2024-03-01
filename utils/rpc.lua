local autocmd = vim.api.nvim_create_autocmd

---@diagnostic disable: need-check-nil
local function nvimInstance()
  local handle = io.popen "pgrep nvim | wc -l"
  local output = handle:read "*a"
  handle:close()

  return tonumber(output)
end

return function(enabled)
  if enabled == true then
    autocmd({ "UIEnter" }, {
      callback = function()
        if nvimInstance() == 2 then
          require("lazy").load { plugins = { "neocord" } }
        end
      end,
    })
  end
end
