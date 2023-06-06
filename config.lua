local M = {}

M.settings = {
  cc_size = "80",
  so_size = 10,

  -- Blacklisted files where cc and so must be disabled
  blacklist = {
    "NvimTree",
    "nvdash",
    "nvcheatsheet",
    "terminal",
    "Trouble",
    "ship",
    "help",
  },

  discord_rpc = 2, -- "pgrep nvim | wc -l" - 1 neovide 2 nvim
}

return M
