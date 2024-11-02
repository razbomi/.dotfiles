local configs = require("nvchad.configs.lspconfig")

local lspconfig = require("lspconfig")
local servers = {
	bashls = {},
	gopls = {},
	jsonnet_ls = {},
	pyright = {},
	terraformls = {},
	ts_ls = {},
}

for name, opts in pairs(servers) do
	opts.on_init = configs.on_init
	opts.on_attach = configs.on_attach
	opts.capabilities = configs.capabilities

	require("lspconfig")[name].setup(opts)
end

local yamlconfig = require("yaml-companion").setup({
	builtin_matchers = {
		kubernetes = { enabled = true },
	},

	schemas = {
		-- not loaded automatically, manually select with
		-- :Telescope yaml_schema
		{
			name = "ArgoCD Application",
			uri = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json",
		},
	},

	lspconfig = {
		redhat = { telemetry = { enabled = false } },

		flags = {
			debounce_text_changes = 150,
		},

		yaml = {
			completion = true,
			hover = true,
			validate = true,
			format = { enable = false },

			schemaStore = {
				enable = false,
				url = "",
			},

			schemas = require("schemastore").yaml.schemas({
				-- https://github.com/b0o/SchemaStore.nvim/blob/main/lua/schemastore/catalog.lua
				select = {
					"AWS CloudFormation",
					"Buildkite",
					"docker-compose.yml",
					"GitHub Action",
					"GitHub Workflow",
					"kustomization.yaml",
				},
				extra = {
					{
						fileMatch = "*-app.yaml",
						name = "ArgoCD Application",
						url = "https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/argoproj.io/application_v1alpha1.json",
					},
				},
			}),
		},
	},
})

lspconfig.yamlls.setup(yamlconfig)
