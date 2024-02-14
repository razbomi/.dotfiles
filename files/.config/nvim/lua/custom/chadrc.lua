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
M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")

return M
