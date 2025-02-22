local options = {
	formatters = {
		shfmt = {
			prepend_args = { "-i", "2", "-ci", "-bn", "-sr" },
		},
	},

	formatters_by_ft = {
		go = { "goimports", "gofmt" },
		hcl = { "terragrunt_hclfmt" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		javascriptreact = { "prettierd", "prettier", stop_after_first = true },
		json = { "prettierd", "prettier", stop_after_first = true },
		lua = { "stylua" },
		python = { "isort", "black" },
		sh = { "shfmt" },
		tf = { "terraform_fmt" },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		typescriptreact = { "prettierd", "prettier", stop_after_first = true },
		yaml = { "prettierd", "prettier", stop_after_first = true },
	},

	format_on_save = {
		timeout_ms = 5000,
		lsp_fallback = true,
	},

	log_level = vim.log.levels.INFO,
	notify_on_error = true,
}

return options
