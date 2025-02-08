return {
	{
		"mrcjkb/rustaceanvim",
		-- Recommended
		version = "^5",
		-- This plugin is already lazy
		lazy = false,
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
			},
		},
	},
}
