" Bootstrap Plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent execute '!curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall
endif

"call plug#begin()
call plug#begin('~/.config/nvim/plugged')

" Themes
Plug 'arcticicestudio/nord-vim'                     " https://github.com/arcticicestudio/nord-vim
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }  " https://github.com/folke/tokyonight.nvim
Plug 'morhetz/gruvbox'                              " https://github.com/morhetz/gruvbox
Plug 'tomasiser/vim-code-dark'                      " https://github.com/tomasiser/vim-code-dark

call plug#end()

"set termguicolors
"set background=dark

syntax enable
colorscheme gruvbox
