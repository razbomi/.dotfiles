# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/sbin:$PATH
export ZSH="${HOME}/.oh-my-zsh"

CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
EDITOR=nvim
HIST_STAMPS="yyyy-mm-dd"
HYPHEN_INSENSITIVE="true"
ZSH_THEME=""

# Try presto if this becomes too slow
plugins=(
  aws
  brew
  fzf
  git
  kubectl
  mise
  z
)

# https://github.com/zsh-users
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source $(brew --prefix)/share/zsh-history-substring-search/zsh-history-substring-search.zsh

source $ZSH/oh-my-zsh.sh

# https://github.com/sindresorhus/pure?tab=readme-ov-file#oh-my-zsh
# fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure

# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/aws/README.md
export SHOW_AWS_PROMPT=false
export AWS_PROFILE_STATE_ENABLED=true
export AWS_SDK_LOAD_CONFIG=true
export AWS_STATE_FILE="${HOME}/.aws_current_profile"

export GPG_TTY=$(tty)

# FZF Options
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

# https://kubernetes.io/docs/reference/kubectl/cheatsheet/#zsh
# [[ $commands[kubectl] ]] && source <(kubectl completion zsh)

# export PATH="/usr/local/bin:$PATH"
# export PATH="/usr/local/sbin:$PATH"

# eval "$(/usr/local/bin/mise activate zsh)"

if [[ "$TERMINAL_EMULATOR" != "JetBrains-JediTerm" ]]; then
  if [[ -z "$TMUX" ]]; then
    # export TERM=xterm-256color
    tmux new-session -A -s "$USER"
  fi
fi

