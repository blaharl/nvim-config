---@param repo string
---@return string
local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  -- You can also specify a branch or a specific commit
  { src = gh 'ThePrimeagen/harpoon', version = 'harpoon2' },
  gh 'nvim-lua/plenary.nvim', -- harpoon
}

local harpoon = require 'harpoon'

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set('n', '<leader>a', function() harpoon:list():add() end)
vim.keymap.set('n', '<C-e>', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set('n', '<A-q>', function() harpoon:list():select(1) end)
vim.keymap.set('n', '<A-w>', function() harpoon:list():select(2) end)
vim.keymap.set('n', '<A-e>', function() harpoon:list():select(3) end)
vim.keymap.set('n', '<A-r>', function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set('n', '<A-a>', function() harpoon:list():prev() end)
vim.keymap.set('n', '<A-s>', function() harpoon:list():next() end)

vim.keymap.set('n', '<leader>x', '<Cmd>bdelete!<CR>', { desc = 'delete buffer' })
vim.keymap.set('n', '<A-d>', '<Cmd>bNext!<CR>', { desc = 'prev buffer' })
vim.keymap.set('n', '<A-f>', '<Cmd>bnext!<CR>', { desc = 'next buffer' })

-- -- basic telescope configuration
-- local conf = require("telescope.config").values
-- local function toggle_telescope(harpoon_files)
--     local file_paths = {}
--     for _, item in ipairs(harpoon_files.items) do
--         table.insert(file_paths, item.value)
--     end
--
--     require("telescope.pickers").new({}, {
--         prompt_title = "Harpoon",
--         finder = require("telescope.finders").new_table({
--             results = file_paths,
--         }),
--         previewer = conf.file_previewer({}),
--         sorter = conf.generic_sorter({}),
--     }):find()
-- end
--
-- vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
--     { desc = "Open harpoon window" })
