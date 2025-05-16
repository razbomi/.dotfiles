local plugins = {
	{
		"NvChad/nvterm",
		enabled = false,
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = require("configs.conform"),
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("nvchad.configs.lspconfig").defaults()
			require("configs.lspconfig")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"jsonnet",
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
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame = true,
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
			require("trouble").setup({ use_diagnostic_signs = true })
		end,
	},
	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		config = function()
			require("todo-comments").setup({
				highlight = {
					before = "",
					keyword = "fg",
					after = "",
					pattern = [[.*<(KEYWORDS)\s*:]],
					comments_only = true,
				},
			})
		end,
	},
}

return plugins
