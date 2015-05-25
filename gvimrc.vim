
syntax enable
colorscheme desert
" colorscheme slate
" colorscheme default

" Font options
:command! Fll set guifont=Monospace\ 14
:command! Fl  set guifont=Monospace\ 12
:command! Fm  set guifont=Monospace\ 10
:command! Fs  set guifont=Monospace\ 9

:command! FF  set guifont=Monospace\ 12
:command! FG  set guifont=Monospace\ 14

" Default size/shape
function! ConfigStd()
  set columns=120
  set lines=60
  set guifont=Monospace\ 10
endfunction
call ConfigStd()
:command! CC call ConfigStd()

" match index is 0-based (C-style);  no match = -1
if match( system("uname -a"), "Linux" ) > -1
  set guifont=Monospace\ 10             " default => Linux (27 in. LG monitor)
" set guifont=Liberation\ Mono\ 10      " alternative for Fedora
elseif match( system("uname -a"), "Darwin" ) > -1
  echo "Found Darwin, setting guifont for mac... \n"
  sleep 1
  set guifont=Courier\ New:h16
endif

set guioptions-=r  guioptions-=L  guioptions+=l

" Window shape commands/functions
:command! Wl set columns=240        " Width large
:command! Wm set columns=120        " Width medium
:command! Ws set columns=60         " Width small
:command! Ll set lines=99           " Lines large
:command! Lm set lines=60           " Lines medium
:command! Ls set lines=40           " Lines small

" Set columns wide if in "diff" mode
if &diff
  set columns=240
endif

