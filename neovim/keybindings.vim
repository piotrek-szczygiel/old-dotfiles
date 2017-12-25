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

nnoremap <leader>fec :PlugClean<cr>
nnoremap <leader>fed :e $MYVIMRC<cr>
nnoremap <leader>fei :PlugInstall<cr>
nnoremap <leader>fek :e ~/.dotfiles/neovim/keybindings.vim<cr>
nnoremap <leader>feo :e ~/.dotfiles/neovim/other.vim<cr>
nnoremap <leader>fep :e ~/.dotfiles/neovim/plugins.vim<cr>
nnoremap <leader>feP :e ~/.dotfiles/neovim/plug_setup.vim<cr>
nnoremap <leader>fer :source $MYVIMRC<cr>
nnoremap <leader>feu :PlugUpdate<cr>
nnoremap <leader>fs :w<cr>

nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>
nnoremap <leader><tab> :b#<cr>

nnoremap <leader>tw :set list!<cr>
nnoremap <leader>tt :let &background =
  \ ( &background == "dark"? "light" : "dark" )<cr>

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
nnoremap <leader>fg :GFiles<cr>
nnoremap <leader>ss :BLines<cr>

nnoremap <leader>g :TagbarToggle<cr>
nnoremap <leader>tg :Tags<cr>

nnoremap <leader>u :UndotreeToggle<cr>

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

nnoremap <leader>wd <C-w>q
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
nnoremap <leader>wo :ZoomWinTabToggle<cr>

nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
vnoremap <A-h> <C-w>h
vnoremap <A-j> <C-w>j
vnoremap <A-k> <C-w>k
vnoremap <A-l> <C-w>l
inoremap <A-h> <Esc><C-w>h
inoremap <A-j> <Esc><C-w>j
inoremap <A-k> <Esc><C-w>k
inoremap <A-l> <Esc><C-w>l

if v:version >= 800
  tnoremap <Esc> <C-\><C-n>
  tnoremap <A-h> <C-\><C-n><C-w>h
  tnoremap <A-j> <C-\><C-n><C-w>j
  tnoremap <A-k> <C-\><C-n><C-w>k
  tnoremap <A-l> <C-\><C-n><C-w>l
endif

if has('nvim')
  nnoremap <leader>' :call ToggleTerminal()<cr>
  nnoremap <leader>r :call RunCommandOnCurrentFile('run')<cr>
else
  nnoremap <leader>' :terminal<cr>
  nnoremap <leader>r :terminal run %<cr>
endif

" vim: fdm=marker ts=2 sts=2 sw=2 expandtab
