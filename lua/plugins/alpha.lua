-- alpha.lua
return {
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")

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

			-- STEP 1: Process Left Side (ASCII Art)
			local ascii_max_width = 0
			for _, line in ipairs(ascii) do
				ascii_max_width = math.max(ascii_max_width, vim.fn.strdisplaywidth(line))
			end
			local padded_ascii = {}
			for _, line in ipairs(ascii) do
				local pad = ascii_max_width - vim.fn.strdisplaywidth(line)
				table.insert(padded_ascii, line .. string.rep(" ", pad))
			end

			-- STEP 2: Process Right Side (Options + Footer)
			local stats = require("lazy").stats()
			-- Adds 5 spaces to precisely align with the text of the buttons above it!
			local footer_display =
				string.format("     %d plugins loaded in %dms", stats.count, math.floor(stats.startuptime))

			local right_elements = {
				{ type = "button", shortcut = "n", text = "New file", cmd = "<cmd>ene <BAR> startinsert<CR>" },
				{ type = "button", shortcut = "f", text = "Find file", cmd = "<cmd>Telescope find_files<CR>" },
				{
					type = "button",
					shortcut = "p",
					text = "File project",
					cmd = "<cmd>lua vim.schedule(function() vim.cmd('Telescope projects') end)<CR>",
				},
				{ type = "button", shortcut = "r", text = "Recent files", cmd = "<cmd>Telescope oldfiles<CR>" },
				{ type = "button", shortcut = "g", text = "Live grep", cmd = "<cmd>Telescope live_grep<CR>" },
				{ type = "button", shortcut = "l", text = "Lazy", cmd = "<cmd>Lazy<CR>" },
				{ type = "button", shortcut = "q", text = "Quit", cmd = "<cmd>qa<CR>" },
				{ type = "empty" }, -- Visual gap between buttons and footer
				{ type = "footer", display = footer_display },
			}

			-- Format the display strings for buttons
			for _, item in ipairs(right_elements) do
				if item.type == "button" then
					item.display = string.format("[%s]  %s", item.shortcut, item.text)
				end
			end

			-- Find the max width of the right side so it forms a clean structural block
			local right_max_width = 0
			for _, item in ipairs(right_elements) do
				if item.display then
					right_max_width = math.max(right_max_width, vim.fn.strdisplaywidth(item.display))
				end
			end

			-- STEP 3: Merge Left and Right Side
			local gap = "          " -- 10 Spaces. Adjust this to push the blocks further apart!
			local layout_items = {}
			local total_lines = math.max(#padded_ascii, #right_elements)

			-- Calculate starting lines so both blocks are perfectly centered vertically relative to each other
			local start_ascii = math.floor((total_lines - #padded_ascii) / 2) + 1
			local start_right = math.floor((total_lines - #right_elements) / 2) + 1

			for i = 1, total_lines do
				-- Extract corresponding ASCII row
				local ascii_idx = i - start_ascii + 1
				local left_str = ""
				if ascii_idx >= 1 and ascii_idx <= #padded_ascii then
					left_str = padded_ascii[ascii_idx]
				else
					left_str = string.rep(" ", ascii_max_width)
				end
				local left_bytes = #left_str

				-- Extract corresponding Right Element row
				local right_idx = i - start_right + 1
				local right_item = right_elements[right_idx]

				if right_item and right_item.type == "button" then
					local pad_right = string.rep(" ", right_max_width - vim.fn.strdisplaywidth(right_item.display))
					local full_str = left_str .. gap .. right_item.display .. pad_right

					-- Compute exact byte positions for NeoVim highlights
					local shortcut_start = left_bytes + #gap + 1
					local shortcut_end = shortcut_start + #right_item.shortcut
					local text_start = shortcut_end + 3
					local text_end = text_start + #right_item.text

					table.insert(layout_items, {
						type = "button",
						val = full_str,
						on_press = function()
							local key = vim.api.nvim_replace_termcodes(right_item.cmd .. "<Ignore>", true, false, true)
							vim.api.nvim_feedkeys(key, "t", false)
						end,
						opts = {
							position = "center",
							cursor = shortcut_start,
							hl = {
								{ "Title", 0, left_bytes },
								{ "Keyword", shortcut_start, shortcut_end },
								{ "Comment", text_start, text_end },
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

					local footer_start = left_bytes + #gap
					local footer_end = footer_start + #right_item.display

					table.insert(layout_items, {
						type = "text",
						val = full_str,
						opts = {
							position = "center",
							hl = {
								{ "Title", 0, left_bytes },
								{ "Comment", footer_start, footer_end },
							},
						},
					})
				else
					-- Just a blank right side on this row
					local full_str = left_str .. gap .. string.rep(" ", right_max_width)
					table.insert(layout_items, {
						type = "text",
						val = full_str,
						opts = {
							position = "center",
							hl = { { "Title", 0, left_bytes } },
						},
					})
				end
			end

			-- STEP 4: Render to dashboard
			dashboard.opts.layout = {
				{
					type = "padding",
					val = function()
						-- Ensures the entire widget sits perfectly in the vertical center of the terminal window
						return math.max(0, math.floor((vim.fn.winheight(0) - total_lines) / 2))
					end,
				},
				{
					type = "group",
					val = layout_items,
				},
			}

			dashboard.opts.opts.noautocmd = true
			alpha.setup(dashboard.opts)

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
