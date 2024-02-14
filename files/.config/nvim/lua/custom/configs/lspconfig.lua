local configs = require("plugins.configs.lspconfig")
local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")
local servers = { "bashls", "gopls", "terraformls", "tsserver" }

for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

lspconfig.yamlls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		redhat = { telemetry = { enabled = false } },
		yaml = {
			completion = true,
			hover = true,
			schemaStore = {
				enable = true,
				url = "https://www.schemastore.org/api/json/catalog.json",
			},
			-- schemas = {
			-- kubernetes = "*.yaml",
			-- ["http://json.schemastore.org/kustomization"] = "environments/{dev,prod}*/*.{yml,yaml}",
			-- ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
			-- },
			trace = { server = "debug" },
			-- Kubernetes clash
			validate = false,
		},
	},
})

-- Without the loop, you would have to manually set up each LSP
--
-- lspconfig.html.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
--
-- lspconfig.cssls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
