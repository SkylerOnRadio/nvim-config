return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				custom_highlights = function(colors)
					return {
						-- Creating a unique highlight group just for yanking
						YankFlash = { bg = colors.mauve, fg = colors.crust },
					}
				end,
			})

			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
