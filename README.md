<h1 align="center">Nv[im/Chad] custom config</h1>
<h3 align="center">
   <img src="https://raw.githubusercontent.com/yuukilla/nvchad-config/master/.github/img/prv.png" />
   <img src="https://raw.githubusercontent.com/yuukilla/nvchad-config/master/.github/img/prv1.png" />
</h3>
<hr>

### plugins.lua
```lua
{
  "alexghergh/nvim-tmux-navigation",     -- Navigation between tmux and neovim
  "rest-nvim/rest.nvim",                 -- Run HTTP Requests inside neovim
  "folke/noice.nvim",                    -- Noice.
  "toppair/peek.nvim",                   -- Live markdown preview
  "andreadev-it/shade.nvim",             -- Darken unfocused buffers
  "folke/trouble.nvim",                  -- Make debugging more comfortable
  "folke/zen-mode.nvim",                 -- Zen mode
  "karb94/neoscroll.nvim",               -- Smooooooth
  "andweeb/presence.nvim",               -- Avarage discord user
}
```

### mappings.lua
```lua
  "C-h"     -- NvimTmuxNavigateLeft
  "C-j"     -- NvimTmuxNavigateDown
  "C-k"     -- NvimTmuxNavigateUp
  "C-l"     -- NvimTmuxNavigateRight

  "C-r"     -- RestRun
  "C-t"     -- PeekOpen
  "C-y"     -- PeekClose

  "Left"    -- Disabled
  "Down"    -- Disabled
  "Up"      -- Disabled
  "Right"   -- Disabled
```
