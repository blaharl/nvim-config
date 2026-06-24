---@param repo string
---@return string
local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  gh 'folke/zen-mode.nvim',
  gh 'folke/twilight.nvim',
}

require('zen-mode').setup {}
require('twilight').setup {}
