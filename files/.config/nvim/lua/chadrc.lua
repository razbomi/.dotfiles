-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
---@type ChadrcConfig
local M = {}

M.ui = {
	statusline = {
		separator_style = "arrow",
	},
	telescope = {
		style = "bordered",
	},
}

M.base46 = {
	integrations = {
		"trouble",
	},
	theme = "catppuccin",
}

return M
