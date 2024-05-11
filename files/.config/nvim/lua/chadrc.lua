-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
	statusline = {
		separator_style = "arrow",
		order = {
			"mode",
			"file",
			"git",
			"%=",
			"lsp_msg",
			"%=",
			"diagnostics",
			"lsp",
			"yaml",
			"cwd",
			"cursor",
		},

		-- Adds yaml schema type, to help with debugging yamlls
		modules = {
			yaml = function()
				if rawget(vim, "lsp") then
					for _, client in ipairs(vim.lsp.get_active_clients()) do
						if
							client.attached_buffers[vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)]
							and client.name == "yamlls"
						then
							local schema = require("yaml-companion").get_buf_schema(0)
							return "(" .. schema.result[1].name .. ") "
						end
					end
				end
				-- local schema = require("yaml-companion").get_buf_schema(0)
				-- if schema.result[1].name ~= "none" then
				--   return "(" .. schema.result[1].name .. ") "
				-- end
				return ""
			end,
		},
	},

	telescope = {
		style = "bordered",
	},

	theme = "catppuccin",
}

M.base46 = {
	integrations = {
		"trouble",
	},
}

return M
