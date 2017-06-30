" Theme
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
set listchars=tab:>-,trail:~,extends:>,precedes:<

" Escape insert mode easily
inoremap fd <Esc>
set timeoutlen=300

" Other mappings
nnoremap fs :w<Cr>
nnoremap fq :q<Cr>

" Restore cursor position between sessions
au BufWinLeave * mkview
au VimEnter * silent loadview
