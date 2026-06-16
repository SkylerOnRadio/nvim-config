return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		keys = {
			{ "<leader>t", "<cmd>ToggleTerm direction=float<CR>", desc = "Toggle Terminal" },
		},
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<c-\>]],
				float_opts = { border = "curved" },
			})
		end,
	},
}
