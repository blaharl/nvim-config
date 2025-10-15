return {
	{
		"mrcjkb/rustaceanvim",
		-- Recommended
		version = "^6",
		-- This plugin is already lazy
		lazy = false,
		init = function()
			vim.g.rustaceanvim = {
				server = {
					settings = {
						["rust-analyzer"] = {
							cargo = {
								allFeatures = true,
							},
						},
					},
				},
			}
		end,
	},
}
