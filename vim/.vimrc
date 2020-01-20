set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'airblade/vim-rooter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'hashivim/vim-terraform'
Plugin 'leafgarland/typescript-vim.git'
Plugin 'morhetz/gruvbox'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'townk/vim-autoclose'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-ragtag'
Plugin 'tpope/vim-rails'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Maybe some of the above are a bit too much, please review
"Plugin 'sheerun/vim-polyglot'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ===================
" Generic (https://github.com/rowanu/.dotfiles/)
" ===================
set number          " Show line nubmers
set laststatus=2    " Show the status line all the time
set tabstop=2       " Global tab width.
set shiftwidth=2    " And again, related.
set expandtab       " Use spaces instead of tabs
set lazyredraw      " Speedy up the terminal
set modeline
set background=dark

syntax enable
colorscheme gruvbox

" ===================
" Git
" ===================
map <leader>gs :Gstatus<cr>
map <leader>gb :Gblame<cr>
map <leader>gc :Gcommit<cr>
map <leader>gp :!git push<cr>

" ===================
" NertTree
" ===================
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ===================
" Syntatic (https://github.com/vim-syntastic/syntastic)
" ===================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" The defaults slow down vim on file open
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
nmap <leader>ln :lnext<cr>
nmap <leader>lp :lprevious<cr>
let g:syntastic_enable_signs    = 1
let g:syntastic_error_symbol    = '✗'
let g:syntastic_warning_symbol  = '⚠'
let g:syntastic_style_error_symbol    = '✗'
let g:syntastic_style_warning_symbol  = '⚠'
let g:syntastic_loc_list_height = 5

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_ruby_checkers       = ['rubocop']

" ===================
" vim-javacript
" ===================
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1  = "inc""

" ===================
" Vim airline
" ===================
let g:airline#extensions#tabline#enabled = 1
"let g:airline_powerline_fonts = 1
let g:airline_symbols_ascii = 1
let g:airline_theme = 'gruvbox'
