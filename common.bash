#!/bin/bash
# echo "common.bash - enter"

# baseline path
path=( . ${HOME}/bin ${HOME}/opt/bin )
path=( $path /opt/bin )
path=( $path /usr/local/bin  /usr/bin  /bin )
path=( $path /usr/local/sbin /usr/sbin /sbin )
path=( $path /usr/local/opt  /opt/bin )
path=( $path /opt/gsutil )  # #todo:  what is this?

if [[ $(hostname) == *touchcommerce.com ]]; then
  echo "dummy" > /dev/null  # KLUDGE: stupid bash can't handle an empty if block
# echo ""
# echo "Found touchcommerce.com"
# echo ""
# sleep 1
  
  PATH=".:${HOME}/bin:${HOME}/opt/bin"
  PATH="$PATH:/opt/bin"
  PATH="$PATH:/usr/local/bin:/usr/bin:/bin"
  PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"
  PATH="$PATH:/usr/local/opt:/opt/bin"

  export JAVA_HOME="/opt/java"                  ; PATH="${JAVA_HOME}/bin:$PATH"
  # PATH="/opt/solr/bin:$PATH"

  # echo "PATH -> ${PATH}"
else
  # echo ""
  # echo "Not-Found touchcommerce.com"
  # echo ""
  export JAVA_HOME="/opt/java"                  ; path=( ${JAVA_HOME}/bin         $path )
  export GROOVY_HOME="/opt/groovy"              ; path=( ${GROOVY_HOME}/bin       $path )
  export DATOMIC_HOME="/opt/datomic"            ; path=( ${DATOMIC_HOME}/bin      $path )
  export IDEA_HOME="/opt/idea"                  ; path=( ${IDEA_HOME}/bin         $path )
  export SPARK_HOME="/opt/spark"                ; path=( ${SPARK_HOME}/bin        $path )
  export HADOOP_HOME="/opt/hadoop"              ; path=( ${HADOOP_HOME}/bin       $path )
  export LIQUIBASE_HOME="/opt/liquibase"        ; path=( ${LIQUIBASE_HOME}        $path )
  export CASSANDRA_HOME="/opt/cassandra"        ; path=( ${CASSANDRA_HOME}/bin    $path )

  # extra cassandra stuff
  export CQLSH_HOST=localhost  # without this cqlsh tries connecting to 172.17.42.1:9042 & crashes #todo
  export CQLSH_PORT=9042

  path=( /opt/solr/bin $path )
    # ***** do not set SOLR_HOME *****
    # SOLR_HOME controls the location on disk of the conf & data dirs for a core, 
    #   NOT the install location of the Solr binaries & libs
fi

if [[ $(uname -a) =~ "Linux" ]]; then
  ### echo "Found Linux"
  echo "Bash is dumb!" > /dev/null  # stupid bash can't handle an empty "then" part
fi
### if [[ $(uname -a) =~ "Darwin" ]]; then
###   echo "Found Darwin"
###   echo "OSX is dumb!"  > /dev/null  # stupid bash can't handle an empty "then" part
###   sleep 3
###   # export DYLD_LIBRARY_PATH=/opt/oracle
###   # export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk/Contents/Home"
###   # export GROOVY_HOME="/opt/groovy"
### fi

# We need to add the '2>&/dev/null' part to squelch error messages on Kubuntu 14.04.
# Remove if you need to see any error messages.
alias gvim="\gvim  -geom '+3300+0' 2>&/dev/null"
if [[ $(hostname) == amy ]]; then
  alias gvim="\gvim  -geom '+3300+0' 2>&/dev/null"
fi

function shellVersion {
  if [[ $ZSH_VERSION != "" ]]; then
    echo "  zsh $ZSH_VERSION"
  elif [[ $BASH_VERSION != "" ]]; then
    echo "  bash $BASH_VERSION"
  fi
}
alias shellver="shellVersion"

alias d="   ls -ldF   --color"
alias lal=" ls -alF   --color"
alias dt="  ls -ldtF  --color"
alias dt9=" ls -ldtF  --color * | head -9"

alias du="du -m"
alias df="df -BG"

# Always use egrep
alias grep=" \grep  -E --color=auto"  # same as deprecated 'egrep'
alias grepi="\grep -iE --color=auto"

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

alias gits="    git status --short"
alias gitb="    git branch"
alias gitco="   git checkout"
alias gitca="   git commit --all"
alias gitcam="  git commit --all -m'misc' "
alias gitcamp=" git commit --all -m'misc' ; git push"
alias gitsync=" git pull ; git push"
alias gitdns="  git diff --name-status"
alias gitdw="   git diff --ignore-all-space --ignore-blank-lines"
alias gitlg="   git log -22 --oneline --graph --decorate"

alias gitdg='git difftool --noprompt --extcmd="gvim -d --nofork -geometry 220x80+2000+40" '
# alias gitdg="git difftool --noprompt"
        # old version (doesn't work on mac):
        #   dg      = git difftool --no-prompt --extcmd='gvimdiff --nofork -geometry 180x50+20+40'

alias diffw="diff --ignore-all-space --ignore-blank-lines"

alias shx="chmod a+x *.sh *.bash *.csh *.zsh *.groovy"
alias kk="kill -9"
alias pk="pkill -9"

alias blk="sleep 1 ; xset dpms force off"       # set screen to black (power off)
alias dosleep="systemctl suspend"

# Alias for home Cannon scanner driver
alias scanner=scangearmp

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
alias rs="reset"

function fn_ipaddr() {
  result=$( ip route get 8.8.8.8 | awk '{print $NF; exit}' )
  echo "local IP  =>  ${result}"
}
alias ipaddr=fn_ipaddr

function fn_ipexternal() {
  result=$( curl --silent http://checkip.amazonaws.com )
  echo "external IP (checkip.amazonaws.com)  =>  ${result}"
}
alias ipexternal=fn_ipexternal


# joyent
alias gojoy="ssh ubuntu@165.225.137.241"

# Docker stuff
alias dk="docker"                       # alias dk="sudo --preserve-env docker"
alias dkr="dk run"
alias dkru="    dkr    ubuntu"
alias dkrd="    dkr -d"
alias dkrdu="   dkr -d ubuntu"
alias dkc="docker-compose"              # alias dkc="sudo --preserve-env docker-compose"


# CENX stuff
export DOCKER_MACHINE_IP=$(ipaddr)
alias vpnstart='sudo vpnc cenx --local-port 0 --domain "" '
alias cortx='docker run --rm -t -v ~:/opt/cenx docker.cenx.localnet:5000/deployer'
alias parker_alias='curl -X POST http://localhost:8983/solr/admin/collections\?action\=CREATEALIAS\&name\=parker\&collections\=parker1 -H "Content-Type: application/json"'

function customer() {
    customer=$1
    #devops=[LOCATION OF DEVOPS]
    #devops="${HOME}/cx/devops/deployments/rapid-dev/"
    devops="~/cx/devops/deployments/rapid-dev/"
    default="${devops}/cortx.yaml"
    custops="${devops}/customers/${customer}/cortx.yaml"
 
    if ! [[ "$(boot2docker status)" = "running" ]] ; then
        boot2docker start;
    fi
    cortx stop;
    cortx clean;
    if [ -e $custops ]; then
        echo "customer found: ${customer}"
        use=${custops}
    else
        echo "customer not found: ${customer}"
        echo "using generic"
        use=${default}
    fi
    cp ${use} ~
    cortx start;
    curl -X POST http://localhost:8983/solr/admin/collections\?action\=CREATEALIAS\&name\=parker\&collections\=parker1 -H "Content-Type: application/json";
    docker exec -i -t ldap ldapadd -x -D "cn=Manager,dc=cenx,dc=com" -w 2112 -f /etc/openldap/sample.ldif
}

#---------------------------------------------------------------------------------------------------
# temp stuff
alias gef="grep -E '(Error|Fail)' "

aa=~/work
bb=~/wrk2
cc=~/wrk3


