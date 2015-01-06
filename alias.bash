#!/bin/bash 
### echo "alias.bash - enter"

# We need to add the '2>&/dev/null' part to squelch error messages on Kubuntu 14.04.
# Remove if you need to see any error messages.
alias gvim="\gvim  -geom '+3300+20' 2>&/dev/null"
if [[ $(hostname) == amy ]]; then        
  alias gvim="\gvim  -geom '+2000-1200' 2>&/dev/null"
fi
# old:  if [[ $(uname -a) == *Ubuntu* ]]; then

alias d="ls -ldF --color=auto"
alias lal="ls -alF --color=auto"
alias dt="ls -ldtF --color=auto"
alias dt9="ls -ldtF --color=auto * | head -9"

if echo "$(uname -a)" | grep -i Linux > /dev/null ; then
  echo "dummy" > /dev/null  # stupid bash can't handle an empty "then" part
  # echo "Found Linux"
else
  # echo "Missing Linux"
  set dummy="OSX is dumb!"
  alias d="ls -ldF"
  alias lal="ls -alF"
fi

# Always use egrep
alias grep="\grep -E --color=auto"  # same as deprecated 'egrep'

alias pdirs='find * -maxdepth 0 -type d '
alias pfiles='find * -maxdepth 0 -type f '
alias dd='d `pdirs` '

alias du='du -BG'
alias df='df -BG'
alias wcl="wc -l"

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
alias gitcamp="git commit --all -m'misc' ; git push"
alias gitsync="git pull ; git push"
alias gitdns="git diff --name-status"

alias gitdg='git difftool --noprompt --extcmd="gvim -d --nofork -geometry 220x80+2000+40" '
# alias gitdg="git difftool --noprompt"
        # old version (doesn't work on mac):
        #   dg      = git difftool --no-prompt --extcmd='gvimdiff --nofork -geometry 180x50+20+40'

alias shx="chmod a+x *.bash *.csh *.zsh *.groovy"
alias kk="kill -9"
alias pk="pkill -9"

# Scanner alias
alias scanner=scangearmp

# Docker stuff
alias dk="sudo docker"

# Google Cloud tools
#
# Copy local files to Google Cloud Storage using gzip compression for all files 
# matching *.{txt,xml,csv,tsv,psv,html,js}, and set permission to public-read.
alias gsutil-cpz="gsutil cp -z txt,xml,csv,tsv,psv,html,js -a public-read "

# lein abbreviations
alias linit="time lein run --init-db --no-start-server --no-start-wamp-server"
alias ltst=" time lein test :bvt :regression"
alias litst="linit ; ltst"

alias fdb-start-doc="sudo service fdb-document-layer restart"

### echo "alias.bash - exit"
