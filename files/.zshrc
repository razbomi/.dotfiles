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

# History search (Up/C-r):
#   In picker: C-y copy to clipboard, C-/ toggle preview
#   After selecting: C-x C-e edit in vim, C-x C-u undo, C-x a expand alias
export FZF_CTRL_R_OPTS=" \
  --with-nth=2.. \
  --preview 'echo {2..} | bat --language=bash --color=always --plain' \
  --preview-window=down:3:wrap \
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort' \
  --bind 'ctrl-/:toggle-preview'"

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

# fzf history search on up/down arrows (use terminfo for correct escape sequences)
bindkey "${terminfo[kcuu1]}" fzf-history-widget
bindkey "${terminfo[kcud1]}" fzf-history-widget

# C-x C-e to edit current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

# https://github.com/sindresorhus/pure?tab=readme-ov-file#oh-my-zsh
# fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure
