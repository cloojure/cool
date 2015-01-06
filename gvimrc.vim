
" let g:clojure_align_multiline_strings = 1


" Vim Fireplace shortcuts
" nnoremap    :%Eval
" nnoremap    :Eval

" execute pathogen#infect()
" 
" let g:rbpt_colorpairs = [
"     \ ['brown',       'RoyalBlue3'],
"     \ ['Darkblue',    'SeaGreen3'],
"     \ ['darkgray',    'DarkOrchid3'],
"     \ ['darkgreen',   'firebrick3'],
"     \ ['darkcyan',    'RoyalBlue3'],
"     \ ['darkred',     'SeaGreen3'],
"     \ ['darkmagenta', 'DarkOrchid3'],
"     \ ['brown',       'firebrick3'],
"     \ ['gray',        'RoyalBlue3'],
"     \ ['black',       'SeaGreen3'],
"     \ ['darkmagenta', 'DarkOrchid3'],
"     \ ['Darkblue',    'firebrick3'],
"     \ ['darkgreen',   'RoyalBlue3'],
"     \ ['darkcyan',    'SeaGreen3'],
"     \ ['darkred',     'DarkOrchid3'],
"     \ ['red',         'firebrick3'],
"     \ ]
" let g:rbpt_max = 16
" let g:rbpt_loadcmd_toggle = 0
" 
" au VimEnter * RainbowParenthesesToggle
" au Syntax   * RainbowParenthesesLoadRound
" au Syntax   * RainbowParenthesesLoadSquare
" au Syntax   * RainbowParenthesesLoadBraces

" set guifont=Liberation\ Mono\ 10  " alternative for Fedora
set guifont=Monospace\ 10  " default => Linux 
" set guifont=Monospace\ 9  " default => Linux (27" LG monitor)

" match index is 0-based (C-style);  no match = -1
" if match( system("uname -a"), "Ubuntu" ) > -1
"   " echo "Found Ubuntu, setting guifont for XPS13... \n"
"   " sleep 3
"   set guifont=Monospace\ 10  " better for small screen
" endif
"
if match( system("uname -a"), "Darwin" ) > -1
  echo "Found Darwin, setting guifont for mac... \n"
  sleep 3
  set guifont=Courier\ New:h16
endif

" This function is used to swap
" the orientation of 2 windows (eg left/right), while keeping the cursor in the same pane
" where it started (eg left pane).
function! SwapWindows()
  " User-defined functions must begin with a capital letter 
  wincmd r      " rotate windows
  wincmd w      " move cursor to 
endfunction
:command! SS call SwapWindows()
  " User-defined commands must begin with a capital letter 

" Window shape commands/functions
function! LinesSingle()
  set lines=60
endfunction
function! LinesDouble()
  set lines=120
endfunction
function! WidthSingle()
  set columns=120
endfunction
function! WidthDouble()
  set columns=200
endfunction
:command! C6 set columns=60         " Columns 60
:command! Ws call WidthSingle()     " Width single
:command! Wd call WidthDouble()     " Width double
:command! L2 set lines=20           " Lines 20
:command! L4 set lines=40           " Lines 40
:command! Ls call LinesSingle()     " Lines single
:command! Ld call LinesDouble()     " Lines double

" Font options
:command! F14 set guifont=Monospace\ 14
:command! F12 set guifont=Monospace\ 12
:command! F10 set guifont=Monospace\ 10
:command! F9  set guifont=Monospace\  9
:command! FF  set guifont=Monospace\ 12

" Default size/shape
call LinesSingle()
call WidthSingle()
set equalalways

set guioptions-=r  guioptions-=L  guioptions+=l

" Set columns wide if in "diff" mode
if &diff
  call WidthDouble()
endif

" colorscheme slate
colorscheme desert
syntax on

