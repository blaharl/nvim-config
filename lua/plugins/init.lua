return {

	"nvim-lua/plenary.nvim",

	{
		"nvchad/ui",
		config = function()
			require("nvchad")
		end,
	},

	{
		"nvchad/base46",
		lazy = true,
		build = function()
			require("base46").load_all_highlights()
		end,
	},

	{
		"nvim-tree/nvim-web-devicons",
		opts = {
			override_by_extension = {
				["norg"] = {
					icon = "",
					color = "#29B6F6",
					name = "Log",
				},
			},
		},
	},

	"nvzone/volt", -- optional, needed for theme switcher
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("configs.treesitter")
		end,
	},

	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},

	{
		"williamboman/mason-lspconfig.nvim",
		event = "VeryLazy",
		dependencies = { "nvim-lspconfig" },
		config = function()
			require("configs.mason-lspconfig")
		end,
	},

	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("configs.lint")
		end,
	},

	{
		"rshkarin/mason-nvim-lint",
		event = "VeryLazy",
		dependencies = { "nvim-lint" },
		config = function()
			require("configs.mason-lint")
		end,
	},

	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		config = function()
			require("configs.conform")
		end,
	},

	{
		"zapling/mason-conform.nvim",
		event = "VeryLazy",
		dependencies = { "conform.nvim" },
		config = function()
			require("configs.mason-conform")
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			git = { enable = true },
			view = {
				relativenumber = true,
				number = true,
			},
		},
	},

	{
		"mfussenegger/nvim-dap",
		-- NOTE: And you can specify dependencies as well
		dependencies = {
			-- Creates a beautiful debugger UI
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",

			-- Installs the debug adapters for you
			"williamboman/mason.nvim",
			"jay-babu/mason-nvim-dap.nvim",

			-- Add your own debuggers here
			"leoluz/nvim-dap-go",
		},
		event = "VeryLazy",
		config = function()
			require("configs.debug")
		end,
	},

}
