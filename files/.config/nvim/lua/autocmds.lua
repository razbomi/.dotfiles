require("nvchad.autocmds")

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local tf_group = augroup("FixTerraformCommentString", { clear = true })

local tf_commentstring = function(ev)
	vim.bo[ev.buf].commentstring = "# %s"
end

autocmd("FileType", {
	pattern = "terraform",
	group = tf_group,
	callback = tf_commentstring,
})

autocmd("FileType", {
	pattern = "hcl",
	group = tf_group,
	callback = tf_commentstring,
})

