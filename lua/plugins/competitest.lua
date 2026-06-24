---@param repo string
---@return string
local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  gh 'xeluxee/competitest.nvim',
  gh 'MunifTanjim/nui.nvim', -- competitest
}

require('competitest').setup {
  compile_command = {
    cpp = {
      exec = 'g++',
      args = { '-std=c++23', '-O2', '-g', '$(FNAME)', '-o', '$(FNOEXT)' },
    },
    rust = {
      exec = 'cargo',
      args = { 'build', '--release', '--bin', '$(FNOEXT)' },
    },
  },
  run_command = {
    cpp = { exec = './$(FNOEXT)' },
    rust = {
      exec = 'cargo',
      args = { 'run', '--release', '--bin', '$(FNOEXT)' },
    },
    py = { exec = 'python3 $(FNOEXT).py' },
  },
  template_file = {
    -- c = "~/path/to/file.c",
    cc = '~/.config/nvim/lua/plugins/competitest/template.cc',
    py = '~/.config/nvim/lua/plugins/competitest/template.py',
    rs = '~/.config/nvim/lua/plugins/competitest/template.rs',
  },

  testcases_input_file_format = '$(FNOEXT)_in$(TCNUM)',
  testcases_output_file_format = '$(FNOEXT)_out$(TCNUM)',

  maximum_time = 10000,

  evaluate_template_modifiers = true,
  received_files_extension = 'rs',

  vim.keymap.set('n', '<leader>cr', '<cmd>CompetiTest run<cr>', { desc = 'ct run test' }),
  vim.keymap.set('n', '<leader>cc', '<cmd>CompetiTest receive contest<cr>', { desc = 'ct receive contest' }),
  vim.keymap.set('n', '<leader>cp', '<cmd>CompetiTest receive problem<cr>', { desc = 'ct receive problem' }),
  vim.keymap.set('n', '<leader>ct', '<cmd>CompetiTest receive testcases<cr>', { desc = 'ct receive testcases' }),
  vim.keymap.set('n', '<leader>cn', '<cmd>CompetiTest add_testcase<cr>', { desc = 'ct new testcase' }),
  vim.keymap.set('n', '<leader>ce', '<cmd>CompetiTest edit_testcase<cr>', { desc = 'ct edit testcase' }),
  vim.keymap.set('n', '<leader>cu', '<cmd>CompetiTest show_ui<cr>', { desc = 'ct show ui' }),
}
