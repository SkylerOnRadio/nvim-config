return {
	{ -- ← outer braces added
		"lewis6991/gitsigns.nvim",
		config = function()
			-- change the hex codes of the git signs
			vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#a7c080" }) -- Green for additions
			vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#8caaee" }) -- Blue for changes
			vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#e67e80" }) -- Red for deletions
			vim.api.nvim_set_hl(0, "GitSignsTopdelete", { fg = "#e67e80" }) -- Red for top deletions
			vim.api.nvim_set_hl(0, "GitSignsChangedelete", { fg = "#e67e80" }) -- Red for change-deletions
			vim.api.nvim_set_hl(0, "GitSignsUntracked", { fg = "#7a8478" }) -- Grey for untracked files

			require("gitsigns").setup({
				signs = {
					add = { text = "┃" },
					change = { text = "┃" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
					untracked = { text = "┆" },
				},
				current_line_blame = true,
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol",
					delay = 500, -- ← reduced from 1000ms
					ignore_whitespace = false,
				},
				current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",

				on_attach = function(bufnr)
					local gs = require("gitsigns")

					vim.keymap.set("n", "]c", function()
						if vim.wo.diff then
							vim.cmd.normal({ "]c", bang = true })
						else
							gs.nav_hunk("next")
						end
					end, { desc = "Jump to next git [c]hange", buf = bufnr })

					vim.keymap.set("n", "[c", function()
						if vim.wo.deff then
							vim.cmd.normal({ "[c", bang = true })
						else
							gs.nav_hunk("prev")
						end
					end, { desc = "Jump to previous git [c]hange", buf = bufnr })

					vim.keymap.set("n", "<leader>hD", function()
						gs.diffthis("~")
					end, { desc = "git diff against last commit, buf = bufnr" })
				end,
			})
		end,
	},
}
