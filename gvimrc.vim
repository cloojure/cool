
" This is all in common.vim now
" syntax enable
" colorscheme desert
" colorscheme slate
" colorscheme default

" DEMO: This syntax works
if (has("gui_running"))
" echo "Found gui_running... \n"
" sleep 1
endif

" Note: User-defined commands must begin with a capital letter 
 
" Font options
command! Fs  set guifont=Ubuntu\ Mono\ 10     " Font small
command! Fm  set guifont=Ubuntu\ Mono\ 12     " Font medium
command! Fl  set guifont=Ubuntu\ Mono\ 14     " Font large
command! Fll set guifont=Ubuntu\ Mono\ 16     " Font large-large
command! FF  Fll
command! Laptop  Fll

" Window shape commands
command! Ls set lines=40           " Lines small
command! Lm set lines=60           " Lines medium
command! Ll set lines=99           " Lines large
command! Ws set columns=60         " Width small
command! Wm set columns=130        " Width medium
command! Wl set columns=250        " Width large

" Default size/shape
function! ConfigStd()
  set columns=130
  set lines=60
  set guifont=Ubuntu\ Mono\ 14
endfunction
call ConfigStd()

" Define an easy way to maximize the window (Vertical bar '|' concats 2 commands on one line. It can
" also be done with a crtl-v/vrtl-j combination)
command! WW set columns=250 lines=99

" match index is 0-based (C-style);  no match = -1
" if (match( system("uname -a"), "Linux" ) > -1)
"   set guifont=Monospace\ 10             " default => Linux (27 in. LG monitor)
"   set guifont=Liberation\ Mono\ 10      " alternative for Fedora
" endif
" elseif (match( system("uname -a"), "Darwin" ) > -1)
"   echo "Found Darwin, setting guifont for mac... \n"
"   sleep 1
"   set guifont=Courier\ New:h16
" endif

" This function is used to swap the orientation of 2 windows (eg left/right), while keeping the
" cursor in the same pane where it started (eg left pane).
function! SwapWindows()
  " User-defined functions must begin with a capital letter 
  wincmd r      " rotate windows
  wincmd w      " move cursor to 
endfunction
command! SS call SwapWindows()

set guioptions-=r  guioptions-=L  guioptions+=l

" Set columns wide if in "diff" mode
if &diff
  set columns=240
endif

