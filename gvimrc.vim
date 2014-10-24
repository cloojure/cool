
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

" set guifont=Monospace\ 10  " default => Linux 
set guifont=Monospace\ 9  " default => Linux 

" match index is 0-based (C-style);  no match = -1
if match( system("uname -a"), "Ubuntu" ) > -1
  " echo "Found Ubuntu, setting guifont for XPS13... \n"
  " sleep 3
  set guifont=Monospace\ 9  " better for small screen
endif
if match( system("uname -a"), "Darwin" ) > -1
  echo "Found Darwin, setting guifont for mac... \n"
  sleep 3
  set guifont=Courier\ New:h16
endif

set lines=60
set columns=110
set equalalways
set guioptions-=r  guioptions-=L  guioptions+=l

" Set columns wide if in "diff" mode
if &diff
  set columns=220
endif

" colorscheme slate
colorscheme desert
syntax on

