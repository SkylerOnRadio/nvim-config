-- UNDO SETTINGS
vim.opt.undofile = true

-- TAB SETTINGS
vim.opt.expandtab = true -- make pressing tab insert spaces in insert mode
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.diagnostic.config({ virtual_text = true }) -- show line diagnostic at the end of the line

vim.opt.clipboard = "unnamedplus" -- use the system clipboard for yanking & deleting & pasting

vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true -- show line numbers relative to the line you are on

vim.opt.wrap = true -- enable line wrapping
vim.opt.linebreak = true -- wrap lines at spaces and not mid word
vim.opt.breakindent = true -- maintain the indentation when wrapping lines

vim.opt.signcolumn = "yes" -- use the space to the left of the line numbers to show icons related to the code
vim.opt.updatetime = 250 -- number of milliseconds of user inactivity before the editor writes the swap file to disk
vim.opt.termguicolors = true -- stop using 256-color terminal approximations and use the custom colors provided exactly

-- enable inline diagnostic messages, disable LSP icons in the left side of the line numbers
vim.diagnostic.config({
	virtual_text = true,
	signs = false,
})

-- make the line number of the the current line to this specific color
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#cba6f7", bold = true })
vim.opt.cursorline = true -- needed for CursorLineNr to activate
vim.opt.cursorlineopt = "number" -- only highlight the number, not the whole line

-- highlight the text when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "YankFlash", timeout = 200 })
	end,
})

-- Keymaps (Read the desc for what they do)
vim.g.mapleader = " " -- map <Leader> to space

vim.keymap.set("n", "<leader>bd", "<Cmd>bdelete<CR>", { desc = "Close Buffer", silent = true })

-- Move single lines silently
vim.keymap.set("n", "<A-j>", "<Cmd>m .+1<CR>==", { desc = "Move line down", silent = true })
vim.keymap.set("n", "<A-k>", "<Cmd>m .-2<CR>==", { desc = "Move line up", silent = true })

-- Move selected blocks in Visual mode silently
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })
