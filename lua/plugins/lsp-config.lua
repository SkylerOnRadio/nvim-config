return {
	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = { "lua_ls", "clangd", "ts_ls", "bashls", "marksman" },
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			local servers = { "lua_ls", "clangd" }
			for _, server in ipairs(servers) do
				vim.lsp.enable(server)
			end

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local opts = { buffer = args.buf }
					local map = function(modes, lhs, rhs, desc)
						vim.keymap.set(modes, lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
					end

					-- Navigation
					map("n", "K", vim.lsp.buf.hover, "Hover docs")
					map("n", "gd", vim.lsp.buf.definition, "Go to definition")
					map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
					map("n", "gi", vim.lsp.buf.implementation, "Go to implementation")
					map("n", "gr", vim.lsp.buf.references, "References")
					map("n", "gy", vim.lsp.buf.type_definition, "Go to type definition")

					-- Actions
					map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
					map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")

					-- Diagnostics  ← the error keymap you asked for
					map("n", "<leader>ge", vim.diagnostic.open_float, "Show line diagnostics")
					map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
					map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
					map("n", "<leader>q", vim.diagnostic.setloclist, "Diagnostics to loclist")

					-- Signature help
					map("i", "<C-k>", vim.lsp.buf.signature_help, "Signature help")
				end,
			})
		end,
	},
	{
		"MysticalDevil/inlay-hints.nvim",
		event = "LspAttach",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("inlay-hints").setup()
		end,
	},
}
