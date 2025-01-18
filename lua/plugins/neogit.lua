return {
	{
		"NeogitOrg/neogit",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
			"echasnovski/mini.pick", -- optional
		},
		cmd = "Neogit",
		keys = {
			{ "<leader>gn", "<cmd>Neogit<cr>", desc = "NeoGit" },
		},
		opts = {
			kind = "split",
			signs = {
				-- {CLOSED, OPENED}
				section = { "", "" },
				item = { "", "" },
				hunk = { "", "" },
			},
			integrations = { diffview = true },
		},
	},
}
