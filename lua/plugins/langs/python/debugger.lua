-- lua/plugins/dap-python.lua
return {
	-- Core DAP plugin
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			-- UI for the debugger
			{
				"rcarriga/nvim-dap-ui",
				dependencies = { "nvim-neotest/nvim-nio" },
				opts = {},
				config = function(_, opts)
					local dap = require("dap")
					local dapui = require("dapui")
					dapui.setup(opts)
					-- icons

					vim.fn.sign_define(
						"DapBreakpoint",
						{ text = " 🔴", texthl = "DiagnosticError", linehl = "", numhl = "" }
					)

					-- Auto open/close UI
					dap.listeners.after.event_initialized["dapui_config"] = function()
						dapui.open()
					end
					dap.listeners.before.event_terminated["dapui_config"] = function()
						dapui.close()
					end
					dap.listeners.before.event_exited["dapui_config"] = function()
						dapui.close()
					end
				end,
			},

			-- Virtual text showing variable values
			{
				"theHamsta/nvim-dap-virtual-text",
				opts = {},
			},

			-- Python-specific adapter
			{
				"mfussenegger/nvim-dap-python",
				config = function()
					local dap = require("dap")
					-- If installed via Mason:
					require("dap-python").setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python")
					-- remote
					table.insert(dap.configurations.python, {
						type = "python",
						request = "attach",
						name = "Attach to Process (5678)",
						connect = {
							host = "localhost",
							port = 5678,
						},
					})
				end,
			},
		},

		keys = {
      -- Basic debugging
    -- stylua: ignore start
      { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
      { "<leader>dc", function() require("dap").continue() end, desc = "Continue" },
      { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
      { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
      { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
      { "<leader>dj", function() require("dap").down() end, desc = "Down" },
      { "<leader>dk", function() require("dap").up() end, desc = "Up" },
      { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
      { "<leader>do", function() require("dap").step_over() end, desc = "Step Over" },
      { "<leader>dO", function() require("dap").step_out() end, desc = "Step Out" },
      { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
      { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
      { "<leader>ds", function() require("dap").session() end, desc = "Session" },
      { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
      { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
      -- DAP UI
      { "<leader>du", function() require("dapui").toggle({}) end, desc = "Dap UI" },
      { "<leader>de", function() require("dapui").eval() end, desc = "Eval", mode = {"n", "v"} },
			-- stylua: ignore end
			{
				"<leader>dI",
				function()
					local lines = {
						"import debugpy",
						'debugpy.listen(("localhost", 5678))',
						'print("                              ")',
						'print(" Debugpy listening on port 5678 ", flush=True)',
						'print("                              ")',
						"",
					}
					vim.api.nvim_buf_set_lines(0, 0, 0, false, lines)
				end,
				desc = "Insert debugpy listener at top",
				ft = "python",
			},
		},
	},
}
