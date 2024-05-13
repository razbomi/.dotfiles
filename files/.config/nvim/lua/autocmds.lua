---@type ChadrcConfig
require("nvchad.autocmds")

local autocmd = vim.api.nvim_create_autocmd

local function open_nvim_tree()
	require("nvim-tree.api").tree.open()
end

-- autocmd({ "VimEnter" }, { callback = open_nvim_tree })
-- autocmd({ "BufEnter" }, {
-- 	pattern = "NvimTree*",
-- 	callback = function()
-- local api = require("nvim-tree.api")
-- local view = require("nvim-tree.view")
--
-- if not view.is_visible() then
-- api.tree.open()
-- end
-- 	end,
-- })

-- autocmd("BufReadPost", {
-- 	pattern = "*",
-- 	callback = function()
-- 	end,
-- })
--
-- autocmd("FileType", "python", {
-- 	"setlocal expandtab",
-- })
--
-- autocmd("FileType", "javascript", {
-- 	"setlocal shiftwidth=2",
-- })
-- end

-- return M
