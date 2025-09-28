---@type ChadrcConfig
require("nvchad.mappings")

local map = vim.keymap.set
local all = { "n", "i", "v" }

map("i", "jj", "<ESC>", { desc = "General Exit insert mode" })
-- map(all, "<C-s>", "<ESC><cmd> w <cr>", { desc = "General Save and Exit insert mode" })
map(all, "<C-s>", "<ESC><cmd>w<cr>", { desc = "General Save and Exit insert mode" })
map("n", ";", ":", { desc = "General Enter command mode" })

-- https://github.com/NvChad/ui/blob/6f71760950c89c0484b58520211cc530516849fc/doc/nvui.txt#L269
map("n", "<leader>o", function()
	require("nvchad.tabufline").closeAllBufs(false)
end, { desc = "General Close other buffers" })

-- git
local gitsigns = require("gitsigns")
map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "Git Preview Hunk" })
map("n", "<leader>hi", gitsigns.preview_hunk_inline, { desc = "Git Preview Hunk Inline" })
map("n", "<leader>hb", function()
	gitsigns.blame({ full = true })
end, { desc = "Git Blame" })
map("n", "<leader>hd", gitsigns.diffthis, { desc = "Git Diff" })
map("n", "<leader>hq", function()
	gitsigns.setqflist("all")
end, { desc = "Git All in Qwick Fix List" })
map("n", "]c", function()
	if vim.wo.diff then
		vim.cmd.normal({ "]c", bang = true })
	else
		gitsigns.nav_hunk("next")
	end
end, { desc = "Git Navigate to Next Hunk" })
map("n", "[c", function()
	if vim.wo.diff then
		vim.cmd.normal({ "[c", bang = true })
	else
		gitsigns.nav_hunk("prev")
	end
end, { desc = "Git Naviate to Previous Hunk" })

-- remove terminal shortcuts
vim.keymap.del("n", "<leader>h")
vim.keymap.del("n", "<leader>v")
