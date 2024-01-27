-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("i", "kj", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sc", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>enew<CR>", { desc = "Open new buffer" }) -- open new buffer
keymap.set("n", "<leader>bc", "<cmd>Bdelete<CR>", { desc = "Close current buffer" }) -- close current buffer
keymap.set("n", "<leader>]", "<cmd>bn<CR>", { desc = "Go to next buffer" }) --  go to next buffer
keymap.set("n", "<leader>bn", "<cmd>bn<CR>", { desc = "Go to next buffer" }) --  go to next buffer
keymap.set("n", "<leader>[", "<cmd>bp<CR>", { desc = "Go to previous buffer" }) --  go to previous buffer
keymap.set("n", "<leader>bp", "<cmd>bp<CR>", { desc = "Go to previous buffer" }) --  go to previous buffer
keymap.set("n", "<leader>bf", "<cmd>new %<CR>", { desc = "Open current buffer in new buffer" }) --  move current buffer to new buffer
keymap.set("n", "<leader>c", "<cmd>Bdelete<CR>", { desc = "Close current buffer" }) -- close current buffer
keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Go to next buffer" })
keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Go to previous buffer" })

keymap.set("v", "<", "<gv", { desc = "Indent to left" })
keymap.set("v", ">", ">gv", { desc = "Indent to right" })

keymap.set("v", "J", "<cmd>move '>+1<CR>gv-gv", { desc = "Move selected line to down" })
keymap.set("v", "K", "<cmd>move '<-2<CR>gv-gv", { desc = "Move selected line to up" })

keymap.set("n", "<leader>rr", "<cmd>so %<CR>", { desc = "Reload source file without restart nvim" })

keymap.set("n", "<leader>td", function()
  vim.opt.background = "dark"
end, { desc = "Set dark background" })
keymap.set("n", "<leader>tl", function()
  vim.opt.background = "light"
end, { desc = "Set light background" })

-- Terminal mode
keymap.set("t", "<ESC>", "<C-\\><C-n>", { desc = "Set terminal to normal mode" })
