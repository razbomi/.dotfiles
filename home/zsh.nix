{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    autocd = true;
    dirHashes = {
      dev = "$HOME/Development";
    };

    history = {
      size = 50000;
      save = 10000;
      extended = true;
      expireDuplicatesFirst = true;
      ignoreDups = true;
      ignoreSpace = true;
      share = true;
    };

    shellAliases = {
      c = "claude";
      cat = "bat -p";
      code = "claude";
      dot = "cd ~/.dotfiles/";
      hey = "oha";
      j = "jsonnet";
      jb = "jsonnet-bundler";
      md = "mkdir -p";
      rd = "rmdir";
      sc = "source $HOME/.zshrc";
      watch = "viddy";

      pn = "pnpm";
      pna = "pnpm add";
      pni = "pnpm install";
      pnr = "pnpm run";
      pnrm = "pnpm remove";
      pnx = "pnpx";

      l = "eza -lah";

      ns = "sudo /run/current-system/sw/bin/darwin-rebuild switch --flake ~/.dotfiles";
      nu = "nix flake update --flake ~/.dotfiles && sudo /run/current-system/sw/bin/darwin-rebuild switch --flake ~/.dotfiles && brew upgrade --greedy";

      ta = "tmux switch-client -t";
      tks = "tmux kill-session -t";
      tkv = "tmux kill-server";
      tl = "tmux list-sessions";
      ts = "tmux new-session -s";
    };

    sessionVariables = {
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

      # Completion
      zmodload -i zsh/complist
      setopt complete_in_word always_to_end auto_menu
      unsetopt menu_complete flowcontrol
      zstyle ':completion:*:*:*:*:*' menu select
      zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'
      zstyle ':completion:*' special-dirs true
      zstyle ':completion:*' use-cache yes
      zstyle ':completion:*' cache-path "$ZSH_CACHE_DIR"
      bindkey -M menuselect "''${terminfo[kcbt]}" reverse-menu-complete

      # Directory stack
      setopt auto_pushd pushd_ignore_dups pushdminus

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

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    icons = "auto";
    git = true;
  };

  home.file = {
    ".config/zsh/aliases_docker.zsh".source = ../files/zsh/aliases_docker.zsh;
    ".config/zsh/aliases_files.zsh".source = ../files/zsh/aliases_files.zsh;
    ".config/zsh/aliases_search.zsh".source = ../files/zsh/aliases_search.zsh;
    ".config/zsh/aliases_terragrunt.zsh".source = ../files/zsh/aliases_terragrunt.zsh;
    ".config/zsh/aliases_yaml.zsh".source = ../files/zsh/aliases_yaml.zsh;
  };
}
