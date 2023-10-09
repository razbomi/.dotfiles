# My dot files

Add new files

```
$ cd ~/.dotfiles
$ ./run.sh
```

## Fonts

TODO: Automate brew installs

```
# iterm -> setting -> profiles -> text
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
```

## Promt

TODO: Automate installs via git
```
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
