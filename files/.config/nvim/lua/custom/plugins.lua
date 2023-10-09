local plugins = {
  {
    "neovim/nvim-lspconfig",

    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",

        "go",
        "gomod",
        "gosum",
        "gowork",

        "hcl",
        "terraform",

        "json",
        "yaml",
      },
    },
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",

        "gopls",
        "goimports",

        "bash-language-server",
        "shfmt",
        "shellcheck",

        "terraform-ls",
        -- "prettier",
        "yaml-language-server",
      },
    },
  },
  {
    "alexghergh/nvim-tmux-navigation",
    event = "VeryLazy",
    config = function()
      require "custom.configs.nvim-tmux-navigation"
    end,
  },
}

return plugins
