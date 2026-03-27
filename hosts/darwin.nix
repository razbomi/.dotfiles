{ username, ... }: {
  system.primaryUser = username;
  ids.gids.nixbld = 350;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.zsh.enable = true;

  nix.gc = {
    automatic = true;
    interval = { Weekday = 0; Hour = 2; Minute = 0; };
    options = "--delete-older-than 30d";
  };

  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";
    taps = [ "buo/cask-upgrade" ];
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
      "stow"
      "uv"
      # "ollama"
    ];
    casks = [
      "1password"
      "1password-cli"
      "chatgpt"
      "claude"
      "claude-code"
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
      "slack"
      "spotify"
      "wispr-flow"
      "zoom"
      # "visual-studio-code"
    ];
  };

  system.stateVersion = 4;
}
