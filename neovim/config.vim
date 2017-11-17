" Plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'rakr/vim-one'
Plug 'vim-airline/vim-airline'

Plug 'ntpeters/vim-better-whitespace'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()

" Some basic settings
set expandtab
set shiftwidth=4
set tabstop=4

set mouse=a

set number
set relativenumber
set splitbelow

set scrolloff=5

set listchars=tab:>-,trail:~,extends:>,precedes:<,space:·

set wildmode=longest,list,full

set termguicolors

set background=dark
colorscheme one

let g:one_allow_italics=1
let g:airline_powerline_fonts=1
let g:airline_theme='one'

" Space bindings
let mapleader=" "

" Open and reload init.vim
nnoremap <silent><leader>fed :edit $MYVIMRC<cr>
nnoremap <silent><leader>fer :source $MYVIMRC<cr>

" Save file
nnoremap <silent><leader>fs :write<cr>

" fzf
nnoremap ; :Buffers<cr>
nnoremap <silent><leader>ff :Files<cr>
nnoremap <silent><leader>r :Tags<cr>
nnoremap <silent><leader>fg :GFiles<cr>

" Clipboard operations
nnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap <leader>y "+y
vnoremap <leader>y "+y
" Keep selection while indenting
vnoremap < <gv
vnoremap > >gv

" Clear search highlighting
nnoremap <silent><leader><cr> :nohl<cr>

" Toggle whitespace
nnoremap <silent><leader>tw :set list!<cr>

" Quitting
nnoremap <leader>qq :q<cr>
nnoremap <leader>qa :qa<cr>
nnoremap <leader>qw :wq<cr>

" Alt+[hjkl] to navigate through windows
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
inoremap <A-h> <Esc><C-w>h
inoremap <A-j> <Esc><C-w>j
inoremap <A-k> <Esc><C-w>k
inoremap <A-l> <Esc><C-w>l
vnoremap <A-h> <C-w>h
vnoremap <A-j> <C-w>j
vnoremap <A-k> <C-w>k
vnoremap <A-l> <C-w>l

" Terminal
nnoremap <silent><leader>' :call ToggleTerminal(5)<cr>

" Allow hitting <Esc> to switch to normal mode
tnoremap <Esc> <C-\><C-n>

" Alt+[hjkl] to navigate through windows in terminal mode
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

" Switch to insert mode when enering terminal pane
autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert

" Go to the last cursor location when a file is opened
au BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") && &filetype != "gitcommit" |
        \ execute("normal `\"") |
    \ endif

let g:term_buf = 0
let g:term_win = 0

function! ToggleTerminal(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction
