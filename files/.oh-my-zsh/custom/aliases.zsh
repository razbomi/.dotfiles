alias a="alias | grep"
alias ec="vi ${HOME}/.zshrc"
alias fmocha="echo \"\x1B[?25h\""
alias glb="git checkout \$(git branch --remote | fzf | sed 's/origin\///')"
alias h="history 1|grep"
alias j="jsonnet"
alias jb="jsonnet-bundler"
alias kb="kustomize build --enable-helm"
alias kc="kustomize completion bash >/etc/bash_completion.d/kustomize"
alias sc="source ${HOME}/.zshrc"
alias t="terragrunt run-all"
alias ta="terragrunt run-all apply --terragrunt-non-interactive --terragrunt-disable-bucket-update --terragrunt-working-dir"
alias td="terragrunt run-all destroy --terragrunt-disable-bucket-update --terragrunt-working-dir"
alias tfd="fd -HI .terragrunt-cache --type d -X rm -rf"
alias ti="terragrunt import --terragrunt-disable-bucket-update --terragrunt-working-dir"
alias tiu="terragrunt run-all init -upgrade --terragrunt-disable-bucket-update --terragrunt-working-dir"
alias tp="terragrunt run-all plan --terragrunt-disable-bucket-update --terragrunt-provider-cache --terragrunt-non-interactive --terragrunt-working-dir"
alias trm="terragrunt state rm --terragrunt-non-interactive --terragrunt-disable-bucket-update --terragrunt-working-dir"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
yn() { yq eval ". | select(.metadata.name == \"$1\")" }
yk() { yq eval ". | select(.kind == \"$1\")" }
