require("nvchad.mappings")

local map = vim.keymap.set
local all = { "n", "i", "v" }

map("i", "jj", "<ESC>", { desc = "General Exit insert mode" })
map(all, "<C-s>", "<ESC><cmd>w<cr>", { desc = "General Save and Exit insert mode" })
map(all, "<C-q>", "<ESC><cmd>wqa<cr>", { desc = "General Save all and quit" })

-- NvChad defaults that persist even with plugins disabled (nvterm, etc.)
vim.keymap.del("n", "<leader>x")
vim.keymap.del("n", "<leader>h")
vim.keymap.del("n", "<leader>v")
vim.keymap.del({ "n", "t" }, "<A-i>")
vim.keymap.del({ "n", "t" }, "<A-h>")
vim.keymap.del({ "n", "t" }, "<A-v>")

-- buffers
-- https://github.com/NvChad/ui/blob/6f71760950c89c0484b58520211cc530516849fc/doc/nvui.txt#L269
map("n", "<leader>bd", function()
	require("nvchad.tabufline").close_buffer()
end, { desc = "Buffer Delete" })
map("n", "<leader>bo", function()
	require("nvchad.tabufline").closeAllBufs(false)
end, { desc = "Buffer Delete Others" })

-- lsp
map("n", "gd", "<cmd>Trouble lsp_definitions toggle<cr>", { desc = "LSP Definitions (Trouble)" })
map("n", "grr", "<cmd>Trouble lsp_references toggle<cr>", { desc = "LSP References (Trouble)" })

-- git
local gitsigns = require("gitsigns")
map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Git Preview Hunk" })
map("n", "<leader>gb", function()
	gitsigns.blame({ full = true })
end, { desc = "Git Blame" })
map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Git Stage Hunk" })
map("v", "<leader>gs", function()
	gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Git Stage Hunk" })
map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Git Reset Hunk" })
map("v", "<leader>gr", function()
	gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "Git Reset Hunk" })
map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Git Stage Buffer" })
map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Git Reset Buffer" })
map("n", "<leader>gQ", function()
	gitsigns.setqflist("all")
end, { desc = "Git All Hunks to Quickfix" })
map({ "o", "x" }, "ih", gitsigns.select_hunk, { desc = "Git Select Hunk" })
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

