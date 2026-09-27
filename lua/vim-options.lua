-- Enable faster startup by caching compiled Lua module
vim.loader.enable()

vim.g.mapleader = " " -- map <Leader> to space
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true -- show line numbers relative to the line you are on

vim.opt.undofile = true -- keep history of undo and redo accross sessions

vim.opt.ignorecase = true -- case-insensitive search
vim.opt.smartcase = true -- case sensitive search if more than one capital letter

vim.opt.signcolumn = "yes" -- use the space to the left of the line numbers to show icons related to the code
vim.opt.updatetime = 250 -- number of milliseconds of user inactivity before the editor writes the swap file to disk
vim.opt.timeoutlen = 300 -- decreae the time to register a mapped sequence

vim.o.inccommand = "split" -- Preview substitutions live

vim.opt.cursorlineopt = "number" -- only highlight the number, not the whole line

vim.opt.confirm = true -- prompt when existing modified buffer

vim.o.scrolloff = 10 -- minimal number of screen lines to keep above and below the cursor

vim.opt.expandtab = true -- make pressing tab insert spaces in insert mode
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.diagnostic.config({ virtual_text = true }) -- show line diagnostic at the end of the line

vim.opt.clipboard = "unnamedplus" -- use the system clipboard for yanking & deleting & pasting

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

vim.opt.termguicolors = true -- stop using 256-color terminal approximations and use the custom colors provided exactly

-- TODO: move this to lsp specific file
-- enable inline diagnostic messages, disable LSP icons in the left side of the line numbers
vim.diagnostic.config({
	virtual_text = true,
	signs = false,
})

-- TODO: move this to style file for nvim
-- make the line number of the the current line to this specific color
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#cba6f7", bold = true })

-- highlight the text when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank({ higroup = "YankFlash", timeout = 200 })
	end,
})

-- Keymaps (Read the desc for what they do)
