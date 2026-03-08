require("nvchad.mappings")

local map = vim.keymap.set
local all = { "n", "i", "v" }

map("i", "jj", "<ESC>", { desc = "General Exit insert mode" })
map(all, "<C-s>", "<ESC><cmd>w<cr>", { desc = "General Save and Exit insert mode" })

-- https://github.com/NvChad/ui/blob/6f71760950c89c0484b58520211cc530516849fc/doc/nvui.txt#L269
map("n", "<leader>o", function()
	require("nvchad.tabufline").closeAllBufs(false)
end, { desc = "General Close other buffers" })

-- git
local gitsigns = require("gitsigns")
map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Git Preview Hunk" })
map("n", "<leader>gb", function()
	gitsigns.blame({ full = true })
end, { desc = "Git Blame" })
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
end, { desc = "Git Navigate to Previous Hunk" })

