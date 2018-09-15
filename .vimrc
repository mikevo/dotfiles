set mouse=a
set number
set relativenumber
set cursorline

syntax enable
colorscheme gruvbox
set background=dark

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')


" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/editorconfig/editorconfig-vim
Plug 'editorconfig/editorconfig-vim'


Plug 'morhetz/gruvbox'
Plug 'chriskempson/base16-vim'

" Utility
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'ervandew/supertab'

" Initialize plugin system
call plug#end()
