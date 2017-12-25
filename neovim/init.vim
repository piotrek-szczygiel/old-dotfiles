" szczygi's Vim8/NeoVim configuration

set encoding=utf-8
scriptencoding utf-8

" Setup Vim-Plug
source ~/.dotfiles/neovim/plug_setup.vim

" Setup keybindings
source ~/.dotfiles/neovim/keybindings.vim

" Load other vim utilities
source ~/.dotfiles/neovim/other.vim


" Vim configuration
set background=dark
set colorcolumn=80
set concealcursor=niv
set conceallevel=2
set expandtab
set hidden
set ignorecase
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:·
set mouse=a
set nobackup
set noequalalways
set noswapfile
set nowrap
set nowritebackup
set number
set scrolloff=5
set shiftwidth=2
set sidescroll=1
set smartcase
set softtabstop=2
set splitbelow
set tabstop=2
set termguicolors
set wildmenu
set undofile
set wildmode=longest,list,full

colorscheme onedark

" vim: fdm=marker ts=2 sts=2 sw=2 expandtab
