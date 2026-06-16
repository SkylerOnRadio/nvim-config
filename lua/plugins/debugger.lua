return {
	{
		"mfussenegger/nvim-dap",
		dependencies = { "rcarriga/nvim-dap-ui", "mason-org/mason.nvim", "jay-babu/mason-nvim-dap.nvim" },
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup()

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			vim.keymap.set("n", "<Leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoints" })
			vim.keymap.set("n", "<Leader>dc", dap.continue, { desc = "Continue/Start Debug" })

			-- loading debuggers from Mason
			require("mason-nvim-dap").setup({
				ensure_installed = { "codelldb" },
				handlers = {
					function(config)
						require("mason-nvim-dap").default_setup(config)
					end,
				},
			})
		end,
	},
	{ "rcarriga/nvim-dap-ui", dependencies = { "nvim-neotest/nvim-nio", "mfussenegger/nvim-dap" } },
}
