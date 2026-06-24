---@param repo string
---@return string
local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  gh 'MeanderingProgrammer/render-markdown.nvim',
  gh 'nvim-treesitter/nvim-treesitter', -- render-markdown
  gh 'nvim-mini/mini.nvim', -- render-markdown
  gh 'nvim-mini/mini.icons', -- render-markdown
  gh 'nvim-tree/nvim-web-devicons', -- render-markdown
}

require('render-markdown').setup {}
