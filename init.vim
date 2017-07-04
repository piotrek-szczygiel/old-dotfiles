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

" Show whitespace
set list
set listchars=tab:>-,trail:~,extends:>,precedes:<

" Scroll margin
set scrolloff=5

" Wild menu bash-like
set wildmode=longest,list,full
set wildmenu

" 256 colors
set termguicolors

" Day/night theme settings
if g:local_session
    set background=dark
else
    set background=ligh
endif

" Use different cursor shapes for different modes
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" Set leader key
let mapleader=" "

" Save file
nnoremap <Leader>fs :w<Cr>

" Save file as root
nnoremap <Leader>sw :w !sudo tee > /dev/null %<Cr>

" Open neovim configuration
nnoremap <Leader>fed :edit ~/.dotfiles/init.vim<Cr>

" Reload neovim configuration
nnoremap <Leader>fer :source $MYVIMRC<Cr>

" Close neovim
nnoremap <Leader>qq :qa<Cr>

" Close current buffer
nnoremap <Leader>qw :q<Cr>

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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Syntax checking
Plug 'w0rp/ale'

" Other
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'zhou13/vim-easyescape'

call plug#end()

" Airline configuration
let g:airline_powerline_fonts=1
let g:airline_theme='gruvbox'

" Ale configuration
let g:airline#extensions#ale#enabled=1
let g:ale_sign_column_always=1
let g:ale_sign_error='✗✗'
let g:ale_sign_warning='∆∆'

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

" Easyescape configuration
let g:easyescape_chars = { "f": 1, "d": 1 }
let g:easyescape_timeout = 100
cnoremap fd <ESC>
cnoremap df <ESC>
