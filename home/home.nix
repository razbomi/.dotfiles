{ lib, username, ... }: {
  home.username = username;
  home.homeDirectory = lib.mkForce "/Users/${username}";
  home.stateVersion = "24.05";

  imports = [
    ./bat.nix
    ./btop.nix
    ./tmux.nix
  ];

  catppuccin.enable = true;
  catppuccin.flavor = "mocha";

  programs.home-manager.enable = true;
}
