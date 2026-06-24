local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

---@param repo string
---@return string
local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  { src = gh 'akinsho/bufferline.nvim', version = vim.version.range '*' },
  gh 'nvim-tree/nvim-web-devicons', -- bufferline
}

require('bufferline').setup {
  -- Move to previous/next
  map('n', '<s-tab>', '<Cmd>BufferLineCyclePrev<CR>', opts),
  map('n', '<tab>', '<Cmd>BufferLineCycleNext<CR>', opts),

  -- Re-order to previous/next
  map('n', '<A-,>', '<Cmd>BufferLineMovePrev<CR>', opts),
  map('n', '<A-.>', '<Cmd>BufferLineMoveNext<CR>', opts),

  -- Goto buffer in position...
  map('n', '<A-1>', '<Cmd>BufferLineGoToBuffer 1<CR>', opts),
  map('n', '<A-2>', '<Cmd>BufferLineGoToBuffer 2<CR>', opts),
  map('n', '<A-3>', '<Cmd>BufferLineGoToBuffer 3<CR>', opts),
  map('n', '<A-4>', '<Cmd>BufferLineGoToBuffer 4<CR>', opts),
  map('n', '<A-5>', '<Cmd>BufferLineGoToBuffer 5<CR>', opts),
  map('n', '<A-6>', '<Cmd>BufferLineGoToBuffer 6<CR>', opts),
  map('n', '<A-7>', '<Cmd>BufferLineGoToBuffer 7<CR>', opts),
  map('n', '<A-8>', '<Cmd>BufferLineGoToBuffer 8<CR>', opts),
  map('n', '<A-9>', '<Cmd>BufferLineGoToBuffer 9<CR>', opts),

  -- Close buffer
  map('n', '<leader>x', '<Cmd>bdelete!<CR>', opts),
}
