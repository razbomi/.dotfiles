---@type ChadrcConfig

local M = {}

M.general = {
	n = {
		["<leader>i"] = { "^", "Go-to start of line" },
		["<leader>a"] = { "$", "Go-to end of line" },
		["<leader>r"] = { ":!%:p", "Run current buffer as a command" },
		["<leader>s"] = { ":update<CR>", "Save" },
		["<leader>o"] = {
			function()
				local tabufline = require("nvchad.tabufline")
				tabufline.closeOtherBufs()
			end,
			"Close other buffers",
		},
		["Q"] = { ":qa<CR>", "Quick close close all" },
	},
	i = {
		["jj"] = { "<ESC>", "Quick escape insert mode", opts = { nowait = true } },
	},
}

return M
