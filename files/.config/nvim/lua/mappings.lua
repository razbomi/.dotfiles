---@type ChadrcConfig
require("nvchad.mappings")

local map = vim.keymap.set

map("i", "jj", "<ESC>", { desc = "General Exit insert mode" })
map({ "i" }, "<C-s>", "<ESC><cmd> w <cr>", { desc = "General Save and Exit insert mode" })
map("n", ";", ":", { desc = "General Enter command mode" })
map("n", "<leader>o", function()
	local tabufline = require("nvchad.tabufline")
	tabufline.closeOtherBufs()
end, { desc = "General Close other buffers" })
