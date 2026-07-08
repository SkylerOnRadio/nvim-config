return {
	{
		"coffebar/neovim-project",
		opts = {
			projects = {
				"~/Projects/*",
				"~/work/",
				-- "~/.config/*",
				"~/.config/quickshell/",
				"~/.config/hypr/",
				"~/Documents/Notes/",
				"~/Documents/Journal/",
			},
			picker = {
				type = "telescope",
			},
			datapath = vim.fn.stdpath("data"),
			last_session_on_startup = false,
			dashboard_mode = false,
			filetype_autocmd_timeout = 300,
			forget_project_keys = {
				i = "<C-d>",
				n = "d",
			},
			per_branch_sessions = true,
			session_manager_opts = {
				autosave_ignore_dirs = {
					vim.fn.expand("~"),
					"/tmp",
				},
				autosave_ignore_filetypes = {
					"ccc-ui",
					"dap-repl",
					"dap-view",
					"dap-view-term",
					"gitcommit",
					"gitrebase",
					"qf",
					"toggleterm",
				},
				picker = {
					type = "telescope",

					preview = {
						enabled = true,
						git_status = true,
						git_fetch = false,
						show_hidden = true,
					},
				},
			},
		},
		init = function()
			local so = vim.opt.sessionoptions:get()
			table.insert(so, "globals")
			vim.opt.sessionoptions = so
		end,
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim" },
			{ "Shatur/neovim-session-manager" },
		},
		lazy = false,
		priority = 100,
	},
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-ui-select.nvim",
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
				},
			})

			-- Load extensions
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("fzf")
		end,
	},
}
