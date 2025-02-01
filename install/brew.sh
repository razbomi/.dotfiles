#!/usr/bin/env bash
set -exuo pipefail

# command -v brew 2>&1 || /usr/bin/ruby -e \
#  "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade
brew bundle install --file="$(git rev-parse --show-toplevel)/files/.homebrew/Brewfile"
