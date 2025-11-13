local options = {
	ensure_installed = {
		"stylua",
		"prettier",
		"isort",
		"black",
		"clang-format",
	},

	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		svelte = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		graphql = { "prettier" },
		-- python = { "isort", "black" },
		c = { "clang-format" },
		cpp = { "clang-format" },
	},

	formatters = {
		-- ["clang-format"] = {
		-- 	-- IndentWidth: 4, \
		-- 	-- TabWidth: 4, \
		-- 	prepend_args = {
		-- 		"-style={ \
		--       UseTab: Never, \
		--       AccessModifierOffset: 0, \
		--       IndentAccessModifiers: true, \
		--       PackConstructorInitializers: Never}",
		-- 	},
		-- },
	},

	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		-- async = false,
		lsp_fallback = true,
	},
}

require("conform").setup(options)

require("mason-conform").setup({
	-- List of formatters to ignore during install
	ignore_install = {},
})
