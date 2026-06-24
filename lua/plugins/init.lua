---Because most plugins are hosted on GitHub, you can use the helper
---function to have less repetition in the following sections.
---@param repo string
---@return string
local function gh(repo) return 'https://github.com/' .. repo end

-- [[ Installing and Configuring Plugins ]]
--
-- To install a plugin simply call `vim.pack.add` with its git url.
-- This will download the default branch of the plugin, which will usually be `main` or `master`
-- You can also have more advanced specs, which we will talk about later.
--
-- For most plugins its not enough to install them, you also need to call their `.setup()` to start them.
--
-- For example, lets say we want to install `guess-indent.nvim` - a plugin for
-- automatically detecting and setting the indentation.
--
-- We first install it from https://github.com/NMAC427/guess-indent.nvim
-- and then call its `setup()` function to start it with default settings.
vim.pack.add {
  gh 'NMAC427/guess-indent.nvim',
  gh 'windwp/nvim-autopairs',
  gh 'lukas-reineke/indent-blankline.nvim',
  gh 'nvim-lualine/lualine.nvim',
  gh 'nvim-tree/nvim-web-devicons', -- lualine
  gh 'folke/noice.nvim',
  gh 'MunifTanjim/nui.nvim', -- noice, hardtime
  gh 'rcarriga/nvim-notify', -- noice
  gh 'akinsho/toggleterm.nvim',
  gh 'windwp/nvim-autopairs',
  gh 'mbbill/undotree',
  gh 'drop-stones/im-switch.nvim',
  gh 'nvim-lua/plenary.nvim', -- im-switch, todo-comments
  gh 'folke/todo-comments.nvim',
  gh 'm4xshen/hardtime.nvim',
  gh 'hedyhli/outline.nvim',
  gh 'christoomey/vim-tmux-navigator',
}

--  For example, here is the simplest possible setup for `guess-indent.nvim`,
--  which will automatically detect and set your indentation settings based on the current file.
require('guess-indent').setup {}

-- Highlight todo, notes, etc in comments
require('todo-comments').setup { signs = false }

require('nvim-autopairs').setup {}

require('ibl').setup {}

require('lualine').setup {}

-- event = 'VeryLazy'
require('noice').setup {
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
      ['vim.lsp.util.stylize_markdown'] = true,
      -- ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = true, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = true, -- add a border to hover docs and signature help
  },
}

require('toggleterm').setup {
  keys = {
    { '<A-n>', ':ToggleTerm dir=%:p:h<CR>', desc = 'Toggle Terminal' },
  },
}

-- event = 'InsertEnter'
require('nvim-autopairs').setup {}

-- event = 'VeryLazy',
require('im-switch').setup {
  -- windows = {
  --   enabled = true, -- Set to true if you are on Windows/WSL2
  -- },
  -- macos = {
  --   enabled = true, -- Set to true if you are on macOS
  --   default_im = "com.apple.keylayout.ABC", -- or your preferred input method
  -- },
  linux = {
    enabled = true, -- Set to true if you are on Linux
    default_im = 'keyboard-us', -- or your preferred input method
    get_im_command = { 'fcitx5-remote', '-n' }, -- { "ibus", "engine" }
    set_im_command = { 'fcitx5-remote', '-s' }, -- { "ibus", "engine" }
  },
}

-- event = 'VimEnter',
-- Highlight todo, notes, etc in comments
require('todo-comments').setup {
  signs = false,
}

require('hardtime').setup {
  lazy = false,
  disabled_filetypes = {
    lazy = false, -- Enable Hardtime in lazy filetype
    ['dapui*'] = false, -- Enable Hardtime in filetype starting with dapui
  },
}

require('outline').setup {
  lazy = true,
  vim.keymap.set('n', '<leader>o', '<cmd>Outline<cr>', { desc = 'Outline' }),
}

vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<cr>', { desc = 'toggle Undo Tree' })

vim.keymap.set('n', '<c-h>', '<cmd>:TmuxNavigateLeft<cr>', { desc = 'Move Left' })
vim.keymap.set('n', '<c-j>', '<cmd>:TmuxNavigateDown<cr>', { desc = 'Move Down' })
vim.keymap.set('n', '<c-k>', '<cmd>:TmuxNavigateUp<cr>', { desc = 'Move Up' })
vim.keymap.set('n', '<c-l>', '<cmd>:TmuxNavigateRight<cr>', { desc = 'Move Right' })
vim.keymap.set('n', '<c-\\>', '<cmd>:TmuxNavigatePrevious<cr>', { desc = 'Go to Previous' })

-- Iterate over all Lua files in the plugins directory and load them
local plugins_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'plugins')
for file_name, type in vim.fs.dir(plugins_dir, { follow = true }) do
  if (type == 'file' or type == 'link') and file_name:match '%.lua$' and file_name ~= 'init.lua' then
    local module = file_name:gsub('%.lua$', '')
    require('plugins.' .. module)
  end
end
