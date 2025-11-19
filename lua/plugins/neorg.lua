return {
	{
		"nvim-neorg/neorg",
		-- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
		lazy = false,
		-- Pin Neorg to the latest stable release
		version = "*",
		ft = "norg",
		build = ":Neorg sync-parsers",
		-- config = true,
		dependencies = {
			"nvim-neorg/lua-utils.nvim",
			"pysan3/pathlib.nvim",
			"nvim-neotest/nvim-nio",
		},
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
							-- default_workspace = "neorg",
							-- The name of the main (root) .norg file
							index = "index.norg",
						},
					},
					["core.completion"] = {
						config = {
							engine = "nvim-cmp",
						},
					},
					["core.text-objects"] = {
						keys = {},
					},
					["core.summary"] = {},
					["core.export"] = {
						config = {
							-- export_dir = "<export-dir>/<language>-export",
						},
					},
					["core.export.markdown"] = {
						config = {
							extension = "md",
							extensions = "all",
						},
					},
				},
				["external.interim-ls"] = {
					config = {
						-- default config shown
						completion_provider = {
							-- Enable or disable the completion provider
							enable = true,

							-- Show file contents as documentation when you complete a file name
							documentation = true,

							-- Try to complete categories provided by Neorg Query. Requires `benlubas/neorg-query`
							categories = false,

							-- suggest heading completions from the given file for `{@x|}` where `|` is your cursor
							-- and `x` is an alphanumeric character. `{@name}` expands to `[name]{:$/people:# name}`
							people = {
								enable = false,

								-- path to the file you're like to use with the `{@x` syntax, relative to the
								-- workspace root, without the `.norg` at the end.
								-- ie. `folder/people` results in searching `$/folder/people.norg` for headings.
								-- Note that this will change with your workspace, so it fails silently if the file
								-- doesn't exist
								path = "people",
							},
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
