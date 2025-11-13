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

for _, s in ipairs(Servers) do
	vim.lsp.enable(s)
end

vim.lsp.config("rust_analyzer", { on_init = false })
-- vim.lsp.config("rust_analyzer", {
-- 	root_dir = "Cargo.toml",
-- 	settings = {
-- 		["rust-analyzer"] = {
-- 			cargo = {
-- 				allFeatures = true,
-- 			},
-- 		},
-- 	},
-- })

-- List of servers to ignore during install
local ignore_install = {}

-- Helper function to find if value is in table.
local function table_contains(table, value)
	for _, v in ipairs(table) do
		if v == value then
			return true
		end
	end
	return false
end

-- Build a list of lsp servers to install minus the ignored list.
local all_servers = {
	"rust_analyzer",
}

for _, s in ipairs(Servers) do
	if not table_contains(ignore_install, s) then
		table.insert(all_servers, s)
	end
end

require("mason-lspconfig").setup({
	ensure_installed = all_servers,
	automatic_installation = false,
})
