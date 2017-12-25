" Key bindings

let g:mapleader=' '

nnoremap q :q<cr>
nnoremap Q :qa<cr>
nnoremap <leader>qw :wq<cr>

vnoremap < <gv
vnoremap > >gv

" Copy, Paste from system clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap <leader>y "+y
vnoremap <leader>y "+y

nnoremap <leader>fs :w<cr>
nnoremap <leader>fed :e $MYVIMRC<cr>
nnoremap <leader>feo :e ~/.dotfiles/neovim/other.vim<cr>
nnoremap <leader>fep :e ~/.dotfiles/neovim/plugins.vim<cr>
nnoremap <leader>feP :e ~/.dotfiles/neovim/plug_setup.vim<cr>
nnoremap <leader>fek :e ~/.dotfiles/neovim/keybindings.vim<cr>
nnoremap <leader>fer :source $MYVIMRC<cr>

nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>
nnoremap <leader><tab> :b#<cr>

nnoremap <leader>tw :set list!<cr>

" Convert indentation
nnoremap <leader>i24 :set ts=2 sts=2 noet<cr>:retab!<cr>
  \:set ts=4 sts=4 et<cr>:retab!<cr>
nnoremap <leader>i42 :set ts=4 sts=4 noet<cr>:retab!<cr>
  \:set ts=2 sts=2 et<cr>:retab!<cr>
nnoremap <leader>i2t :set ts=2 sts=2 noet<cr>:retab!<cr>
nnoremap <leader>i4t :set ts=4 sts=4 noet<cr>:retab!<cr>
nnoremap <leader>it2 :set ts=2 sts=2 et<cr>:retab!<cr>
nnoremap <leader>it4 :set ts=4 sts=4 et<cr>:retab!<cr>

nnoremap <leader>bb :Buffers<cr>
nnoremap <leader>ff :Files<cr>
nnoremap <leader>gf :GFiles<cr>
nnoremap <leader>ss :BLines<cr>

nnoremap <leader>tg :TagbarToggle<cr>
nnoremap <leader>tt :Tags<cr>

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

nnoremap <silent> <C-k> <C-\><C-n><C-w>k
nnoremap <silent> <C-j> <C-\><C-n><C-w>j
nnoremap <silent> <C-h> <C-\><C-n><C-w>h
nnoremap <silent> <C-l> <C-\><C-n><C-w>l

tnoremap <Esc> <C-\><C-n>
tnoremap <silent> <C-k> <C-\><C-n><C-w>k
tnoremap <silent> <C-j> <C-\><C-n><C-w>j
tnoremap <silent> <C-h> <C-\><C-n><C-w>h
tnoremap <silent> <C-l> <C-\><C-n><C-w>l

if has('nvim')
  nnoremap <leader>' :call ToggleTerminal()<cr>
  nnoremap <leader>r :call RunCommandOnCurrentFile('run')<cr>
else
  nnoremap <leader>' :terminal<cr>
  nnoremap <leader>r :terminal run %<cr>
endif

" vim: fdm=marker ts=2 sts=2 sw=2 expandtab
