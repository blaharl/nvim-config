local nvlsp = require("nvchad.configs.lspconfig")

-- loads nvchad's defaults
nvlsp.defaults()

Servers = {
	"basedpyright",
	"clangd",
	"lua_ls",
	"nil_ls",
	"ruff",
}

vim.lsp.config.ensure_installed = Servers

for _, s in ipairs(Servers) do
	vim.lsp.enable(s)
end
