_alias_list() {
  alias
  grep -hE '^[a-zA-Z_-]+\(\)' ~/.config/zsh/aliases*.zsh \
    | sed 's/() *{.*/=(function)/'
}

a() {
  local selection
  selection=$(_alias_list | fzf --layout reverse --height 40% --query "$*" \
    --preview 'line={}; name=$(echo "$line" | cut -d= -f1); value=$(echo "$line" | cut -d= -f2-);
      if [ "$value" = "(function)" ]; then
        sed -n "/^${name}()/,/^}/p" ~/.config/zsh/aliases*.zsh
      else
        echo "$value" | sed "s/^'\''//;s/'\''$//"
      fi | bat --language=bash --style=plain --color=always
    ' --preview-window down:wrap | cut -d= -f1)
  [[ -n "$selection" ]] && print -z "$selection "
}

# Fancy C-R with syntax highlighting (C-y copy)
h() {
  local cmd
  cmd=$(fc -rln 1 | awk '!seen[$0]++' |
    bat --language=bash --color=always --plain |
    fzf --ansi \
        --layout reverse \
        --ignore-case \
        --tmux 80% \
        --query "$*" \
        --bind 'ctrl-y:execute-silent(echo -n {} | pbcopy)+abort'
  ) && print -z "$cmd"
}
