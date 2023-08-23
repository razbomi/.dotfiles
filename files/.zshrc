# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export ZSH="/${HOME}/.oh-my-zsh"

CASE_SENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"
HYPHEN_INSENSITIVE="true"
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# Try presto if this becomes too slow
plugins=(
  aws
  #dotenv
  git
  kube-ps1
  kubectl
  kubetail
  #tmux
  fzf
  zsh-autosuggestions
  zsh-syntax-highlighting
  history-substring-search
  z
  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vi-mode#movement
  vi-mode
)

source $ZSH/oh-my-zsh.sh

EDITOR=vim
RPROMPT='$(aws_prompt_info)|$(kube_ps1)'
TERM=xterm-256color

# https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/kube-ps1/README.md
KUBE_PS1_PREFIX=""
KUBE_PS1_SUFFIX=""
KUBE_PS1_SYMBOL_ENABLE=false

# reference: https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/aws/README.md
ZSH_THEME_AWS_DIVIDER=":"
ZSH_THEME_AWS_PROFILE_PREFIX=""
ZSH_THEME_AWS_PROFILE_SUFFIX=""
ZSH_THEME_AWS_REGION_PREFIX=""
ZSH_THEME_AWS_REGION_SUFFIX=""

export AWS_DEFAULT_REGION=ap-southeast-2
export AWS_SDK_LOAD_CONFIG=true
export GPG_TTY=$(tty)
#export GOPATH=$HOME/golang
#export GOROOT=/usr/local/opt/go/libexec
#export NVM_DIR="$HOME/.nvm"
export PATH=/usr/local/bin:$PATH
#export PATH=$PATH:$GOPATH/bin
export PATH="/usr/local/opt/gettext/bin:$PATH"
#export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="$HOME/.bin:$PATH"

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
alias a="alias | grep"
alias bats="${HOME}/Development/Projects/Mine/bats/bin/bats"
alias bb="brew bundle -v --global"
alias ds="docker stop \$(docker ps -a -q)"
alias dr="docker rm \$(docker ps -a -q)"
alias ec="${EDITOR} ${HOME}/.zshrc"
alias fmocha="echo \"\x1B[?25h\""
alias glb="git checkout \$(git branch --remote | fzf | sed 's/origin\///')"
alias h="history|grep"
alias j="jsonnet"
#alias jb="jsonnet-bundler"
alias kb="kustomize build --enable-helm"
alias kc="kustomize completion bash >/etc/bash_completion.d/kustomize"
alias kx="kubectx"
alias nv="nvim"
alias sc="source ${HOME}/.zshrc"
alias ta="terragrunt run-all apply --terragrunt-non-interactive --terragrunt-working-dir"
alias td="terragrunt run-all destroy --terragrunt-working-dir"
alias tdel="find . -name '.terra*' -type d -print | xargs rm -rf"
alias tp="terragrunt run-all plan --terragrunt-non-interactive --terragrunt-working-dir"
alias trm="terragrunt run-all state rm --terragrunt-non-interactive --terragrunt-working-dir"
alias tu="terragrunt init -upgrade --terragrunt-working-dir"

# https://github.com/jocelynmallon/zshmarks#notestips
#alias g="jump"
#alias s="bookmark"
#alias dm="deletemark"
#alias lm="showmarks"

# autoload -U +X bashcompinit && bashcompinit
# complete -o nospace -C /usr/local/bin/tk tk

# https://kubernetes.io/docs/reference/kubectl/cheatsheet/#zsh
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

. /usr/local/opt/asdf/libexec/asdf.sh
