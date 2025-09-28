# Goto recent dir
unalias z 2> /dev/null
z() {
  local dir=$(
    zshz -l  |
    cut -wf2 |
    fzf --height 40% \
        --layout reverse \
        --info inline \
        --tac \
        --no-sort \
        --select-1 \
        --query "$(zshz -e $*)"
  ) && cd "$dir"
}

# cd **<TAB>, <^C-T>
f() { 
  local dir
  dir=$(
    fd --type d --hidden --exclude .git --exclude node_modules  |
    fzf --height 40% \
        --layout reverse \
        --ignore-case \
        --info inline \
        --tac \
        --no-sort \
        --query "$*"
  ) && cd "${dir}"
}

# v **<TAB> 
alias v="nvim"
alias vim="nvim"
