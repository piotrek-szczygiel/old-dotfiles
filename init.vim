if empty($SSH_CLIENT)
    let g:local_session=1
else
    let g:local_session=0
endif

filetype plugin indent on
set relativenumber
set number

" Tab is 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Case insensitive searching
set ignorecase
set smartcase

" Whitespace settings
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣

" Scroll margin
set scrolloff=5

" Wild menu bash-like
set wildmode=longest,list,full
set wildmenu

" Colors
set termguicolors
set background=dark

" Use different cursor shapes for different modes
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" Set leader key
let mapleader=" "

" Set how many spaces you want to enter every TAB press
function! IndentationWidth()
    call inputsave()
    let indent_width = input('Enter indentation width: ')
    call inputrestore()
    let &shiftwidth=indent_width
    let &tabstop=indent_width
endfunction

" Toggle between light and dark background
function! ToggleBackground()
    if &background ==# "dark"
        set background=light
    else
        set background=dark
    endif
endfunction

" Toggle between spaces and tabs
function! ToggleIndentation()
    if &expandtab
        set noexpandtab
        echom "Using TABS"
    else
        set expandtab
        echom "Using SPACES"
    endif
endfunction

" Toogle showing whitespace characters
function! ToggleShowWhitespace()
    if &list
        set nolist
        echom "Hiding whitespace characters"
    else
        set list
        echom "Showing whitespace characters"
    endif
endfunction

" Open neovim configuration
nnoremap <Leader>fed :edit ~/.dotfiles/init.vim<Cr>
" Reload neovim configuration
nnoremap <Leader>fer :source $MYVIMRC<Cr>
" Save current file
nnoremap <Leader>fs :w<Cr>
" Sudo save current file
nnoremap <Leader>fS :w !sudo tee > /dev/null %<Cr>
" Indentation - spaces
nnoremap <Leader>is :set expandtab<Cr>
" Indentation - tabs
nnoremap <Leader>it :set noexpandtab<Cr>
" Indentation - width
nnoremap <Leader>iw :call IndentationWidth()<Cr>
" Close all
nnoremap <Leader>qq :qa<Cr>
" Close current file
nnoremap <Leader>qw :q<Cr>
" Toggle indentation between tabs and spaces
nnoremap <Leader>ti :call ToggleIndentation()<Cr>
" Toggle background between light and dark
nnoremap <Leader>tb :call ToggleBackground()<Cr>
" Toggle showing whitespace
nnoremap <Leader>tw :call ToggleShowWhitespace()<Cr>
" Trailing whitespace stripping
nnoremap <Leader>ws :StripWhitespace<Cr>
" Utilities - sort selected lines
vnoremap <Leader>us :!sort -u<Cr>

" Restore cursor position between sessions
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Use python from virtualenvs
let g:python_host_prog = $HOME . "/.virtualenvs/neovim2/bin/python"
let g:python3_host_prog = $HOME . "/.virtualenvs/neovim3/bin/python"

" Plugins
call plug#begin('~/.local/share/nvim/plugged')

" airline
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Color schemes
Plug 'morhetz/gruvbox'

" Easy motion
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch-easymotion.vim'

" Fuzzy finder
if g:local_session
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'
endif

" Git
if g:local_session
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
endif

" Syntax checking
if g:local_session
    Plug 'w0rp/ale'
endif

" Syntax highlighting
Plug 'othree/html5.vim'
Plug 'othree/yajs.vim'
Plug 'HerringtonDarkholme/yats.vim'

" Other
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'zhou13/vim-easyescape'

call plug#end()

" Airline configuration
let g:airline_theme='gruvbox'
" Use powerline fonts only on local machine
if g:local_session
    let g:airline_powerline_fonts=1
endif

" Ale configuration
let g:airline#extensions#ale#enabled=1
let g:ale_sign_column_always=1
" Use fancy symbols only on local machine
if g:local_session
    let g:ale_sign_error='✗✗'
    let g:ale_sign_warning='∆∆'
endif

" Color scheme configuration
try
    colorscheme gruvbox
catch
endtry

" Easy motion configuration
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzyword#converter()],
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
nnoremap <Leader><Cr> :nohl<Cr>

" Easyescape configuration
let g:easyescape_chars = { "f": 1, "d": 1 }
let g:easyescape_timeout = 100
cnoremap fd <ESC>
cnoremap df <ESC>

" Fzf configuration
nnoremap <Leader>ff :Files<Cr>
nnoremap <Leader>pf :GFiles<Cr>

" Git configuration
nnoremap <Leader>gb :Gblame<Cr>
nnoremap <Leader>gc :Gcommit<Cr>
nnoremap <Leader>gd :Gdiff<Cr>
nnoremap <Leader>gl :Gpull<Cr>
nnoremap <Leader>gp :Gpush<Cr>
nnoremap <Leader>gs :Gstatus<Cr>

