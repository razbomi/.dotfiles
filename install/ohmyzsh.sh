#!/usr/bin/env bash
set -exuo pipefail

ZSH=${ZSH:-"${HOME}/.oh-my-zsh"}

if [ -d "$ZSH" ]; then
  "$ZSH/tools/upgrade.sh"
else
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
