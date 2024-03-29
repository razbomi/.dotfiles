alias a="alias | grep"
alias bats="${HOME}/Development/Projects/Mine/bats/bin/bats"
alias ds="docker stop \$(docker ps -a -q)"
alias dr="docker rm \$(docker ps -a -q)"
alias ec="vi ${HOME}/.zshrc"
alias fmocha="echo \"\x1B[?25h\""
alias glb="git checkout \$(git branch --remote | fzf | sed 's/origin\///')"
alias h="history|grep"
alias j="jsonnet"
alias jb="jsonnet-bundler"
alias kb="kustomize build --enable-helm"
alias kc="kustomize completion bash >/etc/bash_completion.d/kustomize"
alias sc="source ${HOME}/.zshrc"

alias t="tmux"
alias ta="terragrunt run-all apply --terragrunt-non-interactive --terragrunt-working-dir"
alias td="terragrunt run-all destroy --terragrunt-working-dir"
alias tdel="find . -name '.terra*' -type d -print | xargs rm -rf"
alias tim="terragrunt import --terragrunt-working-dir"
alias tp="terragrunt run-all plan --terragrunt-non-interactive --terragrunt-working-dir"
alias trm="terragrunt state rm --terragrunt-non-interactive --terragrunt-working-dir"
alias tu="terragrunt init -upgrade --terragrunt-working-dir"

alias vi="nvim"
alias vim="nvim"

yn() { yq eval ". | select(.metadata.name == \"$1\")" }
yk() { yq eval ". | select(.kind == \"$1\")" }
