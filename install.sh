#!/usr/bin/env zsh

set -exuo pipefail

IFS=$'\n\t'
INSTALL_DIR="${INSTALL_DIR:-${HOME}/.dotfiles}"

[[ -a .env ]] && source .env

download_dotfiles() {
  [[ -a "${INSTALL_DIR}" ]] || git clone git@github.com:razbomi/.dotfiles.git "${INSTALL_DIR}"
}

install_dotfiles() {
  # https://www.gnu.org/software/stow/manual/stow.html
  stow -vv -d "${INSTALL_DIR}" -S files -t "${INSTALL_DIR}"
}

download_dotfiles
install_dotfiles
