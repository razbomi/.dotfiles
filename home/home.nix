{ lib, username, ... }: {
  home.username = username;
  home.homeDirectory = lib.mkForce "/Users/${username}";
  home.stateVersion = "24.05";

  imports = [
    ./bat.nix
    ./btop.nix
    ./fzf.nix
    ./git.nix
    ./neovim.nix
    ./packages.nix
    ./tmux.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  catppuccin.enable = true;
  catppuccin.flavor = "mocha";

  programs.home-manager.enable = true;
}
