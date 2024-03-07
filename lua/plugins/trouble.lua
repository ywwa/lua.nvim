---@diagnostic disable: different-requires
return {
  "folke/trouble.nvim",
  event = "LspAttach",
  keys = {
    {
      "<leader>tt",
      function()
        require("trouble").toggle()
      end,
      mode = "n",
      desc = "Trouble toggle",
    },
  },
  cmd = { "Trouble", "TroubleToggle" },
  opts = function()
    return require "plugins.config.trouble"
  end,
  config = function(_, opts)
    require("trouble").setup(opts)
  end,
}
