return {
	{
		"nvim-neorg/neorg",
		lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
		version = "*", -- Pin Neorg to the latest stable release
		ft = "norg",
		build = ":Neorg sync-parsers",
		-- config = true,
		config = function()
			require("neorg").setup({
				-- opts = {
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {
						-- config = { -- We added a `config` table!
						-- 	icon_preset = "varied", -- And we set our option here.
						-- },
					},
					["core.dirman"] = {
						config = {
							workspaces = {
								-- Format: <name_of_workspace> = <path_to_workspace_root>
								neorg = "~/Persistent/Documents/Projects/neorg",
								blog = "~/Persistent/Documents/vault/blog/content/posts",
							},
							index = "index.norg", -- The name of the main (root) .norg file
						},
					},
				},
			})
			vim.wo.conceallevel = 2
			vim.wo.concealcursor = "nc"
			-- vim.g.maplocalleader = ","
		end,
	},
}
