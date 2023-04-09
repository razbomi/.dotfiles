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
  dotenv
  git
  kube-ps1
  kubectl
  kubetail
  tmux
  fzf
  zsh-autosuggestions
  zsh-syntax-highlighting
  zshmarks
)

source $ZSH/oh-my-zsh.sh

KUBE_PS1_SYMBOL_ENABLE=false
RPROMPT=$RPROMPT'$(kube_ps1)'
TERM=xterm-256color

export AWS_DEFAULT_REGION=ap-southeast-2
export AWS_SDK_LOAD_CONFIG=true
export GPG_TTY=$(tty)
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export NVM_DIR="$HOME/.nvm"
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:$GOPATH/bin
export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
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
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
alias a="alias | grep"
alias bats="${HOME}/Development/Projects/Mine/bats/bin/bats"
alias bb="brew bundle -v --global"
alias ds="docker stop \$(docker ps -a -q)"
alias dr="docker rm \$(docker ps -a -q)"
alias fmocha="echo \"\x1B[?25h\""
alias glb="git checkout \$(git branch --remote | fzf | sed 's/origin\///')"
alias h="history|grep"
alias j="jsonnet"
#alias jb="jsonnet-bundler"
alias kb="kustomize build --enable-helm"
alias kc="kustomize completion bash >/etc/bash_completion.d/kustomize"
alias kx="kubectx"
alias nv="nvim"
alias ta="source .env && terragrunt apply || terragrunt apply"
alias taa="source .env && terragrunt apply -auto-approve || terragrunt apply -auto-approve"
alias tda="source .env && terragrunt destroy -auto-approve || terragrunt destroy -auto-approve"
alias tdel="find . -name '.terra*' -type d -print | xargs rm -rf"
alias tf="terraform"
alias tp="source .env && terragrunt plan || terragrunt plan"
alias tra="source .env && terragrunt run-all apply || terragrunt run-all apply"
alias trp="source .env && terragrunt run-all plan || terragrunt run-all plan"

# https://github.com/jocelynmallon/zshmarks#notestips
alias g="jump"
alias s="bookmark"
alias dm="deletemark"
alias lm="showmarks"

#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                    # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#SLS_TABTAB_DIR="$(npm root -g)/serverless/node_modules/tabtab/.completions"
#[[ -f ${SLS_TABTAB_DIR}/sls.zsh ]] && . ${SLS_TABTAB_DIR}/sls.zsh
#[[ -f ${SLS_TABTAB_DIR}/serverless.zsh ]] && . ${SLS_TABTAB_DIR}/serverless.zsh
# export PATH="/usr/local/opt/mongodb-community@4.2/bin:$PATH"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/tk tk
# export PATH="/usr/local/opt/mongodb-community@4.4/bin:$PATH"
#export PATH="/usr/local/opt/libpq/bin:$PATH"
#
. /usr/local/opt/asdf/libexec/asdf.sh
