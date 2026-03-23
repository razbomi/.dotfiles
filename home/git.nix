{ ... }: {
  programs.git = {
    enable = true;

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
    matchBlocks = {
      "*" = {
        extraOptions = {
          AddKeysToAgent = "yes";
          ServerAliveInterval = "60";
        };
      };
      "github.com" = {
        user = "git";
        identitiesOnly = true;
        identityFile = "~/.ssh/id_ed25519";
      };
      "github.com-work" = {
        hostname = "github.com";
        user = "git";
        identitiesOnly = true;
        identityFile = "~/.ssh/github-work.pub";
        extraOptions = {
          IdentityAgent = "\"~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock\"";
        };
      };
    };
  };
}
