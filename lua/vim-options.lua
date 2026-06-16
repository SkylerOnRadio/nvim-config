vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.g.mapleader = " "
vim.diagnostic.config({ virtual_text = true })

vim.opt.clipboard = "unnamedplus"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.termguicolors = true

-- Keymaps
vim.keymap.set("n", "<leader>bd", "<leader>bd", { desc = "Close Buffer" })
