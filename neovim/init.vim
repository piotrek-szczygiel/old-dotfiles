" szczygi's NeoVim configuration
scriptencoding utf-8

source ~/.dotfiles/neovim/plug_setup.vim
source ~/.dotfiles/neovim/plugins.vim
source ~/.dotfiles/neovim/keybindings.vim
source ~/.dotfiles/neovim/other.vim

set background=dark
set cinoptions+=L0
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
set relativenumber
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

" Fallback to desert if gruvbox isn't installed yet
try
  colorscheme gruvbox
catch
  set notermguicolors
  colorscheme desert
endtry

" vim: ts=2 sts=2 sw=2 expandtab
