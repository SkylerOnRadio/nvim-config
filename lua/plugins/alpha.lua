-- alpha.lua
return {
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			dashboard.section.header.val = {
				"                                                     ",
				"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
				"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
				"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
				"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
				"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
				"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
				"                                                     ",
			}

			dashboard.section.buttons.val = {
				dashboard.button("n", "  New file", "<cmd>ene <BAR> startinsert<CR>"),
				dashboard.button("f", "  Find file", "<cmd>Telescope find_files<CR>"),
				dashboard.button("r", "  Recent files", "<cmd>Telescope oldfiles<CR>"),
				dashboard.button("g", "  Live grep", "<cmd>Telescope live_grep<CR>"),
				dashboard.button("l", "  Lazy", "<cmd>Lazy<CR>"),
				dashboard.button("q", "  Quit", "<cmd>qa<CR>"),
			}

			local function footer()
				local stats = require("lazy").stats()
				return stats.count .. " plugins loaded in " .. math.floor(stats.startuptime) .. "ms"
			end

			dashboard.section.footer.val = footer()
			dashboard.section.footer.opts.hl = "Comment"
			dashboard.section.header.opts.hl = "Title"
			dashboard.section.buttons.opts.hl = "Keyword"

			dashboard.opts.layout = {
				{ type = "padding", val = vim.fn.max({ 2, vim.fn.floor(vim.fn.winheight(0) / 4) }) },
				dashboard.section.header,
				{ type = "padding", val = 2 },
				dashboard.section.buttons,
				{ type = "padding", val = 1 },
				dashboard.section.footer,
			}

			dashboard.opts.opts.noautocmd = true
			alpha.setup(dashboard.opts)

			vim.api.nvim_create_autocmd("User", {
				pattern = "BufDelete",
				callback = function()
					local bufs = vim.fn.getbufinfo({ buflisted = 1 })
					if #bufs == 0 then
						alpha.start(false)
					end
				end,
			})

			-- shared keymap uses the same function
			vim.keymap.set("n", "<leader>fp", "<cmd>Telescope neovim-project discover<CR>", { desc = "Find Projects" })
			vim.keymap.set("n", "<leader>a", "<cmd>Alpha<CR>", { desc = "Open dashboard" })
		end,
	},
}
