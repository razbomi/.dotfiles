{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    sessionVariables = {
      EDITOR = "nvim";
      # GPG_TTY set in initContent (needs runtime eval)

      # AWS plugin config (must be set before sourcing)
      SHOW_AWS_PROMPT = "false";
      AWS_PROFILE_STATE_ENABLED = "true";
      AWS_SDK_LOAD_CONFIG = "true";
      AWS_STATE_FILE = "$HOME/.aws_current_profile";
    };

    initContent = let
      omz = "${pkgs.oh-my-zsh}/share/oh-my-zsh";
    in ''
      # PATH
      typeset -U path
      export PATH="/opt/homebrew/sbin:$PATH"
      export PATH="/opt/homebrew/bin:$PATH"
      export PATH="$HOME/.local/bin:$PATH"
      export PATH="$PATH:/Applications/IntelliJ IDEA.app/Contents/MacOS"

      # Auto-attach tmux in Ghostty
      if [[ -z "$TMUX" && "$TERM_PROGRAM" == "ghostty" ]]; then
        exec tmux new-session
      fi

      export GPG_TTY=$(tty)

      # C-x C-e to edit current command line in $EDITOR
      autoload -U edit-command-line
      zle -N edit-command-line
      bindkey '^x^e' edit-command-line

      # Tool integrations
      eval "$(mise activate zsh)"
      eval "$(uv generate-shell-completion zsh)"

      # oh-my-zsh lib functions needed by plugins
      function __git_prompt_git() {
        GIT_OPTIONAL_LOCKS=0 command git "$@"
      }

      function git_current_branch() {
        local ref
        ref=$(__git_prompt_git symbolic-ref --quiet HEAD 2> /dev/null)
        local ret=$?
        if [[ $ret != 0 ]]; then
          [[ $ret == 128 ]] && return
          ref=$(__git_prompt_git rev-parse --short HEAD 2> /dev/null) || return
        fi
        echo ''${ref#refs/heads/}
      }

      # kubectl completions cache
      ZSH_CACHE_DIR="''${XDG_CACHE_HOME:-$HOME/.cache}/zsh"
      mkdir -p "$ZSH_CACHE_DIR/completions"

      # oh-my-zsh plugins (no framework, just the plugin files)
      source ${omz}/plugins/aws/aws.plugin.zsh
      source ${omz}/plugins/git/git.plugin.zsh
      source ${omz}/plugins/kubectl/kubectl.plugin.zsh

      # Prefix history search on up/down arrows
      # Bind both application mode (^[OA) and normal mode (^[[A) — tmux sends normal mode
      bindkey "''${terminfo[kcuu1]}" history-beginning-search-backward
      bindkey "''${terminfo[kcud1]}" history-beginning-search-forward
      bindkey "^[[A" history-beginning-search-backward
      bindkey "^[[B" history-beginning-search-forward

      # Pure prompt
      fpath+=(${pkgs.pure-prompt}/share/zsh/site-functions)
      autoload -U promptinit; promptinit
      prompt pure

      # Custom alias files
      for f in ~/.config/zsh/aliases*.zsh; do
        source "$f"
      done
    '';
  };

  home.file = {
    ".config/zsh/aliases.zsh".source = ./shell/aliases.zsh;
    ".config/zsh/aliases_docker.zsh".source = ./shell/aliases_docker.zsh;
    ".config/zsh/aliases_files.zsh".source = ./shell/aliases_files.zsh;
    ".config/zsh/aliases_search.zsh".source = ./shell/aliases_search.zsh;
    ".config/zsh/aliases_terragrunt.zsh".source = ./shell/aliases_terragrunt.zsh;
    ".config/zsh/aliases_yaml.zsh".source = ./shell/aliases_yaml.zsh;
    ".fdignore".source = ./shell/fdignore;
  };
}
