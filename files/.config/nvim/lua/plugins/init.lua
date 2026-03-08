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
				"bash",
				"go",
				"gomod",
				"gosum",
				"gowork",
				"hcl",
				"javascript",
				"json",
				"jsonnet",
				"markdown",
				"markdown_inline",
				"python",
				"terraform",
				"typescript",
				"yaml",
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			current_line_blame = true,
			preview_config = {
				border = "rounded",
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
	{
		"mfussenegger/nvim-lint",
		event = { "BufWritePost", "BufReadPost" },
		config = function()
			require("configs.lint")
		end,
	},
	{ "b0o/schemastore.nvim", lazy = true },
	{
		"cwrau/yaml-schema-detect.nvim",
		dependencies = { "b0o/schemastore.nvim" },
		ft = { "yaml" },
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			modes = {
				char = { jump_labels = true },
				search = { enabled = true },
			},
		},
		config = function(_, opts)
			require("flash").setup(opts)
			vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#1e1e2e", bg = "#f38ba8", bold = true })
			vim.api.nvim_set_hl(0, "FlashMatch", { fg = "#cdd6f4", bg = "#45475a" })
		end,
		keys = {
			{ "s", function() require("flash").jump() end, mode = { "n", "x", "o" }, desc = "Flash" },
			{ "S", function() require("flash").treesitter() end, mode = { "n", "x", "o" }, desc = "Flash Treesitter" },
			{ "<c-s>", function() require("flash").toggle() end, mode = { "c" }, desc = "Toggle Flash Search" },
		},
	},
	{
		"folke/trouble.nvim",
		cmd = "Trouble",
		keys = {
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false<cr>",
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
