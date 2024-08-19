---@type ChadrcConfig
require("nvchad.mappings")

local map = vim.keymap.set

map("i", "jj", "<ESC>", { desc = "General Exit insert mode" })
map({ "i" }, "<C-s>", "<cmd> w <cr><ESC>", { desc = "General Save and Exit insert mode" })
map("n", ";", ":", { desc = "General Enter command mode" })
map("n", "<leader>o", function()
	local tabufline = require("nvchad.tabufline")
	tabufline.closeOtherBufs()
end, { desc = "General Close other buffers" })

-- https://github.com/rmagatti/auto-session
map("n", "Q", "<cmd> SessionSave <cr> <cmd> qa <cr>", { desc = "File Save session and close" })
map("n", "S", "<cmd> SessionRestore <cr>", { desc = "File Restore previous session" })
