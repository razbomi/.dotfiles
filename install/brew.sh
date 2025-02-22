#!/usr/bin/env bash
set -exuo pipefail

# M- mac specific
if ! command -v /opt/homebrew/bin/brew 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

brew update
brew upgrade
brew bundle install --file="$(git rev-parse --show-toplevel)/files/Brewfile"
brew cu -a
