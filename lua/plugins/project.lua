return {
	{
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup({
				manual_mode = false,
				detection_methods = { "pattern" },
				patterns = { ".git", "Makefile", "package.json" },
				silent_chdir = false,
				scope_chdir = "global",
				datapath = vim.fn.stdpath("data"),
			})
			require("telescope").load_extension("projects")
		end,
	},
}
