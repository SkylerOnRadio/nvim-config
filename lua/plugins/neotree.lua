return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
		config = function()
			vim.keymap.set("n", "<leader>e", function()
				vim.cmd("Neotree filesystem reveal left")
			end, { desc = "Toggle file tree" })

			vim.api.nvim_create_autocmd("DirChanged", {
				callback = function()
					require("neo-tree.command").execute({
						action = "focus",
						source = "filesystem",
						position = "left",
						dir = vim.fn.getcwd(),
					})
				end,
			})
		end,
	},
}
