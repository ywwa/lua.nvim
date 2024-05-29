local config = require "env.config.lspConfig"

local function file_exists(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

local function get_tsserver_path()
  local path = vim.fn.getcwd() .. "/node_modules/typescript/lib/tsserver.js"
  if file_exists(path) then
    return path
  else
    return nil
  end
end

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "pmizio/typescript-tools.nvim",
        config = function()
          require("typescript-tools").setup {
            on_attach = function(client, _)
              client.server_capabilities.semanticTokensProvider = nil
            end,
            settings = {
              tsserver_path = get_tsserver_path(),
            },
          }
        end,
      },
      { "folke/neodev.nvim", ft = "lua" },
    },
    event = "User FilePost",
    config = function()
      config.setup()
    end,
  },
}
