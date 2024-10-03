---@type ChadrcConfig
require("nvchad.mappings")

local map = vim.keymap.set

map("i", "jj", "<ESC>", { desc = "General Exit insert mode" })
map({ "i" }, "<C-s>", "<ESC><cmd> w <cr>", { desc = "General Save and Exit insert mode" })
map("n", ";", ":", { desc = "General Enter command mode" })
map("n", "<leader>o", function()
	-- https://github.com/NvChad/ui/blob/6f71760950c89c0484b58520211cc530516849fc/doc/nvui.txt#L269
	require("nvchad.tabufline").closeAllBufs(false) -- excludes current buf
end, { desc = "General Close other buffers" })
