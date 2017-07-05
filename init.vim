filetype plugin indent on

call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'easymotion/vim-easymotion'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline-themes'
Plug 'zhou13/vim-easyescape'

call plug#end()

colorscheme onedark
let mapleader=" "
set background=dark
set expandtab
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
set ignorecase
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set number
set relativenumber
set scrolloff=7
set shiftwidth=4
set smartcase
set tabstop=4
set termguicolors
set wildmenu
set wildmode=longest,list,full

if &diff
    nnoremap q :qa<Cr>
    set norelativenumber
endif

let g:airline_theme='onedark'
let g:airline_powerline_fonts=1

let g:easyescape_chars = { "d": 1, "f": 1 }
let g:easyescape_timeout = 100
cnoremap df <ESC>
cnoremap fd <ESC>

nnoremap <Leader><Cr> :nohl<Cr>
nnoremap <Leader>fed :edit ~/.dotfiles/init.vim<Cr>
nnoremap <Leader>fer :source $MYVIMRC<Cr>
nnoremap <Leader>ff :Files<Cr>
nnoremap <Leader>fS :w !sudo tee > /dev/null %<Cr>
nnoremap <Leader>fs :w<Cr>
nnoremap <Leader>gb :Gblame<Cr>
nnoremap <Leader>gc :Gcommit<Cr>
nnoremap <Leader>gd :Gdiff<Cr>
nnoremap <Leader>gl :Gpull<Cr>
nnoremap <Leader>gp :Gpush<Cr>
nnoremap <Leader>gs :Gstatus<Cr>
nnoremap <Leader>is :set expandtab<Cr>
nnoremap <Leader>it :set noexpandtab<Cr>
nnoremap <Leader>iw :call IndentationWidth()<Cr>
nnoremap <Leader>pf :GFiles<Cr>
nnoremap <Leader>qq :qa<Cr>
nnoremap <Leader>qw :q<Cr>
nnoremap <Leader>sf :Lines<Cr>
nnoremap <Leader>ss :BLines<Cr>
nnoremap <Leader>tb :call ToggleBackground()<Cr>
nnoremap <Leader>ti :call ToggleIndentation()<Cr>
nnoremap <Leader>tw :call ToggleShowWhitespace()<Cr>
nnoremap <Leader>uw :%s/\s\+$//e<Cr>
vnoremap <Leader>us :sort i<Cr>

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
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

