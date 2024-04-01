local map = vim.keymap.set

map("n", "<ESC>", "<cmd>noh<CR>", { desc = "Clear highlights", silent = true })

map(
  "v",
  "J",
  "<cmd>m '>+1<CR>gv=gv",
  { desc = "Move line down", silent = true }
)
map("v", "K", "<cmd>m '>-2<CR>gv=gv", { desc = "Move line up", silent = true })

-- indent in visual mode
map({ "v" }, ">", ">gv", { desc = "Indent Line Right" })
map({ "v" }, "<", "<gv", { desc = "Indent Line Left" })

map("i", "<C-b>", "<ESC>^i", { desc = "Move Beginning of line" })
map("i", "<C-e>", "<End>", { desc = "Move End of line" })
map("i", "<C-h>", "<Left>", { desc = "Move Left" })
map("i", "<C-l>", "<Right>", { desc = "Move Right" })
map("i", "<C-j>", "<Down>", { desc = "Move Down" })
map("i", "<C-k>", "<Up>", { desc = "Move Up" })

-- leave terminal mode
map("t", "<C-x>", "<C-\\><C-N>", { desc = "Terminal Escape terminal mode" })

-- format code
map("n", "<leader>fm", function()
  require("conform").format()
end, { desc = "Format code", silent = true })

map({ "n", "t" }, "<C-h>", function()
  require("Navigator").left()
end, { desc = "Move left" })
map({ "n", "t" }, "<C-j>", function()
  require("Navigator").down()
end, { desc = "Move down" })
map({ "n", "t" }, "<C-k>", function()
  require("Navigator").up()
end, { desc = "Move up" })
map({ "n", "t" }, "<C-l>", function()
  require("Navigator").right()
end, { desc = "Move right" })


-- bufferline
map("n", "<Tab>", function()
  require("modules.ui.buflinent").next()
end, { desc = "Next Buffer" })

map("n", "<S-Tab>", function()
  require("modules.ui.buflinent").prev()
end, { desc = "Prev Buffer" })

map("n", "<C-q>", function()
  require("modules.ui.buflinent").close_buffer()
end, { desc = "Close buffer" })

-- -- term
-- map(
--   { "n", "t" },
--   "<A-h>",
--   "<cmd>ToggleTerm direction=horizontal name=term_h<cr>",
--   { desc = "Toggle horizontal term" }
-- )
--
-- map(
--   { "n", "t" },
--   "<A-v>",
--   "<cmd>ToggleTerm direction=vertical name=term_v<cr>",
--   { desc = "Toggle vertical term" }
-- )
--
-- map(
--   { "n", "t" },
--   "<A-f>",
--   "<cmd>ToggleTerm direction=float name=term_f<cr>",
--   { desc = "Toggle floating term" }
-- )

map("n", "<leader>po", function()
  require("peek").open()
end, { desc = "Peek open" })
map("n", "<leader>pq", function()
  require("peek").close()
end, { desc = "Peek close" })
