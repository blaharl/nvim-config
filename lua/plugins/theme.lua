return {
	-- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("catppuccin-mocha") --" catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
	end,
}
