return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			vim.opt.termguicolors = true
			local bufferline = require("bufferline")

			bufferline.setup({
				options = {
					mode = "buffers",
					style_preset = bufferline.style_preset.default,
					themable = true,
					numbers = "none",
					close_command = "bdelete! %d",
					right_mouse_command = "bdelete! %d",
					left_mouse_command = "buffer %d",
					middle_mouse_command = nil,
					indicator = {
						icon = "▎",
						style = "icon",
					},
					buffer_close_icon = "󰅖",
					modified_icon = "● ",
					close_icon = " ",
					left_trunc_marker = " ",
					right_trunc_marker = " ",
					name_formatter = function(buf)
						-- Add custom formatting logic here if needed
					end,
					max_name_length = 18,
					max_prefix_length = 15,
					truncate_names = true,
					tab_size = 18,
					diagnostics = false,
					diagnostics_update_in_insert = false,
					diagnostics_update_on_event = true,
					diagnostics_indicator = function(count, level, diagnostics_dict, context)
						return "(" .. count .. ")"
					end,
					custom_filter = function(buf_number, buf_numbers)
						-- Example: filter out filetypes you don't want to see
						if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
							return true
						end
						return true
					end,
					offsets = {
						{
							filetype = "NvimTree",
							text = "File Explorer",
							text_align = "left",
							separator = true, -- Fixed missing comma here
						},
					},
					color_icons = true,
					get_element_icon = function(element)
						local icon, hl =
							require("nvim-web-devicons").get_icon_by_filetype(element.filetype, { default = false })
						return icon, hl
					end,
					show_buffer_icons = true,
					show_buffer_close_icons = true,
					show_close_icon = true,
					show_tab_indicators = true,
					show_duplicate_prefix = true,
					duplicates_across_groups = true,
					persist_buffer_sort = true,
					move_wraps_at_ends = false,
					separator_style = "slope",
					enforce_regular_tabs = false,
					always_show_bufferline = false,
					auto_toggle_bufferline = true,
					hover = {
						enabled = true,
						delay = 200,
						reveal = { "close" },
					},
					sort_by = "insert_after_current",
					pick = {
						alphabet = "abcdefghijklmopqrstuvwxyzABCDEFGHIJKLMOPQRSTUVWXYZ1234567890",
					},
				},
			}) -- Fixed missing closing parenthesis here
		end,
	},
}
