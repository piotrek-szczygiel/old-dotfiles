" Neovim configuration

" Setup dein  ---------------------------------------------------------------{{{
if(!isdirectory(expand('$HOME/.local/share/dein/repos/github.com/Shougo/dein.vim')))
    echo 'Installing dein...'
    call system(expand('mkdir -p $HOME/.local/share/dein/repos/github.com'))
    call system(expand('git clone https://github.com/Shougo/dein.vim $HOME/.local/share/dein/repos/github.com/Shougo/dein.vim'))
endif

set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(expand('$HOME/.local/share/dein'))
    call dein#begin(expand('$HOME/.local/share/dein'))
    call dein#add(expand('$HOME/.local/share/dein/repos/github.com/Shougo/dein.vim'))

    call dein#add('Shougo/denite.nvim')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/neosnippet-snippets')

    call dein#add('w0rp/ale')

    call dein#add('ntpeters/vim-better-whitespace')
    call dein#add('sheerun/vim-polyglot')
    call dein#add('scrooloose/nerdcommenter')
    call dein#add('tpope/vim-surround')
    call dein#add('tpope/vim-sleuth')

    call dein#add('majutsushi/tagbar')
    call dein#add('vim-airline/vim-airline')
    call dein#add('morhetz/gruvbox')
    call dein#add('mhinz/vim-startify')

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
" }}}
" Plugin configuration  -----------------------------------------------------{{{
let g:deoplete#enable_at_startup = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
"let g:airline_symbols =
"\{  'space': ' ', 'paste': 'PASTE', 'maxlinenr': ' ', 'notexists': 'Ɇ',
"\   'linenr': '☰ ', 'readonly': '', 'spell': 'SPELL', 'modified': '+',
"\   'keymap': 'Keymap:', 'crypt': '🔒', 'branch': '', 'whitespace': '☲' }

let g:gruvbox_italic = 1
colorscheme gruvbox

let g:startify_list_order = ['bookmarks', 'sessions', 'files', 'dir',
  \ 'commands']
let g:startify_bookmarks = [{'n': '~/.dotfiles/neovim/config.vim'},
  \ {'t': '~/.dotfiles/tmux/tmux.conf.local'}]
" }}}
" Vim configuration  --------------------------------------------------------{{{
scriptencoding utf-8
set autochdir
set background=dark
set noequalalways
set expandtab
set foldmethod=marker
set hidden
set ignorecase
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:·
set mouse=a
set nostartofline
set number
set relativenumber
set scrolloff=5
set shiftwidth=4
set showmatch
set sidescrolloff=5
set smartcase
set splitbelow
set splitright
set tabstop=4
set termguicolors
set wildmode=longest,list,full
" }}}
" Terminal configuration  ---------------------------------------------------{{{
"augroup TerminalGroup
    "autocmd BufWinEnter,WinEnter term://* startinsert
    "autocmd BufLeave term://* stopinsert
"augroup END

" Toggle bottom terminal window
let g:term_buf = 0
let g:term_win = 0

function! ToggleTerminal()
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec 'resize 7'
        try
            exec 'buffer ' . g:term_buf
        catch
            call termopen($SHELL, {'detach': 0})
            let g:term_buf = bufnr('')
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

" Run command in top window
let g:cmd_win = 0

function! RunCommand(command)
    if win_gotoid(g:cmd_win)
        quit!
    endif

    topleft new
    exec 'resize 5'
    call termopen(a:command)
    startinsert!
    let g:cmd_win = win_getid()
endfunction

function! RunCommandOnCurrentFile(command)
    let l:file = expand('%:p')
    call RunCommand(a:command . ' ' . l:file)
endfunction
" }}}
" Keyboard bindings  --------------------------------------------------------{{{
vnoremap < <gv
vnoremap > >gv
nnoremap q :q<cr>
nnoremap <tab> :b#<cr>
" tagbar, file explorer

let g:mapleader = "\<space>"

nnoremap <leader><cr> :nohl<cr>
nnoremap <leader>bd :bd<cr>
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>
nnoremap <leader>fed :e $MYVIMRC<cr>
nnoremap <leader>fer :source $MYVIMRC<cr>
nnoremap <leader>fs :w<cr>
nnoremap <leader>qw :wq<cr>
nnoremap <leader>s :Startify<cr>
nnoremap <leader>tw :set list!<cr>

nnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap <leader>y "+y
vnoremap <leader>y "+y

tnoremap <esc> <c-\><c-n>
nnoremap <leader>' :call ToggleTerminal()<cr>
nnoremap <leader>r :call RunCommandOnCurrentFile("run")<cr>
" }}}
" Navigation  ---------------------------------------------------------------{{{
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
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
" }}}
" Other  --------------------------------------------------------------------{{{
augroup CursorRestoreGroup
    autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
        \ | exe "normal! g`\""
        \ | endif

    autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
augroup END
" }}}
