local options = {
	formatters_by_ft = {
		go = { "goimports", "gofmt" },
		hcl = { "terragrunt_hclfmt" },
		javascript = { "prettier" },
		javascriptreact = { "prettier" },
		lua = { "stylua" },
		tf = { "terraform_fmt" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
	},

	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},

	format_after_save = {
		lsp_fallback = true,
	},

	log_level = vim.log.levels.INFO,
	notify_on_error = true,
}

require("conform").setup(options)
