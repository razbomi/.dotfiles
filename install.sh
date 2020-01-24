#!/usr/bin/env zsh

set -exuo pipefail

IFS=$'\n\t'
INSTALL_DIR="${INSTALL_DIR:-${HOME}/.dotfiles}"

[[ -a .env ]] && source .env

clean_all() {
  stow -vD scripts -t ${HOME}/.bin
  stow -vD files
}

download::dotfiles() {
  git clone git@github.com:razbomi/.dotfiles.git $1
}

install::brew() {
  command -v brew 2>&1 || /usr/bin/ruby -e \
    "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

install_bundle() {
  # https://github.com/Homebrew/homebrew-bundle
  # brew bundle --global
  # brew bundle dump
  # brew deps --tree --installed
  # brew leaves
  brew bundle --no-lock --file="${INSTALL_DIR}/files/.Brewfile"
}

initial_install() {
  [[ -a "${INSTALL_DIR}" ]] && return 0
  download::dotfiles "${INSTALL_DIR}"
  install::brew
}

install_dotfiles() {
  # https://www.gnu.org/software/stow/manual/stow.html
  [[ -a "${HOME}/.bin" ]] || mkdir ${HOME}/.bin
  stow -vd "${INSTALL_DIR}" -S scripts -t ${HOME}/.bin
  stow -vd "${INSTALL_DIR}" -S files
}

clean_all
initial_install
#install_dotfiles
