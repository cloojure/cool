#!/bin/bash
# echo "common.bash - enter"

# baseline path
path=( . ${HOME}/bin )
path=( $path /opt/bin )
path=( $path /usr/local/bin  /usr/bin  /bin )
path=( $path /usr/local/sbin /usr/sbin /sbin )
path=( $path /usr/local/opt  /opt/bin )
path=( $path /opt/gsutil )  # #todo:  what is this?

if [[ $(hostname) == *touchcommerce.com ]]; then
  # echo "Found touchcommerce.com"
  # sleep 1
  echo "dummy" > /dev/null  # KLUDGE: stupid bash can't handle an empty if block
else
  # echo "Not-Found touchcommerce.com"
  export JAVA_HOME="/opt/java"
  export GROOVY_HOME="/opt/groovy"
  export DATOMIC_HOME="/opt/datomic"
  export IDEA_HOME="/opt/idea"
  export SPARK_HOME="/opt/spark"
  export HADOOP_HOME="/opt/hadoop"
  export LIQUIBASE_HOME="/opt/liquibase"

  export CASSANDRA_HOME="/opt/cassandra"
  export CQLSH_HOST=localhost  # without this cqlsh tries connecting to 172.17.42.1:9042 & crashes #todo
  export CQLSH_PORT=9042

  path=( ${JAVA_HOME}/bin $path )
  path=( ${GROOVY_HOME}/bin $path )
  path=( ${IDEA_HOME}/bin $path )
  path=( ${DATOMIC_HOME}/bin $path )
  path=( ${CASSANDRA_HOME}/bin $path )
  path=( ${SPARK_HOME}/bin $path )
  path=( ${HADOOP_HOME}/bin $path )
  path=( ${LIQUIBASE_HOME} $path )
  path=( /opt/solr/bin $path )
fi

### if [[ $(uname -a) =~ "Darwin" ]]; then
###   echo "Found Darwin OS"
###   sleep 3
###   # export DYLD_LIBRARY_PATH=/opt/oracle
###   # export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk/Contents/Home"
###   # export GROOVY_HOME="/opt/groovy"
###
###   alias gvim=mvim
###   alias du="du -g"
###   alias df="df -g"
###   alias d="ls -ldF"
###   alias lal="ls -alF"
###   alias dt="ls -ldtF"
###   alias dt9="ls -ldtF * | head -9"
###   alias grep='\grep -E'  # same as deprecated 'egrep'
### fi


# We need to add the '2>&/dev/null' part to squelch error messages on Kubuntu 14.04.
# Remove if you need to see any error messages.
alias gvim="\gvim  -geom '+3300+0' 2>&/dev/null"
if [[ $(hostname) == amy ]]; then
  alias gvim="\gvim  -geom '+3300+0' 2>&/dev/null"
fi
# old:  if [[ $(uname -a) == *Ubuntu* ]]; then

function shellVersion {
  if [[ $ZSH_VERSION != "" ]]; then
    echo "  zsh $ZSH_VERSION"
  elif [[ $BASH_VERSION != "" ]]; then
    echo "  bash $BASH_VERSION"
  fi
}
alias shellver="shellVersion"

alias d="ls -ldF --color"
alias lal="ls -alF --color"
alias dt="ls -ldtF --color"
alias dt9="ls -ldtF --color * | head -9"

alias du="du -m"
alias df="df -BG"

# Always use egrep
alias grep="\grep -E --color=auto"  # same as deprecated 'egrep'

if echo "$(uname -a)" | grep -i Linux > /dev/null ; then
  # echo "Found Linux"
  echo "Bash is dumb!" > /dev/null  # stupid bash can't handle an empty "then" part
else
  # echo "Missing Linux"
  echo "OSX is dumb!" > /dev/null  # stupid bash can't handle an empty "then" part
fi

alias pdirs="find * -maxdepth 0 -type d "
alias pfiles="find * -maxdepth 0 -type f "
alias dd='d `pdirs` '

alias wcl="wc -l"

alias hh="history -99"

alias gvt="~/work/settings/gvt.csh "
alias gvd="echo gvim -c 'winpos 5 5' -c 'winsize 170 50' "

alias up=" cd .."
alias up2="cd ../.."
alias up3="cd ../../.."
alias up4="cd ../../../.."
alias up5="cd ../../../../.."
alias up6="cd ../../../../../.."
alias up7="cd ../../../../../../.."
alias up8="cd ../../../../../../../.."
alias up9="cd ../../../../../../../../.."

alias gits="git status --short"
alias gitss="git status"
alias gitb="git branch"
alias gitco="git checkout"
alias gitca="git commit --all"
alias gitcam="git commit --all -m'misc' "
alias gitcamp="git commit --all -m'misc' ; git push"
alias gitsync="git pull ; git push"
alias gitdns="git diff --name-status"
alias gitdw="git diff --ignore-all-space --ignore-blank-lines"
alias gitlg="git log -22 --oneline --graph --decorate"

alias gitdg='git difftool --noprompt --extcmd="gvim -d --nofork -geometry 220x80+2000+40" '
# alias gitdg="git difftool --noprompt"
        # old version (doesn't work on mac):
        #   dg      = git difftool --no-prompt --extcmd='gvimdiff --nofork -geometry 180x50+20+40'

alias diffw="diff --ignore-all-space --ignore-blank-lines"

alias shx="chmod a+x *.sh *.bash *.csh *.zsh *.groovy"
alias kk="kill -9"
alias pk="pkill -9"

alias blk="sleep 1 ; xset dpms force off"       # set screen to black (power off)

# Alias for home Cannon scanner driver
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

# misc stuff
alias crashrm="sudo rm /var/crash/*"                                # remove Ubuntu crash files that create annoying warnings
alias wifitoggle="nmcli r wifi off ; sleep 1 ; nmcli r wifi on"     # toggle wifi off/on to re-init after sleep
mcd() { mkdir -p "$1"; cd "$1";}
alias histg="history | grep"
alias websiteget="wget --random-wait -r -p -e robots=off -U mozilla"
alias busy="cat /dev/urandom | hexdump -C | grep \"ca fe\""

# joyent
alias gojoy="ssh ubuntu@165.225.137.241"

# TC dev cluster
dev="athompson@agvdevtest26.touchcommerce.com"
# aghcl02

#---------------------------------------------------------------------------------------------------
# temp vars
aa=~/work/dw/DataWarehouseJobs
bb=~/wrk2/dw/DataWarehouseJobs

aa=~/work/htapi
bb=~/wrk2/htapi

alias gef="grep '(Error|Fail)' "
