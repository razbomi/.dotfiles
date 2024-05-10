local plugins = {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		cmd = { "ConformInfo" },
		config = function()
			require("configs.conform")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"lua-language-server",
				"stylua",

				"gopls",
				"goimports",

				"bash-language-server",
				"shfmt",
				"shellcheck",

				"terraform-ls",
				"yaml-language-server",

				"typescript-language-server",
				"prettier",
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"bash",

				"go",
				"gomod",
				"gosum",
				"gowork",

				"hcl",
				"terraform",

				"json",
				"yaml",

				"javascript",
				"typescript",
			},
		},
	},
	{
		"alexghergh/nvim-tmux-navigation",
		event = "VeryLazy",
		config = function()
			require("configs.nvim-tmux-navigation")
		end,
	},
}

return plugins
