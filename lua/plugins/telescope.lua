return {
	-- 1. Project Management Core
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
		end,
	},

	-- 2. Telescope Configuration
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-ui-select.nvim",
			"ahmedkhalf/project.nvim",
		},
		config = function()
			local builtin = require("telescope.builtin")

			-- Global Keymaps
			vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
			vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Grep word under cursor" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find open buffers" })
			vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc = "Find recent files" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })

			-- Setup Telescope with Extension Mappings
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
					projects = {
						-- Intercepting the selection inside the project list
						mappings = {
							i = {
								["<CR>"] = function(prompt_bufnr)
									local project_actions = require("telescope._extensions.project.actions")
									local has_persistence, persistence = pcall(require, "persistence")

									if has_persistence then
										-- 1. Save and pause current project's session tracking
										persistence.stop()
									end

									-- 2. Wipe current active buffers so old project context doesn't spill over
									vim.cmd("silent! %bd")

									-- 3. Let project.nvim execute the directory change
									project_actions.change_working_directory(prompt_bufnr, "global")

									if has_persistence then
										-- 4. Automatically locate and pull up the target project's session file
										persistence.load()
									end
								end,
							},
							n = {
								["<CR>"] = function(prompt_bufnr)
									local project_actions = require("telescope._extensions.project.actions")
									local has_persistence, persistence = pcall(require, "persistence")

									if has_persistence then
										persistence.stop()
									end
									vim.cmd("silent! %bd")
									project_actions.change_working_directory(prompt_bufnr, "global")
									if has_persistence then
										persistence.load()
									end
								end,
							},
						},
					},
				},
			})

			-- Load extensions
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("projects")

			-- Project keymap pointing directly to the picker
			vim.keymap.set("n", "<leader>fp", "<cmd>Telescope projects<CR>", { desc = "Find Projects" })
		end,
	},
}
