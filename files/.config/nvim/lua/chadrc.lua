-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
	statusline = {
		separator_style = "arrow",
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
