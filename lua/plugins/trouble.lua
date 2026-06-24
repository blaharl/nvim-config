---@param repo string
---@return string
local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  gh 'folke/trouble.nvim',
}

require('trouble').setup {
  vim.keymap.set('n', '<leader>dx', '<cmd>Trouble diagnostics toggle<cr>', { desc = 'Diagnostics (Trouble)' }),
  vim.keymap.set('n', '<leader>dX', '<cmd>Trouble diagnostics toggle filter.buf=0<cr>', { desc = 'Buffer Diagnostics (Trouble)' }),
  vim.keymap.set('n', '<leader>dS', '<cmd>Trouble symbols toggle focus=false<cr>', { desc = 'Symbols (Trouble)' }),
  vim.keymap.set('n', '<leader>dl', '<cmd>Trouble lsp toggle focus=false win.position=right<cr>', { desc = 'LSP Definitions / references / ... (Trouble)' }),
  vim.keymap.set('n', '<leader>dL', '<cmd>Trouble loclist toggle<cr>', { desc = 'Location List (Trouble)' }),
  vim.keymap.set('n', '<leader>dQ', '<cmd>Trouble qflist toggle<cr>', { desc = 'Quickfix List (Trouble)' }),
}
