" execute pathogen#infect()
" filetype plugin indent on     " plugins are enabled
" filetype plugin on            " plugins are enabled

" Vim Fireplace shortcuts
nnoremap  <C-e>     :%Eval<CR>
nnoremap  <C-e>     :Eval<CR>
:command! EE        %Eval

let g:clojure_align_multiline_strings = 1


" Turn on source code syntax coloring
syntax on
  " syntax enable

colorscheme slate
  " colorscheme desert
  " colorscheme default

" The minimal shell /bin/ash is faster than /bin/bash or /bin/tcsh on startup
set shell=/bin/zsh

" Basic settings
set diffopt=filler,iwhite
set shiftwidth=2
set tabstop=4
set softtabstop=4
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
set tags=./tags,../tags,../../tags,../../../tags,../../../../tags,tags
set path=.,*,src/**,grails-app/**,test/**,resources/**,**/*.clj,**/*.cljs,**/*sh,**/*txt

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

" Write a protected file using sudo
:command! W w !sudo tee % > /dev/null

