local dap = require("dap")
local dapui = require("dapui")

require("mason-nvim-dap").setup({
	-- Makes a best effort to setup the various debuggers with
	-- reasonable debug configurations
	automatic_setup = true,

	-- You can provide additional configuration to the handlers,
	-- see mason-nvim-dap README for more information
	handlers = {},

	-- You'll need to check that you have the required things installed
	-- online, please don't ask me how to install them :)
	ensure_installed = {
		-- Update this to ensure that you have the debuggers for the langs you want
		"cpptools",
	},
})

-- Basic debugging keymaps, feel free to change to your liking!
vim.keymap.set("n", "<F5>", dap.continue, { desc = "Debug: Start/Continue" })
vim.keymap.set("n", "<F7>", dap.step_into, { desc = "Debug: Step Into" })
vim.keymap.set("n", "<F8>", dap.step_over, { desc = "Debug: Step Over" })
vim.keymap.set("n", "<F9>", dap.step_out, { desc = "Debug: Step Out" })
vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>db", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Debug: Set Breakpoint" })

local dap = require("dap")

-- dap.adapters.gdb = {
-- 	type = "executable",
-- 	command = "gdb",
-- 	args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
-- }

dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = "/home/user/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
}

dap.adapters.gdb = {
	id = "gdb",
	type = "executable",
	command = "gdb",
	args = { "--quiet", "--interpreter=dap", "--eval-command", "set print pretty on" },
}

dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "cppdbg",
		request = "launch",
		setupCommands = {
			{
				text = "-enable-pretty-printing",
				description = "enable pretty printing",
				ignoreFailures = false,
			},
		},
		args = function()
			local args_str = vim.fn.input({
				prompt = "Arguments: ",
			})
			return vim.split(args_str, " +")
		end,
		program = function()
			local path = vim.fn.input({
				prompt = "Path to executable: ",
				default = vim.fn.getcwd() .. "/",
				completion = "file",
			})

			return (path and path ~= "") and path or dap.ABORT
		end,
		cwd = "${workspaceFolder}",
		stopAtEntry = true,
	},
	{
		name = "Attach to gdbserver :1234",
		type = "cppdbg",
		request = "launch",
		setupCommands = {
			{
				text = "-enable-pretty-printing",
				description = "enable pretty printing",
				ignoreFailures = false,
			},
		},
		MIMode = "gdb",
		miDebuggerServerAddress = "localhost:1234",
		miDebuggerPath = "/etc/profiles/per-user/user/bin/gdb",
		cwd = "${workspaceFolder}",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
	},
}

-- dap.configurations.cpp = {
-- 	{
-- 		name = "Run executable (GDB)",
-- 		type = "gdb",
-- 		request = "launch",
-- 		-- This requires special handling of 'run_last', see
-- 		-- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355
-- 		program = function()
-- 			local path = vim.fn.input({
-- 				prompt = "Path to executable: ",
-- 				default = vim.fn.getcwd() .. "/",
-- 				completion = "file",
-- 			})
--
-- 			return (path and path ~= "") and path or dap.ABORT
-- 		end,
-- 	},
-- 	{
-- 		name = "Run executable with arguments (GDB)",
-- 		type = "gdb",
-- 		request = "launch",
-- 		-- This requires special handling of 'run_last', see
-- 		-- https://github.com/mfussenegger/nvim-dap/issues/1025#issuecomment-1695852355
-- 		program = function()
-- 			local path = vim.fn.input({
-- 				prompt = "Path to executable: ",
-- 				default = vim.fn.getcwd() .. "/",
-- 				completion = "file",
-- 			})
--
-- 			return (path and path ~= "") and path or dap.ABORT
-- 		end,
-- 		args = function()
-- 			local args_str = vim.fn.input({
-- 				prompt = "Arguments: ",
-- 			})
-- 			return vim.split(args_str, " +")
-- 		end,
-- 	},
-- 	{
-- 		name = "Attach to process (GDB)",
-- 		type = "gdb",
-- 		request = "attach",
-- 		processId = require("dap.utils").pick_process,
-- 	},
-- }

-- dap.configurations.cpp = dap.configurations.c
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

-- Dap UI setup
-- For more information, see |:help nvim-dap-ui|
dapui.setup({
	-- Set icons to characters that are more likely to work in every terminal.
	--    Feel free to remove or use ones that you like more! :)
	--    Don't feel like these are good choices.
	icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
	controls = {
		icons = {
			pause = "⏸",
			play = "▶",
			step_into = "⏎",
			step_over = "⏭",
			step_out = "⏮",
			step_back = "b",
			run_last = "▶▶",
			terminate = "⏹",
			disconnect = "⏏",
		},
	},
})

-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Debug: See last session result." })

dap.listeners.after.event_initialized["dapui_config"] = dapui.open
dap.listeners.before.event_terminated["dapui_config"] = dapui.close
dap.listeners.before.event_exited["dapui_config"] = dapui.close

-- Install golang specific config
require("dap-go").setup()
