#!/usr/bin/env bash

set -exuo pipefail

function install_dotfiles {
  # https://www.gnu.org/software/stow/manual/stow.html
  stow --verbose vim
  stow --verbose tmux
}

install_dotfiles
