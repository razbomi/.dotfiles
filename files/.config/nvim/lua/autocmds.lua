---@type ChadrcConfig
require("nvchad.autocmds")

local autocmd = vim.api.nvim_create_autocmd

autocmd("FileType", {
	pattern = "terraform",
	group = vim.api.nvim_create_augroup("FixTerraformCommentString", { clear = true }),
	callback = function(ev)
		vim.bo[ev.buf].commentstring = "# %s"
	end,
})

autocmd("FileType", {
	pattern = "hcl",
	group = vim.api.nvim_create_augroup("FixTerraformCommentString", { clear = true }),
	callback = function(ev)
		vim.bo[ev.buf].commentstring = "# %s"
	end,
})
