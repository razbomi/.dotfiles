typeset -U path
export PATH="/opt/homebrew/sbin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/Applications/IntelliJ IDEA.app/Contents/MacOS" # idea .

# Auto-attach tmux in Ghostty (comment out to recover if tmux breaks)
if [[ -z "$TMUX" && "$TERM_PROGRAM" == "ghostty" ]]; then
  exec tmux new-session
fi

# General exports
export ZSH="$HOME/.oh-my-zsh"
export EDITOR=nvim
export GPG_TTY=$(tty)

# Oh My Zsh config
CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
ZSH_THEME=""

# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/aws/README.md
export SHOW_AWS_PROMPT=false
export AWS_PROFILE_STATE_ENABLED=true
export AWS_SDK_LOAD_CONFIG=true
export AWS_STATE_FILE="${HOME}/.aws_current_profile"

# FZF Options
export FZF_DEFAULT_COMMAND="fd --type f"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
--color=selected-bg:#45475a \
--multi"

# Try presto if this becomes too slow
plugins=(
  aws
  brew
  fzf
  git
  kubectl
  mise
  uv
)

# https://github.com/zsh-users
source "$ZSH/oh-my-zsh.sh"
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Use fzf for history search on up/down (use !! for previous command)
bindkey '^[[A' fzf-history-widget
bindkey '^[[B' fzf-history-widget

# https://github.com/sindresorhus/pure?tab=readme-ov-file#oh-my-zsh
# fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure
