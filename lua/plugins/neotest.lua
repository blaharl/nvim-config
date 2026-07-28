---@param repo string
---@return string
local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  gh 'nvim-neotest/neotest',
  gh 'nvim-neotest/neotest-python',
  gh 'nvim-neotest/nvim-nio', -- neotest
  gh 'antoinemadec/FixCursorHold.nvim', -- neotest
}

require('neotest').setup {
  adapters = {
    require 'neotest-python' {
      dap = { justMyCode = false },
    },
    -- require 'neotest-plenary',
    -- require 'neotest-vim-test' {
    --   ignore_file_types = { 'python', 'vim', 'lua' },
    -- },
  },
}

vim.keymap.set('n', ']n', '<cmd>:Neotest jump next<cr>', { desc = 'neotest jump next' })
vim.keymap.set('n', '[n', '<cmd>:Neotest jump prev<cr>', { desc = 'neotest jump prev' })
vim.keymap.set('n', '<leader>nr', '<cmd>:Neotest run<cr>', { desc = 'neotest run' })
vim.keymap.set('n', '<leader>no', '<cmd>:Neotest output-panel<cr>', { desc = 'neotest output panel' })
vim.keymap.set('n', '<leader>ns', '<cmd>:Neotest summary<cr>', { desc = 'neotest summary' })
