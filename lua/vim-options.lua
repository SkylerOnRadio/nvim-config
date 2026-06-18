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

-- alpha makes it so that the window it was opened in has text wrap disabled, this is to undo that on opening a file in the same window
vim.api.nvim_create_autocmd("BufEnter", {
	group = vim.api.nvim_create_augroup("ForceWrap", { clear = true }),
	pattern = "*",
	callback = function()
		if vim.bo.buftype == "" then
			vim.opt_local.wrap = true
		end
	end,
})

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

-- use visual move when near wrapped lines
vim.keymap.set(
	{ "n", "v" },
	"j",
	"v:count == 0 ? 'gj' : 'j'",
	{ expr = true, silent = true, desc = "Move down visually" }
)
vim.keymap.set(
	{ "n", "v" },
	"k",
	"v:count == 0 ? 'gk' : 'k'",
	{ expr = true, silent = true, desc = "Move up visually" }
)
