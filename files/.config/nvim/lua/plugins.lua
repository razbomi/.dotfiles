local M = {}

function M.setup()
    local packer_bootstrap = false

    local function packer_init()
        -- https://github.com/wbthomason/packer.nvim#bootstrapping
        local fn = vim.fn
        local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
        if fn.empty(fn.glob(install_path)) > 0 then
            local packer_repo = 'https://github.com/wbthomason/packer.nvim'
            packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', packer_repo, install_path })
            vim.cmd [[packadd packer.nvim]]
        end
    end

    local function plugins(use)
        use { "wbthomason/packer.nvim" }
        use { "neovim/nvim-lspconfig" }

        if packer_bootstrap then
            print "Restart Neovim required after installation!"
            require("packer").sync()
        end
    end

    packer_init()
    local packer = require('packer')
    packer.startup(plugins)

end

return M