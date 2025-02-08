local joinpath = vim.fs.joinpath
local stdpath = vim.fn.stdpath

local __paths = {
  lazyRoot = joinpath(stdpath "data", "lazy"),
  specPath = "plugins",
  lockFile = joinpath(stdpath "config", "lazy-lock.json"),
  cachePath = joinpath(stdpath "state", "lazy/pkg.cache.lua"),
  rockRoot = joinpath(stdpath "data", "lazy-rocks"),
  devPath = "~/@workspace/neovim",
  readmeRoot = joinpath(stdpath "state", "lazy/readme"),
  statePath = joinpath(stdpath "state", "lazy/state.json"),
}

return {
  root = __paths.lazyRoot,
  defaults = { lazy = true, version = nil, cond = nil },
  spec = { import = __paths.specPath },
  local_spec = true,
  lockfile = __paths.lockFile,
  concurrency = jit.os:find "Windows" and (vim.uv.available_parallelism() * 2) or nil,
  git = { log = { "-4" }, timeout = 120, url_format = "https://github.com/%s.git", filter = true },
  pkg = { enabled = true, cache = __paths.cachePath, version = true, sources = { "lazy", "rockspec", "packspec" } },
  rocks = { root = __paths.rockRoot, server = "https://nvim-neorocks.github.io/rocks-binaries/" },
  dev = { path = __paths.devPath, fallback = true },
  install = { missing = true, colorscheme = { "habamax" } },
  ui = {
    size = { width = 0.6, height = 0.6 },
    wrap = true,
    border = "none",
    backdrop = 50,
    title = nil,
    title_pos = "cencer",
    pills = true,
    icons = {},
    browser = "floorp",
    throttle = 20,
  },
  diff = { cmd = "git" },
  checker = { enabled = false, concurenncy = nil, notify = true, frequency = 3600, check_pinned = false },
  change_detection = { enabled = true, notify = false },
  performance = {
    cache = { enabled = true },
    reset_packpath = true,
    rtp = {
      reset = true,
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
  readme = {
    enabled = true,
    root = __paths.readmeRoot,
    files = { "README.md", "lua/**/README.md" },
    skip_if_doc_exists = true,
  },
  state = __paths.statePath,
  profiling = { loader = true, require = true },
}
