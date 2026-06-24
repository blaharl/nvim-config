-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

---@param repo string
---@return string
local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  { src = gh 'nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  gh 'nvim-lua/plenary.nvim',
  gh 'MunifTanjim/nui.nvim',
}

vim.keymap.set('n', '\\', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })

require('neo-tree').setup {
  filesystem = {
    window = {
      mappings = {
        ['\\'] = 'close_window',
      },
    },
  },
  event_handlers = {
    {
      event = 'neo_tree_buffer_enter',
      handler = function()
        vim.o.relativenumber = true
        vim.o.number = true
      end,
    },
  },
  vim.keymap.set('n', '<c-n>', '<cmd>:Neotree toggle<cr>'),
}
