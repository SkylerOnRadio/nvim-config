return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			vim.opt.showcmd = true
			vim.opt.showcmdloc = "statusline"

			local function show_macro_recording()
				local recording_register = vim.fn.reg_recording()
				if recording_register == "" then
					return ""
				else
					return "Recording @" .. recording_register
				end
			end

			require("lualine").setup({
				options = {
					theme = "auto",
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch", "diff", "diagnostics" },
					lualine_c = { "filename" },
					lualine_x = { show_macro_recording, "%S", "filetype" },
					lualine_y = { "progress" },
					lualine_z = { "location" },
				},
			})
			vim.opt.shortmess:append("s")
		end,
	},
}
