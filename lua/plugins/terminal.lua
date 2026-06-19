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
				auto_scroll = true,
				float_opts = {
					border = "curved",
				},
			})
		end,
	},
}
