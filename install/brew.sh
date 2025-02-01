#!/usr/bin/env bash
set -exuo pipefail

if ! command -v brew 2>&1; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update
brew upgrade
brew bundle install --file="$(git rev-parse --show-toplevel)
