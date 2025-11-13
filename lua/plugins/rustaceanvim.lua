return {
	{
		"mrcjkb/rustaceanvim",
		-- Recommended
		version = "^6",
		-- This plugin is already lazy
		lazy = false,
		vim.keymap.set("n", "<leader>ca", function()
			vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
			-- or vim.lsp.buf.codeAction() if you don't want grouping.
		end, { desc = "LSP Code Action" }),
		vim.keymap.set("n", "<leader>ra", vim.lsp.buf.rename, { desc = "LSP Renamer" }),
		vim.keymap.set("n", "K", function()
			vim.cmd.RustLsp("hover", "actions")
		end, { desc = "LSP Hover Actions" }),
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
