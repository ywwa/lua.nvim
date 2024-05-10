local map = vim.keymap.set

map("n", "<ESC>", "<cmd>noh<CR>", { desc = "Clear highlights", silent = true })

map("i", "<C-b>", "<ESC>^i", { desc = "Move to start of line" })
map("i", "<C-e>", "<End>", { desc = "Move to end of line" })

map("i", "<C-h>", "<Left>", { desc = "Move Left" })
map("i", "<C-l>", "<Right>", { desc = "Move Right" })
map("i", "<C-j>", "<Down>", { desc = "Move Down" })
map("i", "<C-k>", "<Up>", { desc = "Move Up" })

map("t", "<C-x>", "<C-\\><C-N>", { desc = "Terminal Escape terminal mode" })

map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Selected lines up" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Selected lines down" })
