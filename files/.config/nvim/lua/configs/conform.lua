local options = {
	formatters = {
		shfmt = {
			prepend_args = { "-i", "2", "-ci", "-bn", "-sr" },
		},
	},

	formatters_by_ft = {
		go = { "goimports", "gofmt" },
		hcl = { "terragrunt_hclfmt" },
		javascript = { "oxfmt" },
		javascriptreact = { "oxfmt" },
		json = { "prettierd", "prettier", stop_after_first = true },
		lua = { "stylua" },
		python = { "ruff_organize_imports", "ruff_format" },
		sh = { "shfmt" },
		terraform = { "terraform_fmt" },
		["terraform-vars"] = { "terraform_fmt" },
		typescript = { "oxfmt" },
		typescriptreact = { "oxfmt" },
		yaml = { "prettierd", "prettier", stop_after_first = true },
	},

	format_on_save = {
		timeout_ms = 2000,
		lsp_format = "fallback",
	},

	log_level = vim.log.levels.INFO,
	notify_on_error = true,
}

return options
