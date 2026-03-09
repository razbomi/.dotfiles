eval "$(zoxide init zsh --no-cmd)"

z() {
  local result
  result=$(zoxide query "$@" 2>/dev/null)
  if [[ -n "$result" ]]; then
    cd "$result"
  else
    __zoxide_zi "$@"
  fi
}
alias zi="__zoxide_zi"

# cd **<TAB>, <^C-T>
f() { 
  local dir
  dir=$(
    fd --type d --hidden --exclude .git --exclude node_modules  |
    fzf --height 40% \
        --layout reverse \
        --ignore-case \
        --info inline \
        --query "$*"
  ) && cd "${dir}"
}

alias v="nvim"
alias vim="nvim"

# Delete lines matching pattern across files (fzf to pick files)
rdl() {
  local files
  files=$(rg "$1" -l |
    fzf --multi \
        --tmux 80% \
        --layout reverse \
        --preview "rg --color=always -n '$1' {}" \
        --preview-window right,60%,border-left
  ) || return
  echo "$files" | xargs -n1 nvim -nesc ":g|$1|d | wq"
}

# Search and replace across files (fzf to pick files)
rsr() {
  [[ $# -ne 2 ]] && echo "usage: rsr <old> <new>" && return 1
  local files
  files=$(rg "$1" -l |
    fzf --multi \
        --tmux 80% \
        --layout reverse \
        --preview "rg --color=always -n '$1' {}" \
        --preview-window right,60%,border-left
  ) || return
  echo "$files" | xargs sed -i '' "s|$1|$2|g"
  echo "replaced '$1' → '$2' in:"
  echo "$files"
}

vi() {
  local file
  file=$(
    fd --type f --hidden --exclude .git --exclude node_modules |
    fzf --layout reverse \
        --ignore-case \
        --tmux 80% \
        --query "$*" \
        --preview "bat --color=always --style=numbers --line-range=:500 {}" \
        --preview-window right,60%,border-left \
        --bind 'ctrl-d:preview-half-page-down,ctrl-u:preview-half-page-up'
  ) && nvim "$file"
}
