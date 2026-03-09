{ ... }: {
  ids.gids.nixbld = 350;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.zsh.enable = true;

  system.stateVersion = 4;
}
