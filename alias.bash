#!/bin/bash 
### echo "alias.bash - enter"

# Always use egrep
alias grep="\grep -E"  # same as deprecated 'egrep'

alias pdirs='find * -maxdepth 0 -type d '
alias pfiles='find * -maxdepth 0 -type f '
alias d="ls -ldF"
alias lal="ls -alF"
alias dd='d `pdirs` '

alias du='du -m '
alias df='df -m '
alias wcl="wc -l"

if echo "$(uname -a)" | grep -i Linux > /dev/null ; then
  # echo "Found Linux"
  alias gvim="\gvim  -geom '+900+20' "
else
  # echo "Missing Linux"
  set dummy="Bash is dumb!"
fi

alias gvt="~/work/settings/gvt.csh "
alias gvd="echo gvim -c 'winpos 5 5' -c 'winsize 170 50' "

alias up="cd .."
alias up2="cd ../.."
alias up3="cd ../../.."
alias up4="cd ../../../.."
alias up5="cd ../../../../.."
alias up6="cd ../../../../../.."

alias gits="git status --short"
alias gitc="git commit --allow-empty-message -m '' "
alias gitca="git commit --all "
alias gitdg="git difftool --no-prompt "

alias shx="chmod a+x *.bash *.csh *.zsh *.groovy"
alias kk="kill -9"
alias pk="pkill -9"

### echo "alias.bash - exit"
