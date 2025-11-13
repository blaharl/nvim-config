return {
	{
		"xeluxee/competitest.nvim",
		dependencies = "MunifTanjim/nui.nvim",
		cmd = "CompetiTest",
		opts = {
			compile_command = {
				cc = {
					exec = "g++",
					args = { "$(FNAME)", "-o", "$(FNOEXT)", "-O2", "-g" },
				},
				rs = {
					exec = "rustc",
					args = { "$(FNAME)", "-o", "$(FNOEXT)" },
				},
			},
			run_command = {
				cc = { exec = "./$(FNOEXT)" },
				rs = { exec = "./$(FNOEXT)" },
				py = { exec = "python3 $(FNOEXT).py" },
			},
			template_file = {
				-- c = "~/path/to/file.c",
				cc = "~/.config/nvim/lua/plugins/competitest/template.cc",
				py = "~/.config/nvim/lua/plugins/competitest/template.py",
				rs = "~/.config/nvim/lua/plugins/competitest/template.rs",
			},

			testcases_input_file_format = "$(FNOEXT)_in$(TCNUM)",
			testcases_output_file_format = "$(FNOEXT)_out$(TCNUM)",

			maximum_time = 10000,

			evaluate_template_modifiers = true,
			received_files_extension = "cc",
			-- received_files_extension = "rs",
		},
		keys = {
			{ "<leader>cr", "<cmd>CompetiTest run<cr>", desc = "ct run test" },
			{ "<leader>cc", "<cmd>CompetiTest receive contest<cr>", desc = "ct receive contest" },
			{ "<leader>cp", "<cmd>CompetiTest receive problem<cr>", desc = "ct receive problem" },
			{ "<leader>ct", "<cmd>CompetiTest receive testcases<cr>", desc = "ct receive testcases" },
			{ "<leader>cn", "<cmd>CompetiTest add_testcase<cr>", desc = "ct new testcase" },
			{ "<leader>ce", "<cmd>CompetiTest edit_testcase<cr>", desc = "ct edit testcase" },
			{ "<leader>cu", "<cmd>CompetiTest show_ui<cr>", desc = "ct show ui" },
		},
	},
}
