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

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "YankFlash", timeout = 200 })
	end,
})

-- Keymaps
-- If using standard Neovim buffers:
vim.keymap.set("n", "<leader>bd", "<Cmd>bdelete<CR>", { desc = "Close Buffer", silent = true })

-- Move single lines silently
vim.keymap.set("n", "<A-j>", "<Cmd>m .+1<CR>==", { desc = "Move line down", silent = true })
vim.keymap.set("n", "<A-k>", "<Cmd>m .-2<CR>==", { desc = "Move line up", silent = true })

-- Move selected blocks in Visual mode silently
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })
