---@type ChadrcConfig
require("nvchad.autocmds")

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local tf_group = augroup("FixTerraformCommentString", { clear = true })

local tf_commentstring = function(ev)
	vim.bo[ev.buf].commentstring = "# %s"
end

autocmd("FileType", {
	pattern = "tf",
	group = tf_group,
	callback = tf_commentstring,
})

autocmd("FileType", {
	pattern = "hcl",
	group = tf_group,
	callback = tf_commentstring,
})

-- FIXME: Override todo-comments defaults
autocmd("User", {
	pattern = "VeryLazy",
	group = augroup("NvChadReapplyHighlights", { clear = true }),
	callback = function()
		vim.defer_fn(function()
			vim.cmd("hi TodoFgTODO guifg=#89b4fa gui=bold")
			vim.cmd("hi TodoFgFIX guifg=#f38ba8 gui=bold")
			vim.cmd("hi TodoFgNOTE guifg=#94e2d5 gui=italic")
		end, 10)
	end,
})
