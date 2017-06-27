call plug#begin('~/.local/share/nvim/plugged')

Plug 'meitham/vim-spacemacs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'godlygeek/tabular'
Plug 'zhou13/vim-easyescape'

call plug#end()

let mapleader=" "
let maplocalleader=","
set relativenumber

filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

let g:easyescape_chars = { "f": 1, "d": 1 }
let g:easyescape_timeout = 100
cnoremap fd <ESC>
cnoremap df <ESC>

