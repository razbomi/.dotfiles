# My dot files

First install

```
$ curl -sS https://raw.githubusercontent.com/razbomi/.dotfiles/master/install.sh | zsh
```

Install updates after a change

```
$ cd ~/.dotfiles
$ ./install.sh
```

Developing loacally

```
$ INSTALL_DIR=../tmp ./install.sh
```

TODO: testing

## NeoVim
- Guide - https://github.com/nanotee/nvim-lua-guide
- Plugins - https://github.com/wbthomason/packer.nvim#bootstrapping

## Fonts
Automate the brew installs

```
# iterm -> setting -> profiles -> text
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
```

Automate the git clones
```
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
