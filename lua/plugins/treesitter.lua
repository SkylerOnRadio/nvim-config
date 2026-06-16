return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").setup({ -- tree-sitter path to download parsers
				install_dir = vim.fn.stdpath("data") .. "/site",
			})
			vim.api.nvim_create_autocmd("FileType", { -- filetypes to perform highlighting on
				pattern = { "cpp", "c", "lua" },
				callback = function()
					vim.treesitter.start()
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- auto indent
				end,
			})
		end,
	},
}
