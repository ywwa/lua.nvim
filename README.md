# Nv{im/Chad} lua/custom 

### Plugins
```ts
{
  "alexghergh/nvim-tmux-navigation",     // <-- Self explanatory
  "rest-nvim/rest.nvim",                 // <-- Plugin for testing api (basically curl wrapper)
    dependency: "nvim-lua/plenary.nvim", // - i have zero clue tf does this pluggin but its needed
  "andreadev-it/shade.nvim",             // <--- grays out inactive buffers
  "andweeb/presence.nvim",               // <-- Discord rich presence
  "toppair/peek.nvim"                    // <-- Markdown live preview
}
```

### Mappings
```lua
{ 
  -- "alexghergh/nvim-tmux-navigation"
  ["<C-h>"] = { "<cmd> NvimTmuxNavigateLeft <CR>", "Nvim-Tmux Navigation Left"},
  ["<C-j>"] = { "<cmd> NvimTmuxNavigateDown <CR>", "Nvim-Tmux Navigation Down"},
  ["<C-k>"] = { "<cmd> NvimTmuxNavigateUp <CR>", "Nvim-Tmux Navigation Up"},
  ["<C-l>"] = { "<cmd> NvimTmuxNavigateRight <CR>", "Nvim-Tmux Navigation Right"},
  
  -- "rest-nvim/rest.nvim"
  ["<C-r>"] = { "<cmd> lua require('rest-nvim').run()<CR>", "RestNvim run" },  

  -- "toppair/peek.nvim"
  ["<C-T>"] = { "<cmd> PeekOpen<CR>", "Open markdown preview window"},
  ["<C-Y>"] = { "<cmd> PeekClose<CR>", "Close markdown preview window"},

  -- default
  ["<Up>"]    = { "<Nop>" },
  ["<Down>"]  = { "<Nop>" },  -- Locking my self out of using arrow keys
  ["<Left>"]  = { "<Nop>" },  --        just because why not lol
  ["<Right>"] = { "<Nop>" }
}
```
