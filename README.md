# .dotfiles

macOS (arm) system config. nix-darwin + home-manager, brew packages declared in nix.

## Structure

- `flake.nix` — entry point, wires nix-darwin + home-manager + catppuccin
- `hosts/darwin.nix` — system settings, nix gc, `homebrew` block (brews + casks, `zap` cleanup)
- `home/*.nix` — user config, one module per tool, imported from `home.nix`
- `files/` — raw configs that aren't nix modules
  - `nvchad/` — neovim config, symlinked via `mkOutOfStoreSymlink` (editable in-place)
  - `zsh/` — alias files, symlinked to `~/.config/zsh/`
  - `fdignore` — fd/fzf ignore patterns

## Usage

- `ns` — apply config changes
- `nu` — update flake inputs + apply

## Bootstrap

```bash
# requires Xcode CLT (xcode-select --install)
curl -fsSL https://raw.githubusercontent.com/razbomi/.dotfiles/master/run | bash
```

New machines need an entry in `flake.nix` `darwinConfigurations`.
