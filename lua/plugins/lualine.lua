return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			vim.opt.showcmd = true
			vim.opt.showcmdloc = "statusline"

			local function show_macro_recording()
				local register = vim.fn.reg_recording()
				if register == "" then
					return ""
				end
				return "  @" .. register
			end

			-- refresh lualine when macro recording starts/stops
			vim.api.nvim_create_autocmd("RecordingEnter", {
				callback = function()
					require("lualine").refresh()
				end,
			})
			vim.api.nvim_create_autocmd("RecordingLeave", {
				callback = function()
					vim.defer_fn(function()
						require("lualine").refresh()
					end, 50)
				end,
			})

			require("lualine").setup({
				options = {
					theme = "auto",
					globalstatus = true, -- single statusline across all splits
				},
				sections = {
					lualine_a = {
						{ "mode" },
					},
					lualine_b = {
						{ "branch" },
					},
					lualine_c = {
						{
							"filename",
							symbols = {
								modified = "",
								readonly = "",
								unnamed = "",
							},
							filename_color = {
								modified = "#f9e2af",
								readonly = "#828783",
							},
						},
						{
							"diagnostics",
							symbols = {
								error = " ",
								warn = " ",
								info = " ",
								diagnostics_color = {
									error = { fg = "#f38ba8" },
									warn = { fg = "#f9e2af" },
									info = { fg = "#a7c080" },
								},
							},
						},
					},
					lualine_x = {
						{
							"diff",
							source = function() -- pull from gitsigns instead of built-in
								local gs = vim.b.gitsigns_status_dict
								if not gs then
									return nil
								end
								return {
									added = gs.added,
									modified = gs.changed,
									removed = gs.removed,
								}
							end,
							symbols = {
								added = " ",
								modified = " ",
								removed = " ",
							},
							diff_color = {
								added = { fg = "#a7c080" },
								modified = { fg = "#8caaee" },
								removed = { fg = "#f38ba8" },
							},
						},
						{ show_macro_recording, color = { fg = "#f38ba8", gui = "bold" } },
						{ "%S" },
						{
							"filetype",
							icon_only = false,
						},
					},
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
			})

			vim.opt.shortmess:append("s")
		end,
	},
}
