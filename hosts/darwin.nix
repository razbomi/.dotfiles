{ username, claude-config, lib, ... }: {
  system.primaryUser = username;
  ids.gids.nixbld = 350;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [ "claude-code" ];
  nixpkgs.overlays = [ claude-config.overlays.default ];

  programs.zsh.enable = true;

  nix.gc = {
    automatic = true;
    interval = { Weekday = 0; Hour = 2; Minute = 0; };
    options = "--delete-older-than 30d";
  };

  homebrew = {
    enable = true;
    onActivation.cleanup = "none";
    onActivation.upgrade = true;
    greedyCasks = true;
    brews = [
      "awscli"
      "azure-cli"
      "context7-mcp"
      "docker-credential-helper-ecr"
      "duckdb"
      "gradle"
      "helm"
      "jj"
      "kcat"
      "logcli"
      "mimirtool"
      "mise"
      "mongosh"
      "playwright-cli"
      "playwright-mcp"
      "prek"
      "rustup"
      "skaffold"
      "uv"
      # "ollama"
    ];
    casks = [
      "1password"
      "1password-cli"
      "chatgpt"
      "claude"
      "codex"
      "discord"
      "firefox"
      "font-fira-mono-nerd-font"
      "font-jetbrains-mono-nerd-font"
      "gcloud-cli"
      "ghostty"
      "granola"
      "loom"
      "microsoft-teams"
      "mongodb-compass"
      "session-manager-plugin"
      "slack"
      "spotify"
      "wispr-flow"
      "zoom"
      # "visual-studio-code"
    ];
  };

  system.defaults.NSGlobalDomain.ApplePressAndHoldEnabled = false;
  system.defaults.NSGlobalDomain.AppleShowAllExtensions = true;
  system.defaults.NSGlobalDomain.KeyRepeat = 2;
  system.defaults.NSGlobalDomain.InitialKeyRepeat = 15;

  security.pam.services.sudo_local.touchIdAuth = true;
  security.pam.services.sudo_local.reattach = true;

  system.stateVersion = 4;
}
