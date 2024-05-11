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

				"markdown",
				"markdown_inline",
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
	{ "b0o/schemastore.nvim" },
	{ "someone-stole-my-name/yaml-companion.nvim" },
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		branch = "dev",
		keys = {
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false<cr>",
				-- "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "trouble toggle lsp",
			},
			{
				"<leader>cx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "trouble toggle diagnostics",
			},
		},
		config = function()
			dofile(vim.g.base46_cache .. "trouble")
			require("trouble").setup()
		end,
	},
}

return plugins
