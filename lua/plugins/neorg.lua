return {
	{
		"nvim-tree/nvim-web-devicons",
		opts = {
			override_by_extension = {
				["norg"] = {
					icon = "",
					color = "#29B6F6",
					name = "neorg",
				},
			},
		},
	},
	{
		"3rd/image.nvim",
		-- so that it doesn't build the rock
		-- https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
		build = false,
		opts = {
			processor = "magick_cli",
		},
	},
	{
		"nvim-neorg/neorg",
		-- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
		lazy = false,
		-- Pin Neorg to the latest stable release
		version = "*",
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
						keys = {
							-- { "<leader>gn", "<cmd>Neogit<cr>", desc = "NeoGit" },
						},
					},
					["core.latex.renderer"] = {
						config = {
							conceal = true,
							render_on_enter = true,
						},
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
					["core.integrations.nvim-cmp"] = {
						config = {
							sources = {
								{ name = "neorg" },
							},
						},
					},
				},
			})
			require("configs.neorg")
			vim.wo.conceallevel = 2
			vim.wo.concealcursor = "nc"
			-- vim.g.maplocalleader = ","
		end,
	},
}
