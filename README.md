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

## Vim Plugins

Install vim plgins using a plugin manager

* [Vundle](https://github.com/VundleVim/Vundle.vim.git) `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
* `:PluginInstall`

Installed

* [NERDTree](https://github.com/scrooloose/nerdtree)
* [NERDComenter](https://github.com/scrooloose/nerdcommenter)

## Vim Browser

Keyboard shortcuts in the spirit of `vi` for Chrome

* https://github.com/philc/vimium/blob/master/README.md

## Cheatsheets

* https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet

## Vim goldfish help

* open a file `:e <filename>`
* open a dir `:Ex <directory>`
* open new `:enew` 

* help vundle `:help vundle`
* help nerdtree `:help nerdtree`
