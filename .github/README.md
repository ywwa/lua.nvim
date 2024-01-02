<h1 align="center">chadConfig</h1>
<p align="center">
    <a style="color: #DFC5FE" href="https://nvchad.com">NvChad</a>'s config for branch <b style="color: #DFC5FE">v3.0</b>
</p>

```ts
const repo = {
  title: "chadConfig",
  url: "git@github.com:ywwa/chadConfig.git",
  description: "personal nvchad focused for web development",
};
```

### plugin list

```ts
// plugins/base.lua
const luaBase = {
    "typescript-tools.nvim",
    "nvim-ts-context-commentstring",
    "nvim-ts-autotag",
    "cmp-emoji",
    "cmp-tresitter",
    "cmp-nerdfont",
    "tailwindcss-colorizer-cmp.nvim",
    "telescope-file-browser.nvim",
    "telescope-http.nvim",
    "tailiscope.nvim",
    "telescope-nodua"
}

// plugins/interface.lua
const luaInterface = {
    "lspsaga.nvim",
    "nvim-ufo",
    "promise-async",
    "statuscol.nvim",
    "pretty-fold.nvim",
    "keymap-amend.nvim",
    "fold-preview.nvim",
    "scrollEOF.nvim",
    "neoscroll.nvim",
    "virtcolumn.nvim",
    "nvim-hlslens",
    "hlargs.nvim",
    "todo-comments.nvim",
    "zen-mode.nvim",
    "tailwindcss-colorizer-cmp.nvim",
    "numb.nvim"
}

// plugins/tools.lua
const luaTools = {
    "troble.nvim",
    "peek.nvim",
    "package-info.nvim",
    "conform.nvim",
    "rest.nvim",
    "nvim-surround",
    "nvim-luapad",
    "neodev.nvim",
    "codeium.nvim"
}

// plugins/extras.lua
const luaExtras = {
    "neocord",
    "nvim-lastplace",
    "vim-tmux-navigator",
    "yuck.vim",
    "bionic.nvim",
    "tailwind-fold.nvim",
}
```

### custom functions

some extra fnctions & commands that i have written

```lua
local ToggleColorColumn -- command that toggles colorcolumn in buffer

local DiscordRPC = "AutoCommand that loads neocord plugin only in first neovim instance"
local ScrollOff = "AutoCommand that handles scrolloff value in buffers (has blacklist)"
```
