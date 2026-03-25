{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # NvChad handles its own catppuccin theming via base46
  catppuccin.nvim.enable = false;

  # LSP servers, formatters, linters — on global PATH for neovim + Claude Code
  home.packages = with pkgs; [
    # LSP servers
    bash-language-server
    gopls
    jsonnet-language-server
    pyright
    terraform-ls
    typescript-language-server
    typescript
    vscode-langservers-extracted
    yaml-language-server

    # Formatters
    gotools # goimports
    oxfmt
    prettierd
    ruff
    stylua
    # shfmt — already in packages.nix
    # terraform fmt — comes from terraform (mise)
    # terragrunt hclfmt — comes from terragrunt (mise)

    # Linters
    oxlint
    # ruff — already listed above
  ];
}
