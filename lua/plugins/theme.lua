-- return {
--   "cdmill/neomodern.nvim",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     require("neomodern").setup {}
--     require("neomodern").load()
--
--     vim.cmd [[ colorscheme darkforest ]]
--   end,
-- }

return {
  "killitar/obscure.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function(_, opts)
    require("obscure").setup(opts)
    vim.cmd [[ colorscheme obscure ]]
  end,
}
