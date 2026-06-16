return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					cpp = { "clang-format" },
					c = { "clang-format" },
				},
				format_on_save = {
					lsp_format = "fallback",
					timeout_ms = 300,
				},
			})
		end,
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				lua = { "luacheck" },
			}
		end,
	},
}
