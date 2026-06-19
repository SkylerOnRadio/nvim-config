return {
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

			-- Define Catppuccin Mocha Highlight Groups
			vim.api.nvim_set_hl(0, "AlphaAscii", { fg = "#89b4fa" }) -- Blue
			vim.api.nvim_set_hl(0, "AlphaShortcut", { fg = "#fab387", bold = true }) -- Peach
			vim.api.nvim_set_hl(0, "AlphaIcon", { fg = "#94e2d5" }) -- Teal
			vim.api.nvim_set_hl(0, "AlphaLabel", { fg = "#cdd6f4" }) -- Text
			vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#7f849c", italic = true }) -- Overlay1

			local ascii = {
				"⣿⣿⣿⣿⣿⣿⣿⣿⡿⢋⣥⣾⣿⣿⣷⣦⡹⣿⣿⣿⠘⡧⡇⠈⠀⡿⠟⠘⢛⣛⣘⡀⣘⣿⣟⣀⡀⠿⢿⢛⢅⡤⣿⣿⣿⡇⡿⠀⠀⠀⠠⢌⣒⣶⣖⡂⢩⣽⣿⣿⣿⣿",
				"⣿⣿⣿⣿⣿⣿⣿⠟⣴⣿⣿⣎⢿⣿⡿⢻⣧⠰⣾⣁⠀⣸⣷⡨⠐⠒⣒⡭⠅⡀⠙⠻⢶⣮⣝⡫⢙⢿⣶⡶⢦⣀⠉⢿⣿⡇⠁⠀⢀⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
				"⣿⣿⣿⣿⣿⣿⠡⣾⣿⣿⣿⣿⣆⠹⣀⢘⡛⠃⠉⢀⠔⣩⡿⠁⢻⣶⣤⣵⣄⢦⢡⡠⢄⠙⢿⣿⣶⣅⠙⢷⣦⡙⠳⣄⠙⢁⡀⢀⣡⣤⣤⣤⡈⠙⠻⣿⣿⣿⣿⣿⣿⣿",
				"⣿⣿⣿⣿⣿⣿⣧⢻⣿⠿⣿⣿⣿⣦⠘⢈⠜⠁⠀⣠⣾⣿⠃⢠⣽⣏⢻⣿⣿⣧⡂⢿⣷⣄⠱⣽⣿⣿⣿⣆⠹⡹⣦⣀⠀⠀⠐⢎⣉⠛⢿⣿⣿⣷⡑⢻⣿⣿⣿⣿⣿⣿",
				"⣿⣿⣿⣿⣿⣿⣿⢃⣿⡐⢮⡙⢛⣛⡃⠀⠀⠀⣰⣿⣿⠃⠀⣼⣟⣿⡇⢻⣿⣿⣷⡈⢿⣿⡛⣷⠹⣿⣿⣿⣧⡀⢻⢻⣷⣄⠀⠈⢻⣿⡆⡍⠉⠙⢿⣌⣿⣿⣿⣿⣿⣿",
				"⣿⣿⣿⣿⣿⡟⣡⡏⠀⠀⠀⢨⣂⠙⠑⢀⡄⢀⣿⣿⣿⠀⡄⣿⢸⣿⡟⡄⢹⣿⣿⣷⡘⣿⡇⢸⣇⠹⣿⣿⣿⣿⠀⣧⣹⣿⣷⣄⠀⠀⢤⡀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿",
				"⠻⣿⣿⣿⣟⠀⣿⣿⣶⣾⣿⡆⠿⠁⢠⡾⠁⣸⣿⣿⡇⢰⢿⣿⢸⣿⣿⢰⣠⣿⣿⣿⣧⣸⣷⠀⣇⠀⢹⣿⣿⢹⠀⢸⣧⠡⡹⣿⣷⠑⠌⢻⣾⣶⣄⠈⠹⣿⣿⣿⣿⣿",
				"⣷⣝⠻⣿⣿⣇⣿⣿⣿⡟⢋⣠⠀⢠⢟⡼⠃⣿⣿⣿⡇⢸⢸⣿⠈⣿⣿⡈⣿⡏⢻⣿⣿⡇⢿⠀⣿⠀⠈⣿⣿⡸⠀⠀⢻⣇⢱⠙⣿⣇⠈⢆⠉⢉⣛⡃⠠⠘⢿⣿⣿⣿",
				"⠙⠻⢦⡈⢻⣿⡘⠿⠋⠔⠛⠋⠀⢏⠞⣱⠀⣿⣿⣿⡇⢸⢸⡟⠀⣿⣿⡇⢹⣇⠀⢻⣿⣿⣸⠀⣿⠀⠀⢸⣿⡇⠀⠀⠘⣿⡎⠀⠛⣿⠀⠘⡆⠀⠙⠻⣿⣶⣤⣙⡻⣿",
				"⣄⡀⠀⠈⠀⠙⣿⣆⠀⠀⠠⠃⢰⠊⣼⠏⢠⣿⣿⣿⣇⠀⢸⡇⠀⣿⣿⡇⣿⣿⠀⢆⢻⣿⡇⠀⣿⠀⠀⢸⡿⠀⠾⠞⠂⠛⣣⣦⣆⢹⠀⠀⠸⣦⠀⢀⠀⠀⠀⣀⠀⣿",
				"⣛⣛⠻⠶⢤⡀⠈⠻⠀⠀⠀⠀⠈⠞⢡⡆⢰⣿⣿⣿⣿⡀⢺⣿⠀⣿⣿⡇⣿⣿⢠⠘⡌⣿⠇⣠⠿⣀⣵⢆⠏⠀⠀⠨⣭⣭⣑⡒⠀⠈⠁⠀⠂⢿⣇⠀⠀⠉⠂⠀⠁⣿",
				"⣒⣂⣤⣤⠄⠀⠀⠀⠀⠀⠀⡀⣀⣴⣿⡇⠈⣿⡿⣿⣿⡇⢸⣿⠀⣿⣿⢧⢹⡿⠼⢀⣁⣙⠺⢶⣿⣿⣿⡸⣤⡀⠠⢰⢸⣿⡿⠇⢶⠠⡀⠀⠀⢸⣿⠀⠀⠀⠀⠀⠀⠸",
				"⣒⣭⡥⠖⠋⠁⠀⠀⠷⠐⠀⠘⣿⣿⣿⣇⢀⢹⣿⠘⣿⣧⠘⣿⠀⣿⡿⠸⠈⠁⠉⣐⣤⣀⢐⣛⣿⣿⣿⣷⣬⣿⣶⣤⣭⡁⣄⣠⣴⡆⠃⠀⠀⢸⣿⠀⢀⠀⠀⠀⠀⠀",
				"⠿⠁⠀⠀⠀⠀⠀⠀⣁⠀⠠⡁⣦⣭⣭⣿⡘⡎⣿⣧⠘⣿⣇⠹⠀⣿⠀⠋⠀⠐⠛⢿⣿⡿⠃⣿⣿⣿⣿⢰⠖⣩⡏⢿⣿⣿⣿⣿⣿⣿⡆⠀⠀⢸⠏⢷⡰⣄⠀⠀⠀⠀",
				"⠀⠀⠀⠀⠀⡀⠀⡀⢻⡷⢰⣧⠘⠿⠟⠋⠁⠻⠘⣿⣧⡘⣿⣄⠡⠀⠀⡀⠆⡭⢨⢸⠟⢁⣾⣿⣿⣿⣿⣶⣾⡟⣿⢘⣿⣿⣿⣿⣿⣿⣧⠀⠀⣸⠀⠈⠃⠘⢿⣦⠀⢀",
				"⠀⠀⠀⠀⣰⣿⣿⡇⠘⢇⣿⣿⠀⡈⠻⣿⣿⡀⢷⠹⣿⣇⠘⠖⡀⠂⠸⠿⠦⠀⡒⢠⣴⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣾⡿⠿⣿⣿⣿⣿⡏⠁⠈⠉⠁⠀⢢⣄⣀⡙⠳⢤",
				"⠀⠂⠀⣾⣿⣿⣿⠀⣶⣄⢻⠃⠀⠿⠶⠌⠻⠧⠈⣦⠹⣿⣷⣄⢥⣦⡀⢿⣄⣠⣷⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠩⠒⠀⣼⣿⣿⣿⡇⠀⠀⠀⠀⠀⢸⣿⣿⣿⣶⣶",
				"⠀⢀⣼⣿⣿⣿⣿⡇⠘⣧⡀⢸⡀⢀⠉⠛⣛⡛⡀⣌⢧⠘⣿⣿⣷⣝⠻⣄⠈⢛⠻⠿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⠀⠀⠀⠀⣿⣿⣿⣿⢣⡆⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿",
				"⡇⡄⣿⣿⣿⣿⣿⢣⣷⡜⠃⣼⡧⢈⡳⣦⠀⠴⠶⠸⣎⢣⡈⢿⣿⣿⣷⣍⠳⠆⠍⠓⠶⠾⢿⣿⣿⣿⣿⡟⠀⠀⠀⠀⠀⠀⣿⣿⣿⡏⣼⠁⠀⣠⠀⠀⣸⣿⣿⣿⣿⣿",
				"⠐⠀⣿⣿⣿⣿⣿⢸⣿⣷⠠⣿⡇⠀⠻⣦⡌⡁⣠⠄⢹⡆⠑⢄⠻⣿⣿⣿⣷⣤⡀⠒⢶⣶⣶⣿⣿⣿⣿⡇⢀⣤⣄⠑⢦⡀⣿⣿⠟⣸⣧⣾⣾⣿⠀⣰⣿⣿⣿⣿⣿⣿",
				"⠀⢀⣿⣿⣿⡿⠋⡐⣿⣿⡇⠛⣠⣷⣄⠐⢥⡀⠹⣈⣀⢻⣆⢮⡢⡙⢿⣏⡛⠿⠿⠷⠴⣭⡙⠛⠿⣿⣿⣿⡌⠙⣿⣷⣮⣇⢻⠟⡰⣿⣿⣿⣿⣿⣼⣿⣿⣿⣿⣿⣿⣿",
				"⡆⠶⣬⢻⣿⣄⢰⣿⣮⠻⣧⣤⠉⠻⠿⠿⠦⠍⠀⠙⠃⠀⢿⡷⠙⢮⡀⠙⢿⣄⠐⢶⣶⣶⣶⣿⣿⣿⣿⣿⣿⣦⣈⣙⡛⢿⠘⠀⠀⢬⡙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
				"⣿⣿⠶⠘⠏⣴⢸⣿⡿⠱⠞⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣇⡆⠀⠉⠂⠀⠙⢦⡈⠹⣆⠀⠈⠉⠛⠛⠻⠿⠿⢿⣿⣿⡗⠀⠀⠀⠡⡄⢳⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿",
				"⡄⣰⣿⣿⣷⣿⡆⠟⣠⢀⣴⣶⣆⢻⣶⣦⣄⡀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠐⠥⣈⠳⢄⠙⢷⣄⠀⠀⣀⣤⡶⠀⠀⠀⠀⣀⡀⠀⠀⠀⠈⢀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿",
				"⣷⣮⣍⣉⠈⢋⣚⣛⠁⢸⣿⣿⢿⣦⠹⣿⣿⣿⣿⣶⣤⣴⣤⡄⢀⠀⠀⢀⡀⢻⣦⣤⡀⠀⢀⣈⣛⠿⣿⡟⣁⠀⠀⠈⣎⢿⢇⡄⢿⡐⢀⠈⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿",
			}

			local function build_layout()
				-- Process Left Side
				local ascii_max_width = 0
				for _, line in ipairs(ascii) do
					ascii_max_width = math.max(ascii_max_width, vim.fn.strdisplaywidth(line))
				end
				local padded_ascii = {}
				for _, line in ipairs(ascii) do
					local pad = ascii_max_width - vim.fn.strdisplaywidth(line)
					table.insert(padded_ascii, line .. string.rep(" ", pad))
				end

				-- Process Right Side
				local stats = require("lazy").stats()
				local footer_display =
					string.format("󰒲  %d plugins loaded in %dms", stats.count, math.floor(stats.startuptime))

				local right_elements = {
					{
						type = "button",
						shortcut = "n",
						icon = "󰈔",
						text = "New file",
						cmd = "<cmd>ene <BAR> startinsert<CR>",
					},
					{
						type = "button",
						shortcut = "f",
						icon = "󰍉",
						text = "Find file",
						cmd = "<cmd>Telescope find_files<CR>",
					},
					{
						type = "button",
						shortcut = "p",
						icon = "󱔗",
						text = "Find projects",
						cmd = "<cmd>NeovimProjectDiscover history<CR>",
					},
					{
						type = "button",
						shortcut = "r",
						icon = "󱋡",
						text = "Recent files",
						cmd = "<cmd>Telescope oldfiles<CR>",
					},
					{
						type = "button",
						shortcut = "g",
						icon = "󰱽",
						text = "Live grep",
						cmd = "<cmd>Telescope live_grep<CR>",
					},
					{ type = "button", shortcut = "l", icon = "󰒲", text = "Lazy", cmd = "<cmd>Lazy<CR>" },
					{ type = "button", shortcut = "q", icon = "󰩈", text = "Quit", cmd = "<cmd>qa<CR>" },
					{ type = "empty" },
					{ type = "footer", display = footer_display },
				}

				local right_max_width = 0
				for _, item in ipairs(right_elements) do
					if item.type == "button" then
						-- Sleeker formatting: " n  󰈔  New file"
						item.display = string.format(" %s  %s  %s", item.shortcut, item.icon, item.text)
					end
					if item.display then
						right_max_width = math.max(right_max_width, vim.fn.strdisplaywidth(item.display))
					end
				end

				-- Merge Sides
				local gap = "          " -- 10 Spaces
				local layout_items = {}
				local total_lines = math.max(#padded_ascii, #right_elements)

				local start_ascii = math.floor((total_lines - #padded_ascii) / 2) + 1
				local start_right = math.floor((total_lines - #right_elements) / 2) + 1

				for i = 1, total_lines do
					local ascii_idx = i - start_ascii + 1
					local left_str = (ascii_idx >= 1 and ascii_idx <= #padded_ascii) and padded_ascii[ascii_idx]
						or string.rep(" ", ascii_max_width)
					local left_bytes = #left_str

					local right_idx = i - start_right + 1
					local right_item = right_elements[right_idx]

					if right_item and right_item.type == "button" then
						local pad_right = string.rep(" ", right_max_width - vim.fn.strdisplaywidth(right_item.display))
						local full_str = left_str .. gap .. right_item.display .. pad_right

						-- Dynamic Byte Positions for Custom Color Rendering
						local shortcut_start = left_bytes + #gap + 1
						local shortcut_end = shortcut_start + #right_item.shortcut
						local icon_start = shortcut_end + 2
						local icon_end = icon_start + #right_item.icon
						local text_start = icon_end + 2
						local text_end = text_start + #right_item.text

						table.insert(layout_items, {
							type = "button",
							val = full_str,
							on_press = function()
								local key =
									vim.api.nvim_replace_termcodes(right_item.cmd .. "<Ignore>", true, false, true)
								vim.api.nvim_feedkeys(key, "t", false)
							end,
							opts = {
								position = "center",
								cursor = shortcut_start,
								hl = {
									{ "AlphaAscii", 0, left_bytes },
									{ "AlphaShortcut", shortcut_start, shortcut_end },
									{ "AlphaIcon", icon_start, icon_end },
									{ "AlphaLabel", text_start, text_end },
								},
								keymap = {
									"n",
									right_item.shortcut,
									right_item.cmd,
									{ noremap = true, silent = true, nowait = true },
								},
							},
						})
					elseif right_item and right_item.type == "footer" then
						local pad_right = string.rep(" ", right_max_width - vim.fn.strdisplaywidth(right_item.display))
						local full_str = left_str .. gap .. right_item.display .. pad_right
						table.insert(layout_items, {
							type = "text",
							val = full_str,
							opts = {
								position = "center",
								hl = {
									{ "AlphaAscii", 0, left_bytes },
									{ "AlphaFooter", left_bytes + #gap, left_bytes + #gap + #right_item.display },
								},
							},
						})
					else
						table.insert(layout_items, {
							type = "text",
							val = left_str .. gap .. string.rep(" ", right_max_width),
							opts = { position = "center", hl = { { "AlphaAscii", 0, left_bytes } } },
						})
					end
				end
				return layout_items, total_lines
			end

			local layout_items, total_lines = build_layout()

			dashboard.opts.layout = {
				{
					type = "padding",
					val = function()
						return math.max(0, math.floor((vim.fn.winheight(0) - total_lines) / 2))
					end,
				},
				{
					type = "group",
					val = layout_items,
				},
			}

			dashboard.opts.opts.setup = function()
				vim.wo.wrap = false
			end

			dashboard.opts.opts.noautocmd = true
			alpha.setup(dashboard.opts)

			-- Handle sizing recalculations dynamically
			vim.api.nvim_create_autocmd({ "VimResized", "WinClosed" }, {
				pattern = "*",
				callback = function()
					vim.schedule(function()
						if vim.bo.filetype == "alpha" then
							require("alpha").redraw()
						end
					end)
				end,
			})

			-- Auto-reopen alpha when closing the last buffer
			vim.api.nvim_create_autocmd("User", {
				pattern = "BufDelete",
				callback = function()
					local bufs = vim.fn.getbufinfo({ buflisted = 1 })
					if #bufs == 0 then
						alpha.start(false)
					end
				end,
			})

			vim.keymap.set("n", "<leader>a", "<cmd>Alpha<CR>", { desc = "Open dashboard" })
		end,
	},
}
