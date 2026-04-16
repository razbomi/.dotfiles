{ pkgs, ... }:
let
  # TODO: remove when fixed — https://github.com/NixOS/nixpkgs/issues/509480
  gotoolsWithoutModernize = pkgs.symlinkJoin {
    name = "gotools-without-modernize";
    paths = [ pkgs.gotools ];
    postBuild = ''
      rm -f "$out/bin/modernize"
    '';
  };
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withRuby = false;
    withPython3 = false;
  };

  # NvChad handles its own catppuccin theming via base46
  catppuccin.nvim.enable = false;

  # Treesitter parsers — precompiled by nix, on neovim's runtimepath
  home.packages = with pkgs; [
    (vimPlugins.nvim-treesitter.withPlugins (p: [
      p.bash
      p.go
      p.gomod
      p.gosum
      p.gowork
      p.hcl
      p.javascript
      p.json
      p.jsonnet
      p.lua
      p.luadoc
      p.markdown
      p.markdown_inline
      p.nix
      p.printf
      p.python
      p.terraform
      p.typescript
      p.vim
      p.vimdoc
      p.yaml
    ]))

    # LSP servers, formatters, linters — on global PATH for neovim + Claude Code
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
    gotoolsWithoutModernize # goimports
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
