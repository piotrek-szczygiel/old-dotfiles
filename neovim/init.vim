" Install Plugin manager if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.local/share/nvim/plugged')

" List of plugins
Plug 'colepeters/spacemacs-theme.vim'
Plug 'easymotion/vim-easymotion'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Colorscheme
set termguicolors
set background=dark
colorscheme spacemacs-theme

" Line numbering
set number
set relativenumber

" Indentation
set expandtab
set shiftwidth=2
set softtabstop=2
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:·

" Smart searching
set ignorecase
set smartcase

" Smart command completion
set wildmode=longest,list,full

" Airline configuration
let g:airline_powerline_fonts = 1
let g:airline_theme = 'base16_google'
let g:airline#extensions#tabline#enabled = 1

" Spacemacs keybindings for consistency
let mapleader = " "
nnoremap <leader>fed :e $MYVIMRC<cr>
nnoremap <leader>feR :so $MYVIMRC<cr>
nnoremap <leader>fs :w<cr>
nnoremap <leader>qf :qa<cr>
nnoremap <leader>sc :nohl<cr>
nnoremap <leader>tw :set list!<cr>
