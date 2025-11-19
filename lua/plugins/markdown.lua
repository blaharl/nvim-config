return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		keys = {
			{ "<leader>mp", "<cmd>MarkdownPreview<cr>", desc = "start md preview" },
			{ "<leader>ms", "<cmd>MarkdownPreviewStop<cr>", desc = "stop md preview" },
			{ "<leader>mt", "<cmd>MarkdownPreviewToggle<cr>", desc = "toggle md preview" },
		},
		build = function(plugin)
			if vim.fn.executable("npx") then
				vim.cmd("!cd " .. plugin.dir .. " && cd app && npx --yes yarn install")
			else
				vim.cmd([[Lazy load markdown-preview.nvim]])
				vim.fn["mkdp#util#install"]()
			end
		end,
		init = function()
			if vim.fn.executable("npx") then
				vim.g.mkdp_filetypes = { "markdown" }
			end
		end,
	},
	{
		"ellisonleao/glow.nvim",
		config = true,
		cmd = "Glow",
		keys = {
			{ "<leader>mg", "<cmd>Glow<cr>", desc = "glow!" },
		},
	},
}
