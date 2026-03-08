_alias_list() {
  alias
  grep -hE '^[a-zA-Z_-]+\(\)' ~/.oh-my-zsh/custom/*.zsh \
    | sed 's/() *{.*/=(function)/'
}

_alias_preview() {
  local name=${1%%=*}
  local value=${1#*=}
  if [[ $value == "(function)" ]]; then
    sed -n "/^$name()/,/^}/p" ~/.oh-my-zsh/custom/*.zsh
  else
    echo "$value" | sed "s/^'//;s/'$//"
  fi | bat --language=bash --style=plain --color=always
}

a() {
  local selection
  selection=$(_alias_list | fzf --layout reverse --height 40% --query "$*" \
    --preview "_alias_preview {}" --preview-window down:wrap | cut -d= -f1)
  [[ -n "$selection" ]] && print -z "$selection "
}
