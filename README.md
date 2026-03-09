# .dotfiles

Personal dotfiles and system configuration for macOS (arm). Uses nix-darwin + home-manager for packages and tool config, with stow + brew for things not yet migrated.

## Fresh install

```bash
git clone git@github.com:razbomi/.dotfiles.git
cd ~/.dotfiles

# 1. Install nix (restart shell after)
./install/nix.sh

# 2. Stow configs (zsh, tmux, ghostty, etc.)
./run install

# 3. Install brew packages
./run tools

# 4. First nix build + switch (replace "henry" with your hostname)
nix --extra-experimental-features 'nix-command flakes' build .#darwinConfigurations.henry.system
sudo ./result/sw/bin/darwin-rebuild switch --flake .

# 5. Subsequent switches
./run switch
```

## Day-to-day

```bash
./run switch    # apply nix-darwin + home-manager changes
./run install   # re-stow dotfiles (for configs not yet in nix)
./run tools     # update brew packages
./run clean     # remove stow symlinks
```

## What's managed by nix

- bat, btop (home-manager + catppuccin/nix theming)
- System config (nix-darwin)

## What's still stow + brew

- zsh, tmux, git, neovim, ghostty configs
- Everything in `files/Brewfile`
