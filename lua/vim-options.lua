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

vim.opt.cmdheight = 0

vim.diagnostic.config({
	virtual_text = true,
	signs = false,
})

vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#cba6f7", bold = true }) -- catppuccin mauve
vim.opt.cursorline = true -- needed for CursorLineNr to activate
vim.opt.cursorlineopt = "number" -- only highlight the number, not the whole line

-- Keymaps
vim.keymap.set("n", "<leader>bd", "<leader>bd", { desc = "Close Buffer" })
