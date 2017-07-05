filetype plugin indent on

if &diff
    let g:diff_mode=1
else
    let g:diff_mode=0
endif

if empty($SSH_CLIENT)
    let g:normal_mode=1
    let g:ssh_mode=0
else
    let g:normal_mode=0
    let g:ssh_mode=1
endif

call plug#begin('~/.local/share/nvim/plugged')

Plug 'morhetz/gruvbox'

if g:normal_mode
    Plug 'bling/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'w0rp/ale'
    Plug 'othree/html5.vim'
    Plug 'othree/yajs.vim'
    Plug 'HerringtonDarkholme/yats.vim'
endif

if !g:diff_mode
    Plug 'easymotion/vim-easymotion'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'zhou13/vim-easyescape'
endif

call plug#end()

colorscheme gruvbox
set background=dark
set expandtab
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
set ignorecase
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set number
set relativenumber
set scrolloff=5
set shiftwidth=4
set smartcase
set tabstop=4
set termguicolors
set wildmenu
set wildmode=longest,list,full

if g:diff_mode
    nnoremap q :qa<Cr>
    set norelativenumber
endif

let mapleader=" "

let g:python_host_prog = $HOME . "/.virtualenvs/neovim2/bin/python"
let g:python3_host_prog = $HOME . "/.virtualenvs/neovim3/bin/python"

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1

let g:airline#extensions#ale#enabled=1
let g:ale_sign_column_always=1
let g:ale_sign_error='✗✗'
let g:ale_sign_warning='∆∆'

let g:easyescape_chars = { "f": 1, "d": 1 }
let g:easyescape_timeout = 100
cnoremap fd <ESC>
cnoremap df <ESC>

nnoremap <Leader><Cr> :nohl<Cr>
nnoremap <Leader>fS :w !sudo tee > /dev/null %<Cr>
nnoremap <Leader>fed :edit ~/.dotfiles/init.vim<Cr>
nnoremap <Leader>fer :source $MYVIMRC<Cr>
nnoremap <Leader>fs :w<Cr>
nnoremap <Leader>is :set expandtab<Cr>
nnoremap <Leader>it :set noexpandtab<Cr>
nnoremap <Leader>iw :call IndentationWidth()<Cr>
nnoremap <Leader>qq :qa<Cr>
nnoremap <Leader>qw :q<Cr>
nnoremap <Leader>tb :call ToggleBackground()<Cr>
nnoremap <Leader>ti :call ToggleIndentation()<Cr>
nnoremap <Leader>tw :call ToggleShowWhitespace()<Cr>
nnoremap <Leader>ws :StripWhitespace<Cr>
vnoremap <Leader>us :sort u<Cr>

if g:normal_mode
    nnoremap <Leader>ff :Files<Cr>
    nnoremap <Leader>pf :GFiles<Cr>
    nnoremap <Leader>gb :Gblame<Cr>
    nnoremap <Leader>gc :Gcommit<Cr>
    nnoremap <Leader>gd :Gdiff<Cr>
    nnoremap <Leader>gl :Gpull<Cr>
    nnoremap <Leader>gp :Gpush<Cr>
    nnoremap <Leader>gs :Gstatus<Cr>
endif

function! IndentationWidth()
    call inputsave()
    let indent_width = input('Enter indentation width: ')
    call inputrestore()
    let &shiftwidth=indent_width
    let &tabstop=indent_width
endfunction

function! ToggleBackground()
    if &background ==# "dark"
        set background=light
    else
        set background=dark
    endif
endfunction

function! ToggleIndentation()
    if &expandtab
        set noexpandtab
        echom "Using TABS"
    else
        set expandtab
        echom "Using SPACES"
    endif
endfunction

function! ToggleShowWhitespace()
    if &list
        set nolist
        echom "Hiding whitespace characters"
    else
        set list
        echom "Showing whitespace characters"
    endif
endfunction

