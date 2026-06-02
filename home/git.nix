{ ... }: {
  programs.git = {
    enable = true;
    signing.format = null;

    includes = [
      { path = "~/.gitconfig.local"; }
    ];

    settings = {
      user.name = "Mitko Razboynikov";
      user.email = "1096424+razbomi@users.noreply.github.com";
      init.defaultBranch = "main";
      credential.helper = "osxkeychain";
      pull.rebase = true;
      push.autoSetupRemote = true;
      rerere.enabled = true;
      diff.algorithm = "histogram";
      github.user = "razbomi";
    };
  };

  catppuccin.delta.enable = true;
  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      navigate = true;
      line-numbers = true;
      hunk-header-style = "file line-number syntax";
      hunk-header-decoration-style = "none";
      file-decoration-style = "none";
      file-style = "bold yellow";
      file-added-label = " ";
      file-modified-label = " ";
      file-removed-label = " ";
      file-renamed-label = " ";
      hunk-label = " ";
    };
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    includes = [ "config.local" ];
    settings = {
      "*" = {
        AddKeysToAgent = "yes";
        ServerAliveInterval = 60;
      };
      "github.com" = {
        User = "git";
        IdentitiesOnly = true;
        IdentityFile = "~/.ssh/id_ed25519";
      };
      "github.com-work" = {
        HostName = "github.com";
        User = "git";
        IdentitiesOnly = true;
        IdentityFile = "~/.ssh/github-work.pub";
        IdentityAgent = "\"~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock\"";
      };
    };
  };
}
