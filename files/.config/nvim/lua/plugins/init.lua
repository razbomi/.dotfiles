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
		"sindrets/diffview.nvim",
		cmd = { "DiffviewOpen", "DiffviewFileHistory" },
		keys = {
			{ "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "Git Diff View" },
			{ "<leader>gh", "<cmd>DiffviewFileHistory %<cr>", desc = "Git File History" },
			{ "<leader>gq", "<cmd>DiffviewClose<cr>", desc = "Git Close Diff View" },
		},
		opts = {
			view = {
				default = { layout = "diff2_horizontal" },
			},
		},
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
			{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics" },
			{ "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics" },
			{ "<leader>xl", "<cmd>Trouble lsp toggle focus=false<cr>", desc = "LSP References" },
			{ "<leader>xt", "<cmd>Trouble todo toggle<cr>", desc = "Todos" },
			{ "<leader>xq", "<cmd>Trouble quickfix toggle<cr>", desc = "Quickfix" },
			{ "<leader>xL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List" },
			{ "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols Outline" },
			{
				"[q",
				function()
					if require("trouble").is_open() then
						require("trouble").prev({ skip_groups = true, jump = true })
					else
						local ok, err = pcall(vim.cmd.cprev)
						if not ok then vim.notify(err, vim.log.levels.ERROR) end
					end
				end,
				desc = "Previous Trouble/Quickfix Item",
			},
			{
				"]q",
				function()
					if require("trouble").is_open() then
						require("trouble").next({ skip_groups = true, jump = true })
					else
						local ok, err = pcall(vim.cmd.cnext)
						if not ok then vim.notify(err, vim.log.levels.ERROR) end
					end
				end,
				desc = "Next Trouble/Quickfix Item",
			},
		},
		config = function()
			dofile(vim.g.base46_cache .. "trouble")
			require("trouble").setup()
		end,
	},
	{
		"echasnovski/mini.surround",
		event = "VeryLazy",
		opts = {},
	},
	{
		"echasnovski/mini.ai",
		event = "VeryLazy",
		opts = {
			n_lines = 500,
		},
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
