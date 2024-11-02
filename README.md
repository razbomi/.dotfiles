# My dot files

Add new files

```
$ cd ~/.dotfiles
$ ./run.sh install
```

## Fonts

TODO: Automate brew installs

```
# iterm -> setting -> profiles -> text
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
brew install mise
```

## Promt

TODO: Automate installs via git
```
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Distros

TODO: Try different vim Distros
- https://github.com/NormalNvim/NormalNvim
- https://github.com/nvim-lua/kickstart.nvim

```
# to install
git clone https://github.com/NvChad/NvChad   ~/.config/nvchad -d1
git clone https://github.com/LazyVim/starter ~/.config/lazyvim -d1

# to run:
NVIM_APPNAME=nvchad   nvim
NVIM_APPNAME=lazynvim nvim
```
