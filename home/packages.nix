{ pkgs, ... }: {
  home.packages = with pkgs; [
    age              # file encryption (sops backend)
    dive             # docker image layer explorer
    fd               # fast find
    gh               # GitHub CLI
    go-jsonnet       # Jsonnet evaluator
    ipcalc           # IP subnet calculator
    jq               # JSON processor
    jsonnet-bundler  # Jsonnet package manager (jb)
    k6               # load testing
    kind             # k8s in Docker
    ko               # Go container image builder
    kubectl          # Kubernetes CLI
    kustomize        # k8s manifest customization
    mkcert           # local dev TLS certs
    oha              # HTTP load testing (hey replacement)
    ripgrep          # fast grep
    shellcheck       # shell linter
    shfmt            # shell formatter
    sops             # secrets encryption
    terraform-docs   # terraform documentation generator
    viddy            # modern watch replacement (diff highlighting, history)
    yq-go            # YAML processor (Mike Farah's Go version)
  ];
}
