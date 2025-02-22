# .dotfiles

Currently arm mac only (brew paths are different).

### Fresh install

Clone into the `$HOME` folder.


```
$ git clone git@github.com:razbomi/.dotfiles.git
$ cd ~/.dotfiles
$ ./run tools

```

Add to `files/Brewfile` for new deps.
Subsequent `./run tools` will upgrade.

### Add new config

Link config from `files` folder.
Unlink to uninstall using `./run clean`.


```
$ cd ~/.dotfiles
$ ./run install
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
