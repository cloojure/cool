
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
" 
set guifont=Monospace\ 11  " default => Linux 
" match index is 0-based (C-style);  no match = -1
if match( system("uname -a"), "Darwin" ) > -1
  " echo "Found Darwin, setting guifont for mac... \n"
  " sleep 3
  set guifont=Courier\ New:h16
" set guifont=Liberation\ Mono\ 16
endif

set lines=60
set columns=100
set equalalways
set guioptions-=r  guioptions-=L  guioptions+=l

" colorscheme slate
colorscheme desert
syntax on

