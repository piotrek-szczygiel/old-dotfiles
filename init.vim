" Color scheme
colorscheme desert

" Indenting
filetype plugin indent on

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

" Use different cursor shapes for different modes
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor

" Escape insert mode easily
inoremap fd <Esc>
set timeoutlen=500

" Set map leader
let mapleader=" "

" Allow saving of files as sudo when I forgot to start vim using sudo.
nnoremap <Leader>sw :w !sudo tee > /dev/null %<Cr>

" Other mappings
" Save file
nnoremap <Leader>fs :w<Cr>

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

" If neovim is launched on remote machine (through SSH)
" this value will equal false
let g:local_session = ($SSH_CLIENT == "")

" Launch plugins only if on local machine
if g:local_session
    call plug#begin('~/.local/share/nvim/plugged')

    Plug 'airblade/vim-gitgutter'

    Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'

    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    Plug 'tpope/vim-fugitive'

    Plug 'zchee/deoplete-jedi'

    call plug#end()

    " Plugin configuration
    " deoplete
    call deoplete#enable()

    let g:tern_request_timeout = 1
    " This do disable full signature type on autocomplete
    let g:tern_show_signature_in_pum = '0'

    " fzf
    nnoremap <Leader>ff :Files<Cr>
    nnoremap <Leader>pf :GFiles<Cr>

    " vim-fugitive
    nnoremap <Leader>gb :Gblame<Cr>
    nnoremap <Leader>gc :Gcommit<Cr>
    nnoremap <Leader>gd :Gdiff<Cr>
    nnoremap <Leader>ge :Gedit<Cr>
    nnoremap <Leader>gg :Ggrep<Cr>
    nnoremap <Leader>gl :Glog<Cr>
    nnoremap <Leader>gm :Gmove<Cr>
    nnoremap <Leader>gr :Gread<Cr>
    nnoremap <Leader>gw :Gwrite<Cr>
    nnoremap <Leader>gs :Gstatus<Cr>
endif
