local map = vim.keymap.set

-- normal
map("n", "<ESC>", "<CMD>:nohl<CR>", { nowait = true, silent = true })
map("n", "<C-e>", "<END>", { nowait = true, silent = true })
map("n", "<C-b>", "<HOME>", { nowait = true, silent = true })

-- insert
map("i", "<C-h>", "<Left>", { desc = "Move left", silent = true, nowait = true })
map("i", "<C-j>", "<Down>", { desc = "Move down", silent = true, nowait = true })
map("i", "<C-k>", "<Up>", { desc = "Move up", silent = true, nowait = true })
map("i", "<C-l>", "<Right>", { desc = "Move right", silent = true, nowait = true })

-- visual
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selected lines up", silent = true })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selected lines down", silent = true })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Terminal Escape terminal mode" })
