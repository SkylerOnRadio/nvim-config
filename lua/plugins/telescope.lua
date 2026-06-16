return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("projects")

			vim.keymap.set("n", "<leader>fp", ":Telescope projects<CR>", { desc = "Find Projects" })
		end,
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {
			need = 1,
			branch = true,
		},
		config = function(_, opts)
			require("persistence").setup(opts)
			vim.api.nvim_create_autocmd("DirChanged", {
				pattern = "global",
				callback = function()
					vim.schedule(function()
						require("persistence").load()
					end)
				end,
			})
		end,
	},
}
