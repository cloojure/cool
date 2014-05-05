set        nocp        " 'compatible' is not set
filetype   plugin on   " plugins are enabled

" Turn on source code syntax coloring
syntax enable

" The minimal shell /bin/ash is faster than /bin/bash or /bin/tcsh on startup
set shell=/bin/tcsh

" Basic settings
set diffopt=filler,iwhite
set shiftwidth=2
set tabstop=8
set expandtab
set autoindent
set smartindent
set ignorecase
set smartcase
set hlsearch
set nobackup
set nowrap
set selectmode="mouse,key,cmd"
set fileformat=unix
set fileformats=unix,dos
set ruler
set textwidth=90
set scrolloff=5
set guioptions-=r  guioptions-=L  guioptions+=l
set equalalways
set tags=./tags,../tags,../../tags,../../../tags,../../../../tags,tags
set path=.,*,src/**,test/**,resources/**,**/*.clj,**/*.cljs,**/*sh,**/*txt

" colorscheme desert
" colorscheme slate
colorscheme default

" Fix the difficult-to-read default setting for diff text
" highlighting.  The bang (!) is required since we are overwriting the
" DiffText setting. The highlighting for "Todo" also looks nice (yellow)
" if you don't like the "MatchParen" (Aqua) diff color.
highlight! link DiffText MatchParen   " Aqua diff coloring
"   highlight! link DiffText Todo   " Yellow diff coloring

set verbose=0   " increment to aid in debugging

" Only works for X Windows diff on Cygwin (not Win GUI diff)
set diffexpr=MyDiff()
function! MyDiff()
  let l:opt = '-a --binary '
  if &diffopt =~ 'icase'  | let l:opt = l:opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let l:opt = l:opt . '-w ' | endif
  let arg1 = v:fname_in
  let arg2 = v:fname_new
  let arg3 = v:fname_out
  " let cmd = '/opt/freeware/bin/diff'
  " let cmd = 'diff'
  " silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
  silent execute '!/usr/bin/diff ' . l:opt . arg1 . ' ' . arg2 . ' > ' . arg3
  " Can do 'silent execute' or just 'execute'
  " :new | redraw | echo "there is a new window"
  "
  " Needed?  can we delete these?
  " if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  " if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  " if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
endfunction

