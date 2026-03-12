local lint = require("lint")

lint.linters_by_ft = {
	javascript = { "oxlint" },
	javascriptreact = { "oxlint" },
	python = { "ruff" },
	typescript = { "oxlint" },
	typescriptreact = { "oxlint" },
}

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
	callback = function()
		lint.try_lint()
	end,
})
