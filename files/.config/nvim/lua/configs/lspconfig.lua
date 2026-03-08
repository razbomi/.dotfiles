require("nvchad.configs.lspconfig").defaults()

local servers = {
	"bashls",
	"gopls",
	"jsonls",
	"jsonnet_ls",
	"pyright",
	"terraformls",
	"ts_ls",
	"yamlls",
}
vim.lsp.enable(servers)

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "json", "jsonc" },
	once = true,
	callback = function()
		vim.lsp.config("jsonls", {
			settings = {
				json = {
					schemas = require("schemastore").json.schemas(),
					validate = { enable = true },
					format = { enable = false },
				},
			},
		})
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "yaml", "yaml.docker-compose" },
	once = true,
	callback = function()
		vim.lsp.config("yamlls", {
			settings = {
				redhat = { telemetry = { enabled = false } },
				yaml = {
					validate = true,
					completion = true,
					hover = true,
					format = { enable = false },
					schemaStore = { enable = false, url = "" },
					schemas = require("schemastore").yaml.schemas(),
				},
			},
			on_attach = function(client, bufnr)
				client.server_capabilities.documentFormattingProvider = false
			end,
		})
	end,
})
