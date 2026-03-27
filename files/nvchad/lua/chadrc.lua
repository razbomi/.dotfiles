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
	hl_override = {
		Comment = { italic = true, fg = "#a6adc8" },
		["@comment"] = { italic = true, fg = "#a6adc8" },
		["@comment.documentation"] = { italic = true, fg = "#b5c1d8" },
	},
}
return M
