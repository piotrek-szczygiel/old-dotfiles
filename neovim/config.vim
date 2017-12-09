" Plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'joshdick/onedark.vim'

Plug 'vim-airline/vim-airline'

Plug 'ntpeters/vim-better-whitespace'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'

Plug 'sheerun/vim-polyglot'

Plug 'scrooloose/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

call  plug#end()

" Some basic settings
set expandtab
set shiftwidth=4
set tabstop=4

set mouse=a

set number
set relativenumber

set hidden

set autochdir

set ignorecase
set smartcase

set splitbelow

set scrolloff=5

set listchars=tab:>-,trail:~,extends:>,precedes:<,space:·

set wildmode=longest,list,full

set termguicolors

let g:onedark_terminal_italics=1

let g:airline_powerline_fonts=1


let g:ranger_replace_netrw=1
let g:ranger_map_keys=0

colorscheme onedark

" Transparent background
"highlight Normal guibg=NONE ctermbg=NONE

" Reverse colors on selection
"highlight clear Visual
"highlight Visual cterm=reverse ctermbg=Black

" Space bindings
let mapleader=" "

" Open and reload init.vim
nnoremap <silent><leader>fed :edit $MYVIMRC<cr>
nnoremap <silent><leader>fer :source $MYVIMRC<cr>

" Save file
nnoremap <silent><leader>fs :write<cr>

" FZF
nnoremap ; :Buffers<cr>
nnoremap <silent><leader>ff :Files<cr>
nnoremap <silent><leader>r :Tags<cr>
nnoremap <silent><leader>fg :GFiles<cr>

" Ranger
nnoremap <silent><leader>fr :Ranger<cr>

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
nnoremap <silent>q :q<cr>
nnoremap <silent>QQ :qa!<cr>
nnoremap <silent><leader>qq :q<cr>
nnoremap <silent><leader>qa :qa<cr>
nnoremap <silent><leader>qw :wq<cr>

" Moving through buffers
nnoremap <silent><tab> :b#<cr>
nnoremap <silent><leader>bd :bd<cr>
nnoremap <silent><leader>bn :bn<cr>
nnoremap <silent><leader>bp :bp<cr>

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

" Don't resize other windows after closing a split
set noequalalways

" Resizing windows
nnoremap <silent><A-J> :resize -1<cr>
nnoremap <silent><A-K> :resize +1<cr>

" Terminal
nnoremap <silent><leader>' :call ToggleTerminal()<cr>

nnoremap <silent><leader>r :call RunCommandOnCurrentFile("run")<cr>

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

function! ToggleTerminal()
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize 7"
        try
            exec "buffer " . g:term_buf
        catch
            call termopen("fish", {"detach": 0})
            let g:term_buf = bufnr("")
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

let g:cmd_win = 0

function! RunCommand(command)
    if win_gotoid(g:cmd_win)
        quit!
    endif

    topleft new
    exec "resize 5"
    call termopen(a:command)
    startinsert!
    let g:cmd_win = win_getid()
endfunction

function! RunCommandOnCurrentFile(command)
    let file = expand("%:p")
    call RunCommand(a:command . " " . file)
endfunction
