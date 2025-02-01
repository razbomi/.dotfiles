#!/usr/bin/env bash
set -exuo pipefail

if ! command -v brew 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew update
brew upgrade
brew bundle install --file="$(git rev-parse --show-toplevel)
