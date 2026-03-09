#!/usr/bin/env bash
set -euo pipefail

if command -v nix &>/dev/null; then
    echo "Nix already installed: $(nix --version)"
    exit 0
fi

echo "Installing Nix..."
sh <(curl -L https://nixos.org/nix/install)

echo "Done. Restart your shell, then run: nix --version"
