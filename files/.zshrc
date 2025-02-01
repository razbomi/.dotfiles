# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/${HOME}/.oh-my-zsh"

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
  git
  kubectl
  fzf
  zsh-autosuggestions
  zsh-syntax-highlighting
  history-substring-search
  z
)

source $ZSH/oh-my-zsh.sh

# https://github.com/sindresorhus/pure?tab=readme-ov-file#oh-my-zsh
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/aws/README.md
export SHOW_AWS_PROMPT=false
export AWS_PROFILE_STATE_ENABLED=true
export AWS_SDK_LOAD_CONFIG=true
export AWS_STATE_FILE="${HOME}/.aws_current_profile"

export GPG_TTY=$(tty)

# https://kubernetes.io/docs/reference/kubectl/cheatsheet/#zsh
# [[ $commands[kubectl] ]] && source <(kubectl completion zsh)

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="/usr/local/opt/libpq/bin:$PATH"

eval "$(/usr/local/bin/mise activate zsh)"

if [[ "$TERMINAL_EMULATOR" != "JetBrains-JediTerm" ]]; then
  if [[ -z "$TMUX" ]]; then
    # export TERM=xterm-256color
    tmux new-session -A -s "$USER"
  fi
fi

