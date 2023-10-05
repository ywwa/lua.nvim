<h1 align="center">chadConfig</h1>
<p align="center" style="font-family: monospace">
    <a href="https://github.com/NvChad">NvChad</a>
    config for branch [ <b>v3.0</b> ]
</p>

### @info
This is my personal configuration of NvChad on branch v3.0 mainly oriented for
web development with Javascript/Typescript and PHP.

### @plugins
Plugin folder contians multiple files with self-explanatory names.


#### #defaults.lua
This file contains overrides for default NvChad plugins.
```
nvim-lspconfig
    typescript-tools.nvim
mason.nvim
nvim-treesitter
    nvim-ts-context-commentstring
nvim-cmp
    cmp-emoji
    cmp-treesitter
    cmp-calc
    cmp-nerdfont
    cpm-npm
    cpm-plugins
telescope.nvim
    telescope-file-browser.nvim
better-escape.nvim
Comment.nvim
nvim-tree.lua
indent-blankline.nvim
```

#### #ui.lua
This file contains all user interface related plugins.
```
noice.nvim
    nui.nvim
lspsaga.nvim
nvim-ufo
    promise-async
    statuscol.nvim
pretty-fold.nvim
    keymap-amend.nvim
    fold-preview.nvim
scrollEOF.nvim
neoscroll.nvim
virtcolumn.nvim
hlchunk.nvim
nvim-hlslens
hlargs.nvim
rainbow-delimiters.nvim
todo-comments.nvim
zen-mode.nvim
```

#### #tools.lua
This file contains all tool plugins.
```
trouble.nvim
nvim-ship
    nvim-spinetta
    nvim-popcorn
peek.nvim
package-info.nvim
undotree
conform.nvim
```

#### #ai.lua
This file contains all AI plugins.
```
codeium.nvim
```

#### #misc.lua
This file contains miscellaneous plugins.
```
presence.nvim
nvim-lastplace
```


### @utils
This folder contains some utility functions that i need for better experience.

* colorcolumn.lua
    - Handles how colorcolumn behaves.
* scrolloff.lua
    - Handles how scrolloff behaves.
* presence.lua
    - handles discord rpc plugin loading
