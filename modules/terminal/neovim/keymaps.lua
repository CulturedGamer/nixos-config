local options = { noremap = true, silent  = true }
local ui = require("harpoon.ui")

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", options)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", options)
vim.keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", options)
vim.keymap.set("n", "<C-Left>", ":vertical resize +2<CR>", options)
vim.keymap.set("n", "<C-h>", "<C-w>h", options)
vim.keymap.set("n", "<C-j>", "<C-w>j", options)
vim.keymap.set("n", "<C-k>", "<C-w>k", options)
vim.keymap.set("n", "<C-l>", "<C-w>l", options)
vim.keymap.set("n", "to", ":tabnew<CR>", options)
vim.keymap.set("n", "tl", ":bnext<CR>", options)
vim.keymap.set("n", "th", ":bprev<CR>", options)
vim.keymap.set("n", "<leader>l", function() ui.nav_next() end, options)
vim.keymap.set("n", "<leader>h", function() ui.nav_prev() end, options)
vim.keymap.set("n", "th", ":bprev<CR>", options)
vim.keymap.set("n", "td", ":bd<CR>", options)
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")
vim.keymap.set("t", "jk", "<C-\\><C-n>")

vim.keymap.set("n", "<leader>cc", "<cmd>!nix build<cr>", options)
vim.keymap.set("n", "<leader>cv", "<cmd>!nix run<cr>", options)
