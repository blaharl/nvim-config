local nvlsp = require("nvchad.configs.lspconfig")
local lspconfig = require("lspconfig")

local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

nvlsp.defaults() -- loads nvchad's defaults

lspconfig.servers = {
	"clangd",
	"lua_ls",
	"nil_ls",
	"rust_analyzer",
}

local default_servers = {
	-- "rust_analyzer",
}

for _, lsp in ipairs(lspconfig.servers) do
	lspconfig[lsp].setup({
		on_attach = function(client, bufnr)
			client.server_capabilities.documentFormattingProvider = false
			client.server_capabilities.documentRangeFormattingProvider = false
			on_attach(client, bufnr)
		end,
		on_init = nvlsp.on_init,
		capabilities = nvlsp.capabilities,
		settings = {
			diagnostics = {
				underline = true,
				update_in_insert = false,
				virtual_text = false,
				severity_sort = true,
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = "if_many",
					header = "",
					prefix = "",
				},
			},
			codelens = {
				enabled = false,
			},
			document_highlight = {
				enabled = true,
			},
			capabilities = {
				workspace = {
					fileOperations = {
						didRename = true,
						willRename = true,
					},
				},
			},
			-- format = {
			-- 	formatting_options = nil,
			-- 	timeout_ms = nil,
			-- },
		},
	})
end


lspconfig.lua_ls.setup({
	on_attach = on_attach,
	on_init = on_init,
	capabilities = capabilities,

	settings = {
		Lua = {
			hint = {
				enable = true,
				setType = false,
				paramType = true,
				paramName = true,
				semicolon = "Disable",
				arrayIndex = "Disable",
			},
			diagnostics = {
				enable = false, -- Disable all diagnostics from lua_ls
				-- globals = { "vim" },
			},
			telemetry = {
				enable = false,
			},
			workspace = {
				library = {
					vim.fn.expand("$VIMRUNTIME/lua"),
					vim.fn.expand("$VIMRUNTIME/lua/vim/lsp"),
					vim.fn.stdpath("data") .. "/lazy/ui/nvchad_types",
					vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy",
					"${3rd}/love2d/library",
				},
				maxPreload = 100000,
				preloadFileSize = 10000,
			},
		},
	},
})

	on_init = on_init,
	capabilities = capabilities,

	settings = {},
})
