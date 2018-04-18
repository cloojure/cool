#!/bin/bash
##### WARNING - 'echo' statements in ~/.bashrc or ~/.zshrc will cause 'ssh' remote login to fail!
# echo "common.bash - enter"   

#todo this only works with zsh
# baseline path
path=( . ${HOME}/bin ${HOME}/cool/bin ${HOME}/opt/bin )
path=( $path /opt/bin )
path=( $path /usr/local/bin  /usr/bin  /bin )
path=( $path /usr/local/sbin /usr/sbin /sbin )
path=( $path /usr/local/opt  /opt/bin )
path=( $path ~/.local/bin )  # awscli stuff

if [[ $(hostname) == *dummy.com ]]; then
  echo "dummy" > /dev/null  # KLUDGE: stupid bash can't handle an empty if block
else
  # echo ""
  # echo "Not-Found touchcommerce.com"
  # echo ""
  echo "dummy" > /dev/null  # KLUDGE: stupid bash can't handle an empty if block
fi

if [[ $(uname -a) =~ "Linux" ]]; then
  ### echo "Found Linux"
  echo "Bash is dumb!" > /dev/null  # stupid bash can't handle an empty "then" part

  export JAVA_HOME="/opt/java"                  ; path=( ${JAVA_HOME}/bin           $path )
  export GROOVY_HOME="/opt/groovy"              ; path=( ${GROOVY_HOME}/bin         $path )
  export DATOMIC_HOME="/opt/datomic"            ; path=( ${DATOMIC_HOME}/bin        $path )
  export IDEA_HOME="/opt/idea"                  ; path=( ${IDEA_HOME}/bin           $path )
  export SPARK_HOME="/opt/spark"                ; path=( ${SPARK_HOME}/bin          $path )
  export HADOOP_HOME="/opt/hadoop"              ; path=( ${HADOOP_HOME}/bin         $path )
  export LIQUIBASE_HOME="/opt/liquibase"        ; path=( ${LIQUIBASE_HOME}          $path )
  export CASSANDRA_HOME="/opt/cassandra"        ; path=( ${CASSANDRA_HOME}/bin      $path )
  export ODL_KARAF_DIR="/opt/karaf"             ; path=( ${ODL_KARAF_DIR}/bin       $path )
  export MAVEN_HOME="/opt/apache-maven"         ; path=( ${MAVEN_HOME}/bin          $path )
  export PYTHON_PREFIX="${HOME}/.local/bin"     ; path=( ${PYTHON_PREFIX}           $path )
  export POSTMAN_HOME="/opt/Postman"            ; path=( ${POSTMAN_HOME}            $path )

  # extra cassandra stuff
  export CQLSH_HOST=localhost  # without this cqlsh tries connecting to 172.17.42.1:9042 & crashes #todo
  export CQLSH_PORT=9042

  # Maven stuff for ODL
  export MAVEN_OPTS="-Xmx1048m"

  path=( /opt/phantomjs/bin $path )

  path=( /opt/solr/bin $path )
    # ***** do not set SOLR_HOME *****
    # SOLR_HOME controls the location on disk of the conf & data dirs for a core, 
    #   NOT the install location of the Solr binaries & libs

  # echo "PATH -> ${PATH}"

  alias gvim="\gvim  -geom '+3300+0' 2>&/dev/null"
  alias gvimw="\gvim  -geom '300x80+2200+0' "
  if [[ $(hostname) == amy ]]; then
    alias gvim="\gvim  -geom '+3300+0' 2>&/dev/null"
  fi

  alias d='    ls -ldF   --color'
  alias lal='  ls -alF   --color'
  alias ddr3='find .  -maxdepth 3  -type d  | sed -e 's/^..//' | xargs ls -ldF --color'
  alias ddr4='find .  -maxdepth 4  -type d  | sed -e 's/^..//' | xargs ls -ldF --color'
  alias ddr5='find .  -maxdepth 5  -type d  | sed -e 's/^..//' | xargs ls -ldF --color'

  alias idea="idea.sh &"

fi
if [[ $(uname -a) =~ "Darwin" ]]; then
  # echo "Found Darwin"
  echo "OSX is dumb!"  > /dev/null  # stupid bash can't handle an empty "then" part
  # sleep 3
  # export DYLD_LIBRARY_PATH=/opt/oracle
  # export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk/Contents/Home"
  # export GROOVY_HOME="/opt/groovy"

  export H2_HOME="/opt/h2"                  ; path=( ${H2_HOME}/bin           $path )

  alias d='    ls -ldF'
  alias lal='  ls -alF'
  alias idea='echo "not implemented; start IDEA from dock" '

fi

function shellVersion() {
  if [[ $ZSH_VERSION != "" ]]; then
    echo "  zsh $ZSH_VERSION"
  elif [[ $BASH_VERSION != "" ]]; then
    echo "  bash $BASH_VERSION"
  else
    echo "  *** unknown shell! ***"
  fi
}
alias shellver="shellVersion"

alias da='   d *'
alias dal='  ls -ldF * | less'
alias dar='  d **/*'
alias dt9='  d -t * | head -9'
alias dt22=' d -t * | head -22'

alias du="du -m"
alias df="df -m"

# Always use egrep
alias grep=" \grep  -E --color=auto"  # same as deprecated 'egrep'
alias grepi="\grep -iE --color=auto"

alias radirs="find . -type d "                                  # Recursive All Dirs
alias rdirs="radirs | grep -v '/\.' | sed -e 's/^..//' "        # Recursive Dirs
alias ldirs="find * -maxdepth 0 -type d "                       # Local Dirs
alias lfiles="find * -maxdepth 0 -type f "                      # Local Files
alias dd='d $(ldirs) '                                          # d Dirs
alias ddr='d $(rdirs) '                                         # d Dirs Recursive
alias ddra='d $(radirs) '                                       # d Dirs Recursive All

alias wcl="wc -l"       # Word Count Lines

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
alias rmdot='rmdir $(pwd)'

alias cuts="cut --char=-99"
alias cutm="cut --char=-155"
alias cutl="cut --char=-222"

alias gits="    git status --short --branch"
alias gitb="    git branch"
alias gitco="   git checkout"
# alias gitmer="  git merge --no-ff --no-commit"
alias gitca="   git commit --all"
alias gitcam="  git commit --all -m'misc' "
alias gitcamp=" git commit --all -m'misc' ; git push"
alias gitsy="   git pull ; git push ; git push --tags"    # git-sync (also push tags)
alias gitdns="  git diff --name-status"
alias gitdw="   git diff --ignore-all-space --ignore-blank-lines"
alias gitlg="   git log -22 --oneline --graph --decorate"
alias git-unadd='git reset HEAD'    # git unadd
function gitg() { # sample:   gittag v0.1.0
  tagStr=$1
  if [[ "$tagStr" == "" ]]; then
    git tag
  else
    git tag "$tagStr" -m"$tagStr"
  fi
}

alias gitdg='git difftool --noprompt --extcmd="gvim -d --nofork -geometry 220x80+2000+40" '
# alias gitdg="git difftool --noprompt"
        # old version (doesn't work on mac):
        #   dg      = git difftool --no-prompt --extcmd='gvimdiff --nofork -geometry 180x50+20+40'


alias diffw="diff --ignore-all-space --ignore-blank-lines"

alias shx="chmod a+x *.sh *.bash *.csh *.zsh *.groovy *.clj"
alias kk="kill -9"
alias pk="pkill -9"

function pg() {
  ps -Fp $(pgrep ${1} )
}

alias blk="sleep 1 ; xset dpms force off"       # set screen to black (power off)
alias dosleep="systemctl suspend"

# Misc tools
# Return a timestamp string like "20161117-111307" (from  date --iso-8601=seconds => # "2016-11-17T11:13:07-08:00")
alias dateTimeStr=" date --iso-8601=seconds | sed -e's/^\(.\{19\}\)\(.*\)/\1/' | sed -e's/-//g' | sed -e's/://g' | sed -e's/T/-/g' "

# Alias for home Cannon scanner driver
alias scanner=scangearmp

# Alias for Postman app (local install)
alias postman=Postman

# Google Cloud tools
#
# Copy local files to Google Cloud Storage using gzip compression for all files
# matching *.{txt,xml,csv,tsv,psv,html,js}, and set permission to public-read.
alias gsutil-cpz="gsutil cp -z txt,xml,csv,tsv,psv,html,js -a public-read "

# lein abbreviations
alias lt=" time lein test"
alias lta="time lein test :all"
alias ltr="lein test-refresh"
alias lex="lein autoexpect"
alias lrsh="lein ring server-headless"
# dead??? #todo
#   alias linit="time lein run --init-db --no-start-server --no-start-wamp-server"
#   alias litst="linit ; ltst"
#   alias ltst=" time lein test :bvt :regression"
alias lf="lein figwheel"
alias lc="lein clean"
alias lclf="lein clean ; lein figwheel"
alias rlf="lein clean ; rlwrap lein figwheel"

# python env vars
export PYTHONDONTWRITEBYTECODE="enable"     # invaluable for avoiding stale cache errors
# python abbreviations
alias pyx="chmod a+x *.py "
alias pyt="pytest -v"
alias venv2='virtualenv -p /usr/bin/python2 venv'
alias venv3='virtualenv -p /usr/bin/python3 venv'
function venvon() {
  echo '    source venv/bin/activate'
            source venv/bin/activate 
}
function venvoff() {
  echo '    deactivate'
            deactivate 
}

# misc stuff
alias crashrm="sudo rm /var/crash/*"                                # remove Ubuntu crash files that create annoying warnings
function mcd() { 
  mkdir -p "$1"; cd "$1";
}
alias histg="history | grep"
alias websiteget="wget --random-wait -r -p -e robots=off -U mozilla"
alias busy="cat /dev/urandom | hexdump -C | grep \"ca fe\""
alias rs="reset"
alias wifitoggle="nmcli r wifi off ; sleep 1 ; nmcli r wifi on"     # toggle wifi off/on to re-init after sleep
        # maybe try this too:  sudo service network-manager restart
alias pingg="ping -c5 google.com"
alias ping4="ping -c4"
alias gopen="gnome-open"
alias go="   gnome-open"

function ipaddr() {
  result=$(ip route get 8.8.8.8 | awk '{print $NF; exit}' )         # 8.8.8.8 is google dns
  echo "${result}"
}
alias ipexternal="curl --silent http://checkip.amazonaws.com"
function ipinfo() {
  echo "local    IP  =>  $(ipaddr)"
  echo "external IP  =>  $(ipexternal)"
}

# joyent
alias gojoy="ssh ubuntu@165.225.137.241"

# Docker stuff
alias dk="  docker"
alias dkm=" docker-machine"
alias dkn=" docker network"
alias dksr="docker service"
  # "docker swarm"
  # "docker deploy"
  # "docker stack"
alias dkc=" docker-compose"
alias dkrm="        dk  rm -v"          # by default always remove volumes
alias dkcrm="       dkc rm -vf"         # by default always remove volumes
alias dkmrm="       dkm rm -f"          # by default always remove volumes
alias dkps='        dk ps'
alias dkpsa='       dk ps -a'
alias dklist='      dk ps -aq'
alias dkclear='     dk rm -v $(dklist) '
alias dk-kill-all=' dk kill $(dk ps -q) '
alias dkip="docker inspect --format='{{.NetworkSettings.Networks.user_default.IPAddress}}' "  # <container-name>
                 # or --format='{{json .NetworkSettings.Networks.user_default.IPAddress}}'
alias docker-machine-disable=' DOCKER_MACHINE_IP="" ; DOCKER_TLS_VERIFY="" ; DOCKER_HOST="" ; DOCKER_CERT_PATH="" ; DOCKER_MACHINE_NAME="" '

# maven trick for ODL (-nsu => "No Snapshot Updates" downloaded from nexus.opendaylight.org)
mvnInstallCmd='mvn clean install -Dcheckstyle.skip=true -DskipTests -nsu'
alias mvn-install="echo ${mvnInstallCmd}; ${mvnInstallCmd}";

alias cp-shared=" sudo bash -c 'mv /media/sf_shared/* /shared; chown -R alan:alan /shared ' "

# Brocade stuff 
alias vpn-pulse='/usr/local/pulse/PulseClient.sh  -h hq.vpn.brocade.com  -u athomps'
  # need to leave running in background or open window

# echo "common.bash - exit"   
