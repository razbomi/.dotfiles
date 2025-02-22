#!/usr/bin/env bash
set -exuo pipefail

INSTALL_DIR="${INSTALL_DIR:-${HOME}/.dotfiles}"

target_install() {
  # https://www.gnu.org/software/stow/manual/stow.html
  stow --no-folding -vd "${INSTALL_DIR}" -S files
}

target_clean() {
  stow -vD files
}

target_tools() {
  ($INSTALL_DIR/install/ohmyzsh.sh)
  ($INSTALL_DIR/install/brew.sh)
}

help_message() {
  local command=$0
  cat <<EOF
usage: ${command} <target>

target:
   clean    --  Remove symlinks to dotfiles
   install  --  Link dotfiles to install folder
   tools    --  Install or update tools
EOF
}

if type "target_$1" >/dev/null; then
  "target_$1" "${@:2}"
else
  help_message "$1"
  exit 1
fi
