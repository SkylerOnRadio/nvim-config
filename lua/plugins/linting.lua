return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>cf",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				mode = { "n", "v" },
				desc = "Format buffer (or selection)",
			},
		},
		opts = {},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					-- C / C++
					c = { "clang-format" },
					cpp = { "clang-format" },

					-- Lua
					lua = { "stylua" },

					-- Python  (black for style, then isort for imports)
					python = { "black", "isort" },

					-- JS / TS / web
					javascript = { "prettierd", stop_after_first = true },
					typescript = { "prettierd", stop_after_first = true },
					javascriptreact = { "prettierd", stop_after_first = true },
					typescriptreact = { "prettierd", stop_after_first = true },
					css = { "prettierd" },
					html = { "prettierd" },

					-- Data / config
					json = { "prettierd" },
					yaml = { "prettierd" },
					toml = { "taplo" },

					-- Shell
					sh = { "shfmt" },
					bash = { "shfmt" },

					-- Markdown
					markdown = { "prettierd" },

					-- Fallback: try LSP formatting for anything not listed
					["_"] = { "trim_whitespace", "trim_newlines" },
				},

				format_on_save = {
					lsp_format = "fallback",
					timeout_ms = 500, -- bumped: black/isort need a little more time
				},

				-- Formatter-specific overrides
				formatters = {
					shfmt = {
						prepend_args = { "-i", "2", "-ci" }, -- 2-space indent, case-indent
					},
					black = {
						prepend_args = { "--line-length", "88" },
					},
					isort = {
						prepend_args = { "--profile", "black" }, -- keep compatible with black
					},
				},
			})

			-- Show conform errors instead of silently swallowing them
			vim.notify = vim.notify
			vim.api.nvim_create_user_command("FormatDisable", function(args)
				if args.bang then
					vim.b.disable_autoformat = true -- buffer-local
				else
					vim.g.disable_autoformat = true -- global
				end
			end, { bang = true, desc = "Disable autoformat-on-save" })

			vim.api.nvim_create_user_command("FormatEnable", function()
				vim.b.disable_autoformat = false
				vim.g.disable_autoformat = false
			end, { desc = "Re-enable autoformat-on-save" })
		end,
	},

	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPost", "BufWritePost", "BufNewFile" },
		config = function()
			local lint = require("lint")

			lint.linters_by_ft = {
				-- C / C++  (clangd handles most of this, but cppcheck adds static analysis)
				c = { "cpplint" },
				cpp = { "cpplint" },

				-- Lua
				lua = { "luacheck" },

				-- Python
				python = { "ruff" }, -- ruff replaces flake8/pylint and is much faster

				-- JS / TS
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },

				-- Shell
				sh = { "shellcheck" },
				bash = { "shellcheck" },

				-- YAML (e.g. GitHub Actions, Docker Compose)
				yaml = { "yamllint" },

				-- Markdown
				markdown = { "markdownlint" },
			}

			-- Linter config overrides
			lint.linters.luacheck = vim.tbl_deep_extend("force", lint.linters.luacheck, {
				args = {
					"--globals",
					"vim", -- stop luacheck complaining about `vim`
					"--formatter",
					"plain",
					"--codes",
					"--ranges",
					"-",
				},
			})

			-- Auto-lint on these events (not just on save)
			local lint_augroup = vim.api.nvim_create_augroup("nvim-lint", { clear = true })
			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})

			-- Manual lint keymap
			vim.keymap.set("n", "<leader>cl", function()
				lint.try_lint()
			end, { desc = "Trigger linting for current file" })
		end,
	},
}
