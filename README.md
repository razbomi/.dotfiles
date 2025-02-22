## .dotfiles

Currently arm mac only (brew paths are different).

### Fresh install

From `$HOME` folder.

```
$ git clone git@github.com:razbomi/.dotfiles.git
$ cd ~/.dotfiles
$ ./run.sh tools

```

Subsequently `tools` will upgrade.

### Add new files

Link new config from `files` folder

```
$ cd ~/.dotfiles
$ ./run.sh install
```

### NVim Distros

HOPES: Try different nvim distros
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
