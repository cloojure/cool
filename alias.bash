#!/bin/bash 
### echo "alias.bash - enter"

# Always use egrep
alias grep="\grep -E --color=auto"  # same as deprecated 'egrep'

alias pdirs='find * -maxdepth 0 -type d '
alias pfiles='find * -maxdepth 0 -type f '
alias d="ls -ldF --color=auto"
alias lal="ls -alF --color=auto"
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

alias hh="history -99"

alias gvt="~/work/settings/gvt.csh "
alias gvd="echo gvim -c 'winpos 5 5' -c 'winsize 170 50' "

alias up="cd .."
alias up2="cd ../.."
alias up3="cd ../../.."
alias up4="cd ../../../.."
alias up5="cd ../../../../.."
alias up6="cd ../../../../../.."

alias gits="git status --short"
alias gitss="git status"
alias gitb="git branch"
alias gitco="git checkout"
alias gitca="git commit --all"
alias gitcam="git commit --all -m'misc' "
alias gitdg="git difftool --noprompt"
        # old version (doesn't work on mac):
        #   dg      = git difftool --no-prompt --extcmd 'gvimdiff -geometry 180x50+20+40'

alias shx="chmod a+x *.bash *.csh *.zsh *.groovy"
alias kk="kill -9"
alias pk="pkill -9"

# Google Cloud tools
#
# Copy local files to Google Cloud Storage using gzip compression for all files 
# matching *.{txt,xml,csv,tsv,psv,html,js}, and set permission to public-read.
alias gsutil-cpz="gsutil cp -z txt,xml,csv,tsv,psv,html,js -a public-read "


### echo "alias.bash - exit"
