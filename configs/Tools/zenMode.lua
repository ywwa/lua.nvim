return function()
  require("zen-mode").setup {
    window = {
      backdrop = 0.95,
      width = 120,
      height = 1,
    },
    plugins = {
      options = {
        enabled = true,
        ruler = false,
        showcmd = true,
      },
      twilight = { enabled = true },
      gitsigns = { enabled = false },
      tmux = { enabled = true },
    },
  }
end
