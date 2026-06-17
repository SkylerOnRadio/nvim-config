return {
	-- 1. Use indent-blankline for the quiet, static background lines
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			require("ibl").setup({
				indent = {
					char = "│",
					highlight = { "IblIndent" },
				},
				scope = {
					enabled = false, -- Disable IBL's static scope so mini.indentscope can take over
				},
			})
		end,
	},

	-- 2. Use mini.indentscope configured EXACTLY like LazyVim
	{
		"nvim-mini/mini.indentscope",
		version = false,
		config = function()
			require("mini.indentscope").setup({
				draw = {
					delay = 100,
					predicate = function(scope)
						return not scope.body.is_incomplete
					end,
					priority = 2,
				},
				mappings = {
					object_scope = "ii",
					object_scope_with_border = "ai",
					goto_top = "[i",
					goto_bottom = "]i",
				},
				options = {
					border = "both",
					indent_at_cursor = true,
					n_lines = 10000,
					try_as_border = false,
				},
				symbol = "│",
			})

			-- LazyVim Autocommand: Disable indentscope in specific filetypes (Dashboard, Help, Terminal, etc.)
			vim.api.nvim_create_autocmd("FileType", {
				pattern = {
					"alpha",
					"dashboard",
					"fzf",
					"help",
					"lazy",
					"lazyterm",
					"mason",
					"neo-tree",
					"notify",
					"toggleterm",
					"Trouble",
					"trouble",
				},
				callback = function()
					vim.b.miniindentscope_disable = true
				end,
			})

			-- Set the active scope color to Catppuccin Mauve (#cba6f7)
			vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = "#cba6fe", nocombine = true })
		end,
	},
}
