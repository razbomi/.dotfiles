alias kb="kustomize build --enable-helm --load-restrictor=LoadRestrictionsNone"
alias kgsecab64d="kgsec -o json | jq '.items | map({name: .metadata.name, env: (.data | to_entries | map(. | {(.key): (.value | @base64d)}) | reduce .[] as \$i ({}; . + \$i)) })'"
kafka-consumer-groups() { keti "$(kubectl get pods -l app.kubernetes.io/name=kafka-connect -n kafka -o name | tail -1 | sed  's/pod\///g')" -n kafka -c cp-kafka-connect-server -- kafka-consumer-groups --bootstrap-server b-1:9092 $@ }

yn() { yq eval ". | select(.metadata.name == \"$1\")" }
yk() { yq eval ". | select(.kind == \"$1\")" }
