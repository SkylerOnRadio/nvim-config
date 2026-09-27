vim.keymap.set("n", "<leader>bd", "<Cmd>bdelete<CR>", { desc = "Close Buffer", silent = true })

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Move single lines silently
vim.keymap.set("n", "<A-j>", "<Cmd>m .+1<CR>==", { desc = "Move line down", silent = true })
vim.keymap.set("n", "<A-k>", "<Cmd>m .-2<CR>==", { desc = "Move line up", silent = true })

-- Move selected blocks in Visual mode silently
vim.keymap.set("x", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down", silent = true })
vim.keymap.set("x", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up", silent = true })

-- use visual move when near wrapped lines
vim.keymap.set(
	{ "n", "x" },
	"j",
	"v:count == 0 ? 'gj' : 'j'",
	{ expr = true, silent = true, desc = "Move down visually" }
)
vim.keymap.set(
	{ "n", "x" },
	"k",
	"v:count == 0 ? 'gk' : 'k'",
	{ expr = true, silent = true, desc = "Move up visually" }
)

vim.keymap.set({ "n" }, "yf", "<cmd>%y+<CR>", { desc = "Copy all the lines in the buffer" })
