{ config, lib, username, ... }: {
  home.username = username;
  home.homeDirectory = lib.mkForce "/Users/${username}";
  home.stateVersion = "24.05";

  imports = [
    ./bat.nix
    ./btop.nix
    ./fzf.nix
    ./ghostty.nix
    ./git.nix
    ./neovim.nix
    ./packages.nix
    ./tmux.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  home.file.".fdignore".source = ../files/fdignore;
  home.file.".config/nvim".source = config.lib.file.mkOutOfStoreSymlink "/Users/${username}/.dotfiles/files/nvchad";

  catppuccin.enable = true;
  catppuccin.flavor = "mocha";

  programs.home-manager.enable = true;
}
