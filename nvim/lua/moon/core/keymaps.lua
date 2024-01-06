local key = vim.keymap

vim.g.mapleader = " "
key.set("n", "<leader>pv", vim.cmd.Ex)

-- Use 'jk' to exit insert mode
key.set("i", "jk", "<ESC>", { noremap = true, silent = true })

-- Page movement
key.set("n", "<C-d>", "<C-d>zz")
key.set("n", "<C-u>", "<C-u>zz")
