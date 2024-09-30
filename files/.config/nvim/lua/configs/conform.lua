local options = {
	formatters_by_ft = {
		go = { "goimports", "gofmt" },
		hcl = { "terragrunt_hclfmt" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "prettierd", "prettier", stop_after_first = true },
		lua = { "stylua" },
		tf = { "terraform_fmt" },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true },
	},

	format_on_save = {
		timeout_ms = 5000,
		lsp_fallback = true,
	},

	log_level = vim.log.levels.INFO,
	notify_on_error = true,
}

return options
