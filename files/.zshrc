# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/${HOME}/.oh-my-zsh"

CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
HYPHEN_INSENSITIVE="true"
ZSH_THEME=""

# Try presto if this becomes too slow
plugins=(
  aws
  git
  # kube-ps1
  kubectl
  # kubetail
  fzf
  zsh-autosuggestions
  zsh-syntax-highlighting
  history-substring-search
  z
)

source $ZSH/oh-my-zsh.sh

# Initialise pure prompt 
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

EDITOR=nvim
# RPROMPT='$(aws_prompt_info)|$(kube_ps1)'
# TERM=xterm-256color

# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/kube-ps1/README.md
KUBE_PS1_PREFIX=""
KUBE_PS1_SUFFIX=""
KUBE_PS1_SYMBOL_ENABLE=off

# reference: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/aws/README.md
export SHOW_AWS_PROMPT=false
ZSH_THEME_AWS_DIVIDER=":"
ZSH_THEME_AWS_PROFILE_PREFIX=""
ZSH_THEME_AWS_PROFILE_SUFFIX=""
ZSH_THEME_AWS_REGION_PREFIX=""
ZSH_THEME_AWS_REGION_SUFFIX=""
export AWS_PROFILE_STATE_ENABLED=true
export AWS_STATE_FILE="${HOME}/.aws_current_profile"

export AWS_DEFAULT_REGION=ap-southeast-2
export AWS_SDK_LOAD_CONFIG=true
export GPG_TTY=$(tty)
#export GOPATH=$HOME/golang
#export GOROOT=/usr/local/opt/go/libexec
#export PATH=$PATH:$GOPATH/bin

# https://kubernetes.io/docs/reference/kubectl/cheatsheet/#zsh
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

. /usr/local/opt/asdf/libexec/asdf.sh

# bun
[ -s "/Users/mitko/.bun/_bun" ] && source "/Users/mitko/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/opt/libpq/bin:$PATH"

# tmux
if [[ -z "$TMUX" ]]; then
  export TERM=xterm-256color

  tmux new-session -A -s "$USER"
fi

