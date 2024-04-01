return {
  "toppair/peek.nvim",
  ft = { "md", "mdx" },
  build = "deno task --quiet build:fast",
  opts = {
    auto_load = true,
    close_on_bdelete = true,
    syntax = true,
    theme = "dark",
    update_on_change = true,
    app = "floorp",
    filetype = { "markdown", "mdx" },
    throttle_at = 20000,
    throttle_time = "auto",
  },
  config = function(_, opts)
    require("peek").setup(opts)
  end,
}
