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
	command -v brew 2>&1 || /usr/bin/ruby -e \
		"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
}

help_message() {
	local command=$0
	cat <<EOF
usage: ${command} <target>

target:
   clean    --  Remove symlinks from install folder
   install  --  Link files to install folder
   tools    -- Install or update tools
EOF
}

if type "target_$1" >/dev/null; then
	"target_$1" "${@:2}"
else
	help_message "$1"
	exit 1
fi
