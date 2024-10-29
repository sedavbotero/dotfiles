vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set("n", "<leader>D", "\"_d")
vim.keymap.set("v", "<leader>D", "\"_d")

vim.keymap.set("n", "<leader>E", vim.diagnostic.open_float)
