---@type NvPluginSpec[]
return {
  {
    "Exafunction/codeium.nvim",
    event = "LspAttach",
    config = function()
      require("codeium").setup({})
    end
  }
}

