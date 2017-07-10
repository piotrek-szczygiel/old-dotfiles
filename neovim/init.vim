filetype plugin indent on

" List of plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'easymotion/vim-easymotion'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Don't let colorscheme remove trailing whitespace highlighting
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

try
    colorscheme onedark
catch
endtry

let mapleader=","

set background=dark
set expandtab
" Change cursor shapes in terminal
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
set ignorecase
" Whitespace characters
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set number
set relativenumber
set scrolloff=7
set shiftwidth=4
set smartcase
set splitbelow
set tabstop=4
set termguicolors
set wildmenu
set wildmode=longest,list,full

" If Neovim is launched in diff mode - exit with single q press,
" don't use relative numbers
if &diff
    nnoremap q :qa<Cr>
    set norelativenumber
endif

" Airline configuration
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1

" Keybindings
nnoremap <Leader>l :nohl<Cr>

nnoremap <Leader>f :Files<Cr>
nnoremap <Leader>w :w<Cr>

nnoremap <Leader>is :set expandtab<Cr>
nnoremap <Leader>it :set noexpandtab<Cr>
nnoremap <Leader>iw :call IndentationWidth()<Cr>
nnoremap <Leader>i24 :call Spaces2to4()<Cr>
nnoremap <Leader>i42 :call Spaces4to2()<Cr>

nnoremap <Leader>q :wq<Cr>

nnoremap <Leader>S :Lines<Cr>
nnoremap <Leader>s :BLines<Cr>

nnoremap <Leader>ti :call ToggleIndentation()<Cr>
nnoremap <Leader>tw :call ToggleShowWhitespace()<Cr>

nnoremap <Leader>uw :call StripTrailingWhitespace()<Cr>
vnoremap <Leader>us :sort i<Cr>

" Terminal
nnoremap <Leader>t :split<Cr>:resize 10<Cr>:terminal<Cr>
tnoremap <Esc> <C-\><C-N>

" Move between all windows with Alt+hjkl
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Trailing whitespace highlighting
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

" Restoring last cursor position
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Various functions that are mapped to keys above
function! IndentationWidth()
    call inputsave()
    let indent_width = input('Enter indentation width: ')
    call inputrestore()
    let &shiftwidth=indent_width
    let &tabstop=indent_width
endfunction

function! ToggleIndentation()
    if &expandtab
        set noexpandtab
        echom "Using TABS"
    else
        set expandtab
        echom "Using " . &shiftwidth . " SPACES"
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

function! Spaces2to4()
    " 2 spaces -> TAB
    set tabstop=2
    set softtabstop=2
    set noexpandtab
    retab!

    " TAB -> 4 spaces
    set tabstop=4
    set softtabstop=4
    set expandtab
    retab

    set shiftwidth=4
    echom "Converted 2 spaces to 4"
endfunction

function! Spaces4to2()
    " 4 spaces -> TAB
    set tabstop=4
    set softtabstop=4
    set noexpandtab
    retab!

    " TAB -> 2 spaces
    set tabstop=2
    set softtabstop=2
    set expandtab
    retab

    set shiftwidth=2
    echom "Converted 4 spaces to 2"
endfunction

function! StripTrailingWhitespace()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
    echom "Stripped trailing whitespace"
endfunction
