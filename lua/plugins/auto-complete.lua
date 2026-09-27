return {
	{
		"saghen/blink.cmp",
		version = "*",
		lazy = false,
		build = "cargo build --release",
		dependencies = {
			-- Load friendly-snippets directly into blink.cmp
			"rafamadriz/friendly-snippets",
		},
		opts = {
			keymap = { preset = "default" },
			appearance = {
				use_nvim_cmp_as_default = false,
				nerd_font_variant = "mono",
			},
			completion = {
				documentation = { auto_show = true, auto_show_delay_ms = 500 },
			},
			sources = {
				-- 'snippets' is re-added here
				default = { "lsp", "path", "snippets", "buffer" },
			},
			signature = { enabled = true },

			-- We do NOT define 'snippets = { preset = "luasnip" }' here.
			-- By omitting it, blink.cmp automatically uses its native engine.
		},
	},
}
