return {
	{ -- ← outer braces added
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "┃" },
					change = { text = "┃" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				current_line_blame = true, -- ← turn this on to see blame
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol",
					delay = 500, -- ← reduced from 1000ms
					ignore_whitespace = false,
				},
				current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",
			})
		end,
	}, -- ← outer braces closed
}
