local plugins = {
	{
		"neovim/nvim-lspconfig",

		dependencies = {
			"nvimtools/none-ls.nvim",
			config = function()
				require("custom.configs.null-ls")
			end,
		},

		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
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
		"alexghergh/nvim-tmux-navigation",
		event = "VeryLazy",
		config = function()
			require("custom.configs.nvim-tmux-navigation")
		end,
	},
}

return plugins
