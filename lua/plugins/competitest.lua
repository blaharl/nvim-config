return {
	{
		"xeluxee/competitest.nvim",
		dependencies = "MunifTanjim/nui.nvim",
		cmd = "CompetiTest",
		opts = {
			compile_command = {
				cc = {
					exec = "g++",
					args = { "-g", "$(FNAME)", "-o", "$(FNOEXT)" },
				},
				cpp = {
					exec = "g++",
					args = { "-g", "$(FNAME)", "-o", "$(FNOEXT)" },
				},
			},
			run_command = {
				cc = { exec = "./$(FNOEXT)" },
				cpp = { exec = "./$(FNOEXT)" },
			},
			-- testcases_input_file_format = "$(FNOEXT)_input$(TCNUM).txt",
			-- testcases_output_file_format = "$(FNOEXT)_output$(TCNUM).txt",
			template_file = {
				-- c = "~/path/to/file.c",
				cc = "~/Projects/ps/templates/template.cc",
				cpp = "~/Projects/ps/templates/template.cc",
				-- py = "~/path/to/file.py",
				-- rust = "",
				cpp = "~/Projects/ps/templates/template.cpp",
			},

			testcases_input_file_format = "$(FNOEXT)_in$(TCNUM)",
			testcases_output_file_format = "$(FNOEXT)_out$(TCNUM)",

			maximum_time = 20000,

			evaluate_template_modifiers = true,
			received_files_extension = "cc",
		},
		keys = {
			{ "<leader>cr", "<cmd>CompetiTest run<cr>", desc = "ct run test" },
			{ "<leader>cc", "<cmd>CompetiTest receive contest<cr>", desc = "ct receive contests" },
			{ "<leader>cp", "<cmd>CompetiTest receive problem<cr>", desc = "ct receive problem" },
			{ "<leader>ct", "<cmd>CompetiTest receive testcases<cr>", desc = "ct receive testcases" },
			{ "<leader>cn", "<cmd>CompetiTest add_testcase<cr>", desc = "ct new testcase" },
			{ "<leader>ce", "<cmd>CompetiTest edit_testcase<cr>", desc = "ct edit testcase" },
			{ "<leader>cu", "<cmd>CompetiTest show_ui<cr>", desc = "ct show ui" },
		},
		-- config = function()
		-- 	require("competitest").setup()
		-- end,
	},
}
