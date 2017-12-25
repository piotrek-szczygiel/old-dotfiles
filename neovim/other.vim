" Other vim configuration

" Ripgrep command
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)


" Restore last cursor position
augroup RememberCursorPosition
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
    \|  exe "normal! g`\""
    \|endif
  autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])
augroup END


" Change cursor shape in Vim8
if !has('nvim')
  let &t_SI = "\<Esc>[6 q"
  let &t_SR = "\<Esc>[4 q"
  let &t_EI = "\<Esc>[2 q"
endif


" Create undo directory for Vim8
if !has('nvim')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
endif

" Neovim terminal
if has('nvim')
  augroup TerminalGroup
    autocmd BufWinEnter,WinEnter term://* startinsert
    autocmd BufLeave term://* stopinsert
  augroup END

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
elseif v:version >= 800
  set termsize=7x0
endif

" vim: fdm=marker ts=2 sts=2 sw=2 expandtab
