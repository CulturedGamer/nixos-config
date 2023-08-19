local opts = { noremap = true, silent  = true }

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("i", "jk", "<ESC>", opts)
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>", opts)
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("n", "to", ":tabnew<CR>", opts)
vim.keymap.set("n", "tl", ":bnext<CR>", opts)
vim.keymap.set("n", "th", ":bprev<CR>", opts)
vim.keymap.set("n", "td", ":bd<CR>", opts)
vim.keymap.set("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)
