---@param repo string
---@return string
local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  gh 'folke/snacks.nvim',
  gh 'nvim-tree/nvim-web-devicons', -- snacks
  gh 'nvim-mini/mini.icons', -- snacks
}

---@type snacks.Config
require('snacks').setup {
  toggle = { enable = true },
  vim.keymap.set('n', '<c-n>', function() Snacks.explorer() end, { desc = 'open explorer' }),
  vim.keymap.set('n', '<leader>zl', function() Snacks.lazygit() end, { desc = 'open lazygit' }),
  vim.keymap.set('n', '<leader>zs', function() Snacks.scratch() end, { desc = 'Toggle Scratch Buffer' }),
  vim.keymap.set('n', '<leader>zS', function() Snacks.scratch.select() end, { desc = 'Select Scratch Buffer' }),
  vim.keymap.set('n', '<leader>ze', function() Snacks.zen() end, { desc = 'Toggle Zen Mode' }),
  vim.keymap.set('n', '<leader>zd', function()
    if Snacks.dim.enabled then
      Snacks.dim.disable()
    else
      Snacks.dim()
    end
  end, { desc = 'Toggle Dim Mode' }),
  vim.keymap.set('n', '<leader>zi', function()
    if Snacks.indent.enabled then
      Snacks.indent.disable()
    else
      Snacks.indent.enable()
    end
  end, { desc = 'Toggle Indent Mode' }),
}
