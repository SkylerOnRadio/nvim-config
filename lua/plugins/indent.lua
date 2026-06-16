return {
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		config = function()
			local highlight = { "RainbowDelimiter" }

			local hooks = require("ibl.hooks")

			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowDelimiter", { fg = "#cba6f7" }) -- catppuccin mauve
			end)

			require("ibl").setup({
				indent = {
					char = "│",
					highlight = { "IblIndent" }, -- dim color for normal indent lines
				},
				scope = {
					enabled = true,
					highlight = highlight, -- bright color for current scope
					show_start = false, -- underline on scope open line
					show_end = true, -- underline on scope close line
				},
			})

			-- scope requires treesitter to detect the current block
			hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
		end,
	},
}
