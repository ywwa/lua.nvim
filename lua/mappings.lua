local map = vim.keymap.set

-- normal
map("n", "<ESC>", "<CMD>:nohl<CR>", { nowait = true, silent = true })
map("n", "<C-e>", "<END>", { nowait = true, silent = true })
map("n", "<C-b>", "<HOME>", { nowait = true, silent = true })

-- insert
map("i", "<C-b>", "<ESC>^i", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("i", "<C-h>", "<Left>", { desc = "Move left", silent = true, nowait = true })
map("i", "<C-j>", "<Down>", { desc = "Move down", silent = true, nowait = true })
map("i", "<C-k>", "<Up>", { desc = "Move up", silent = true, nowait = true })
map("i", "<C-l>", "<Right>", { desc = "Move right", silent = true, nowait = true })

-- visual
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up", silent = true })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down", silent = true })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Terminal Escape terminal mode" })

-- new terminals
map("n", "<leader>h", function()
  require("modules.terminal").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })

map("n", "<leader>v", function()
  require("modules.terminal").new { pos = "vsp" }
end, { desc = "terminal new vertical term" })

-- toggleable
map({ "n", "t" }, "<A-v>", function()
  require("modules.terminal").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<A-h>", function()
  require("modules.terminal").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })

map({ "n", "t" }, "<A-i>", function()
  require("modules.terminal").toggle { pos = "float", id = "floatTerm" }

end, { desc = "terminal toggle floating term" })
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })

map("n", "<tab>", function()
  require("modules.tabufline").next()
end, { desc = "buffer goto next" })

map("n", "<S-tab>", function()
  require("modules.tabufline").prev()
end, { desc = "buffer goto prev" })

map("n", "<A-q>", function()
  require("modules.tabufline").close_buffer()
end, { desc = "buffer close" })
