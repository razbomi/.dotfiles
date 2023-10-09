---@type ChadrcConfig

local M = {}

M.general = {
	n = {
		["<leader>s"] = { ":update<CR>", "save" },
		["<leader>i"] = { "^", "start of line" },
		["<leader>a"] = { "$", "end of line" },
		["Q"] = { ":qa<CR>", "quick close" },
	},
	i = {
		["jj"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
	},
}

return M
