#!/usr/bin/env bash
set -exuo pipefail

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

function checkDir() {
  local dir=$1

  if [[ ! -d "$dir" ]]; then
    mkdir -p "$dir"
  fi
}

checkDir "$HOME/.zsh" && git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
checkDir "$HOME/.tmux/plugins" && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
