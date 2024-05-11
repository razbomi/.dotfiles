local options = {
	formatters_by_ft = {
		go = { "goimports", "gofmt" },
		hcl = { "terragrunt_hclfmt" },
		javascript = { { "prettierd", "prettier" } },
		javascriptreact = { { "prettierd", "prettier" } },
		lua = { "stylua" },
		tf = { "terraform_fmt" },
		typescript = { { "prettierd", "prettier" } },
		typescriptreact = { { "prettierd", "prettier" } },
	},

	format_on_save = {
		timeout_ms = 5000,
		lsp_fallback = true,
	},

	log_level = vim.log.levels.INFO,
	notify_on_error = true,
}

require("conform").setup(options)
