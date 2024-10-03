---@type ChadrcConfig
require("nvchad.mappings")

local map = vim.keymap.set

map("i", "jj", "<ESC>", { desc = "General Exit insert mode" })
map({ "i" }, "<C-s>", "<ESC><cmd> w <cr>", { desc = "General Save and Exit insert mode" })
map("n", ";", ":", { desc = "General Enter command mode" })

-- https://github.com/NvChad/ui/blob/6f71760950c89c0484b58520211cc530516849fc/doc/nvui.txt#L269
map("n", "<leader>o", function()
	require("nvchad.tabufline").closeAllBufs(false)
end, { desc = "General Close other buffers" })
