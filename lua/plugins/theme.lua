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

-- return {
--   "killitar/obscure.nvim",
--   lazy = false,
--   priority = 1000,
--   opts = {
--     dim_inactive = false,
--   },
--   config = function(_, opts)
--     require("obscure").setup(opts)
--     vim.cmd [[ colorscheme obscure ]]
--   end,
-- }

---@type LazyPluginSpec
return {
  "comfysage/evergarden",
  lazy = false,
  priority = 1000, -- Colorscheme plugin is loaded first before any other plugins
  opts = {
    transparent_background = false,
    variant = "hard", -- 'hard'|'medium'|'soft'
    overrides = {}, -- add custom overrides
    style = {
      tabline = { "reverse" },
      search = { "italic" },
      incsearch = { "reverse" },
      types = { "italic" },
      keyword = { "italic" },
      comment = { "italic" },
      sign = { highlight = false },
    },
    integrations = {
      blink_cmp = true,
      cmp = true,
      gitsigns = true,
      indent_blankline = { enable = true, scope_color = "green" },
      nvimtree = true,
      rainbow_delimiters = false,
      symbols_outline = true,
      telescope = true,
      which_key = true,
    },
  },
  config = function(_, opts)
    require("evergarden").setup(opts)
    vim.cmd [[colorscheme evergarden]]
  end,
}
