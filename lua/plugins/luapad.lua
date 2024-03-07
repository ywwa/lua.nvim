return {
  "rafcamlet/nvim-luapad",
  ft = "lua",
  opts = {
    error_indicator = true,
    wipe = false
  },
  config = function(_, opts)
    require("luapad").setup(opts)
  end,
}
