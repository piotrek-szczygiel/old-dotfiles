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
nnoremap <Leader>fW :w !sudo tee > /dev/null %<Cr>

" Other mappings
nnoremap <Leader>fs :w<Cr>
nnoremap <Leader>qq :q<Cr>

" Restore cursor position between sessions
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
