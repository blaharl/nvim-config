-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	lazy = false,

	keys = {
		{ "c-n", "<cmd>:Neotree toggle<CR>", desc = "NeoTree toggle" },
	},
	opts = {
		filesystem = {
			window = {
				mappings = {
					["c-n"] = "close_window",
				},
			},
		},
		event_handlers = {
			{
				event = "neo_tree_buffer_enter",
				handler = function(arg)
					vim.o.relativenumber = true
					vim.o.number = true
				end,
			},
		},
	},
	vim.keymap.set("n", "<c-n>", "<cmd>:Neotree toggle<cr>"),
}
