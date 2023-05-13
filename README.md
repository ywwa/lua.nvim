# Nv{im/Chad} lua/custom 

### Plugins
```ts
{
  "christoomey/vim-tmux-navigator", // <-- Self explanatory
  "rest-nvim/rest.nvim",            // <-- Plugin for testing api (basically curl wrapper)
  "andweeb/presence.nvim",          // <-- Discord rich presence
  "toppair/peek.nvim"               // <-- Markdown live preview
}

```

### Mappings
```lua
{ 
  -- "christoomey/vim-tmux-navigator"
  ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left" }, 
  ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right" },
  ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down" },
  ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up" },
  
  -- "rest-nvim/rest.nvim"
  ["<C-r>"] = { "<cmd> lua require('rest-nvim').run()<CR>", "RestNvim run" },
  
  -- "toppair/peek.nvim"
  ["<C-T>"] = { "<cmd> PeekOpen<CR>", "Open markdown preview window"},
  ["<C-Y>"] = { "<cmd> PeekClose<CR>", "Close markdown preview window"}

}

```
