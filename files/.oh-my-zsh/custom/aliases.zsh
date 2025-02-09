alias a="alias | grep"
alias asdf="mise"
alias c="clear"
alias dc="docker compose"
alias dot="cd ~/.dotfiles/"
alias h="history 1|grep"
alias hey="oha" # https://github.com/rakyll/hey/issues/269
alias j="jsonnet"
alias jb="jsonnet-bundler"
alias kb="kustomize build --enable-helm --load-restrictor=LoadRestrictionsNone"
alias kc="kustomize completion bash >/etc/bash_completion.d/kustomize"
alias kgsecab64d="kgsec -o json | jq '.items | map({name: .metadata.name, env: (.data | to_entries | map(. | {(.key): (.value | @base64d)}) | reduce .[] as \$i ({}; . + \$i)) })'"
kafka-consumer-groups() { keti "$(kubectl get pods -l app.kubernetes.io/name=kafka-connect -n kafka -o name | tail -1 | sed  's/pod\///g')" -n kafka -c cp-kafka-connect-server -- kafka-consumer-groups --bootstrap-server b-1:9092 $@ }
alias sc="source ${HOME}/.zshrc"
alias t="terragrunt run-all"
alias ta="terragrunt run-all apply --terragrunt-non-interactive --terragrunt-disable-bucket-update --terragrunt-working-dir"
alias ta_old="terragrunt run-all apply --terragrunt-non-interactive --terragrunt-working-dir"
alias td="terragrunt run-all destroy --terragrunt-disable-bucket-update --terragrunt-working-dir"
alias td_old="terragrunt run-all destroy --terragrunt-working-dir"
alias tfd="fd -HI .terragrunt-cache --type d -X rm -rf"
alias ti="terragrunt import --terragrunt-disable-bucket-update --terragrunt-working-dir"
alias tiu="terragrunt run-all init -upgrade --terragrunt-disable-bucket-update --terragrunt-working-dir"
alias tp="terragrunt run-all plan --terragrunt-disable-bucket-update --terragrunt-non-interactive --terragrunt-working-dir"
alias tp_old="terragrunt run-all plan --terragrunt-non-interactive --terragrunt-working-dir"
alias trm="terragrunt state rm --terragrunt-non-interactive --terragrunt-disable-bucket-update --terragrunt-working-dir"
alias v="nvim"
alias vi="v"
alias vim="v"
yn() { yq eval ". | select(.metadata.name == \"$1\")" }
yk() { yq eval ". | select(.kind == \"$1\")" }

# Find a way to install withou omzhs
unalias z
z() { cd $(zshz -l $1 2>&1 | fzf | cut -w -f2) }
