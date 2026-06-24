-- [[ Colorscheme ]]

-- You can easily change to a different colorscheme.
-- Change the name of the colorscheme plugin below, and then
-- change the command under that to load whatever the name of that colorscheme is.
--
-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.

---@param repo string
---@return string
local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'catppuccin/nvim', name = 'catppuccin' } }

---@diagnostic disable-next-line: missing-fields
require('catppuccin').setup {}

-- Load the colorscheme here.
-- Like many other themes, this one has different styles, and you could load
-- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
-- catppuccin-nvim, catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
vim.cmd.colorscheme 'catppuccin-nvim'
