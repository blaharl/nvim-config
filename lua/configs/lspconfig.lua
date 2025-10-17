local nvlsp = require("nvchad.configs.lspconfig")

-- loads nvchad's defaults
nvlsp.defaults()

Servers = {
	"basedpyright",
	"clangd",
	"lua_ls",
	"nil_ls",
	"ruff",
	"rust_analyzer",
}

vim.lsp.config.ensure_installed = Servers
