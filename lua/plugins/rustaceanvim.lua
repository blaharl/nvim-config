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
					on_attach = function()
						vim.keymap.set("n", "<leader>ca", function()
							vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
							-- or vim.lsp.buf.codeAction() if you don't want grouping.
						end, { desc = "LSP Code Action" })
						vim.keymap.set("n", "K", function()
							vim.cmd.RustLsp("hover", "actions")
						end, { desc = "LSP Hover Actions" })
					end,
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
