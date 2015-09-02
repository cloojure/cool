
syntax enable
colorscheme desert
" colorscheme slate
" colorscheme default

" DEMO: This syntax works
if (has("gui_running"))
" echo "Found gui_running... \n"
" sleep 1
endif

" Note: User-defined commands must begin with a capital letter 
 
" Window shape commands
:command! Wl set columns=250        " Width large
:command! Wm set columns=130        " Width medium
:command! Ws set columns=60         " Width small
:command! Ll set lines=99           " Lines large
:command! Lm set lines=60           " Lines medium
:command! Ls set lines=40           " Lines small

" Font options
:command! Fll set guifont=Monospace\ 14     " Font large-large
:command! Fl  set guifont=Monospace\ 12     " Font large
:command! Fm  set guifont=Monospace\ 10     " Font medium
:command! Fs  set guifont=Monospace\ 9      " Font small

" Default size/shape
function! ConfigStd()
  set columns=130
  set lines=60
  set guifont=Monospace\ 10
endfunction
call ConfigStd()

" Define an easy way to maximize the window (Vertical bar '|' concats 2 commands on one line. It can
" also be done with a crtl-v/vrtl-j combination)
:command! WW set columns=250 lines=99
:command! Ww set columns=120 lines=60

" This function is used to swap the orientation of 2 windows (eg left/right), while keeping the
" cursor in the same pane where it started (eg left pane).
function! SwapWindows()
  " User-defined functions must begin with a capital letter 
  wincmd r      " rotate windows
  wincmd w      " move cursor to 
endfunction
:command! SS call SwapWindows()

" match index is 0-based (C-style);  no match = -1
if (match( system("uname -a"), "Linux" ) > -1)
  set guifont=Monospace\ 10             " default => Linux (27 in. LG monitor)
" set guifont=Liberation\ Mono\ 10      " alternative for Fedora
elseif (match( system("uname -a"), "Darwin" ) > -1)
  echo "Found Darwin, setting guifont for mac... \n"
  sleep 1
  set guifont=Courier\ New:h16
endif

set guioptions-=r  guioptions-=L  guioptions+=l

" Set columns wide if in "diff" mode
if &diff
  set columns=240
endif

