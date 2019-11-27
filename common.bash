# echo "common.bash - enter"

function nil() { # same as $(true) => 0 exit status
  true
}
function identity() {
  echo "count = $#"
  echo "$@"  # or $* ???
}
function count() {
  echo $#
}
function str() {
  echo "count = $#"
  result=""
  for arg in $@ ; do
    result+=$arg
  done
  echo "$result"
}
function add() {
  echo "count = $#"
  result=0
  for arg in $@ ; do
    $((result+=arg))
  done
  echo "$result"
}
function first() {
  echo $1
}
function rest() {
  shift
  echo "$@" 
}
function cons() {
  echo "count = $#"
  echo "1 = $1"
  echo "2 = $2"
}

# baseline path (old way)
  # export PATH=.:${HOME}/bin:${HOME}/cool/bin:${HOME}/opt/bin
  # export PATH=$PATH:/opt/bin
  # export PATH=$PATH:/usr/local/bin:/usr/bin:/bin
  # export PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
  # export PATH=$PATH:/usr/local/opt:/opt/bin
  # export PATH=$PATH:~/.local/bin   # awscli stuff

function path_prepend() {
  local path_search_dir=$1
  export PATH="${path_search_dir}:${PATH}"
}
function path_append() {
  local path_search_dir=$1
  export PATH="${PATH}:${path_search_dir}"
}

export PATH=.
  path_append ${HOME}/bin
  path_append ${HOME}/cool/bin
  path_append ${HOME}/opt/bin
  path_append /opt/bin
  path_append /usr/local/bin
  path_append /usr/bin
  path_append /bin
  path_append /usr/local/sbin
  path_append /usr/sbin
  path_append /sbin
  path_append /usr/local/opt
  path_append ${HOME}/.local/bin # awscli stuff

function isMac() {
  if [[ $(uname -a) =~ "Darwin" ]]; then
    true
  else
    false
  fi
}
function isLinux() {
  if [[ $(uname -a) =~ "Linux" ]]; then
    true
  else
    false
  fi
}

# function xxx() {
#   if ((0)) ; then
#     echo "truthy"
#   else
#     echo "falsey"
#   fi
# }

if $(isLinux) ; then #{
  # echo "Found Linux"
  echo "Bash is dumb!" > /dev/null  # stupid bash can't handle an empty "then" part

  export PGDATA="/var/edb/postgresql"
  export EDB_HOME="/opt/PostgreSQL/10"                        ; path_prepend ${EDB_HOME}/bin
  export JAVA_HOME="/opt/java"                                ; path_prepend ${JAVA_HOME}/bin
  export YOURKIT_HOME="/opt/YourKit-JavaProfiler-2019.1"      ; path_prepend ${YOURKIT_HOME}/bin
  export DATOMIC_HOME="/opt/datomic"                          ; path_prepend ${DATOMIC_HOME}/bin
  export IDEA_HOME="/opt/idea"                                ; path_prepend ${IDEA_HOME}/bin
  export MAVEN_HOME="/opt/apache-maven"                       ; path_prepend ${MAVEN_HOME}/bin
# export PYTHON_PREFIX="${HOME}/.local/bin"                   ; path_prepend ${PYTHON_PREFIX}
  export POSTMAN_HOME="/opt/Postman"                          ; path_prepend ${POSTMAN_HOME}

  # extra cassandra stuff
  # export CQLSH_HOST=localhost  # without this cqlsh tries connecting to 172.17.42.1:9042 & crashes #todo
  # export CQLSH_PORT=9042

  # Maven stuff for ODL
  # export MAVEN_OPTS="-Xmx1048m"

  # path_prepend /opt/phantomjs/bin

  # path_prepend  /opt/solr/bin $path
    # ***** do not set SOLR_HOME *****
    # SOLR_HOME controls the location on disk of the conf & data dirs for a core,
    #   NOT the install location of the Solr binaries & libs

  # echo "PATH -> ${PATH}"

  # ********** don't forget about symlink /opt/java -> /opt/java10 **********

  function zulu10() {
    export JAVA_HOME=/opt/zulu10
    path_prepend ${JAVA_HOME}/bin
    java  --version
  }
  function java8() {
    export JAVA_HOME=/opt/java8
    path_prepend "${JAVA_HOME}/bin"
    java  -version
  }
  function java9() {
    export JAVA_HOME=/opt/java9
    path_prepend "${JAVA_HOME}/bin"
    java  --version
  }
  function java10() {
    export JAVA_HOME=/opt/java10
    path_prepend "${JAVA_HOME}/bin"
    java  --version
  }
  function java11() {
    export JAVA_HOME=/opt/java11
    path_prepend "${JAVA_HOME}/bin"
    java  --version
  }
  function java12() {
    export JAVA_HOME=/opt/java12
    path_prepend "${JAVA_HOME}/bin"
    java  --version
  }

  function java13() {
    export JAVA_HOME=/opt/java13
    path_prepend "${JAVA_HOME}/bin"
    java  --version
  }

  java13  >& /dev/null  # ********** default java version to use **********

  alias gvim="\gvim  -geom '+4400+0' 2>&/dev/null"
  alias gvimw="\gvim  -geom '300x80+2200+0' "
  if [[ $(hostname) == amy ]]; then
    # alias gvim="\gvim  -geom '+3300+0' 2>&/dev/null"
    unalias gvim
  fi

  alias d='    ls -ldF   --color'
  alias lal='  ls -alF   --color'
  alias ldl='  ls -ldF   --color .*'
  alias ddr3='find .  -maxdepth 3  -type d  | sed -e 's/^..//' | xargs ls -ldF --color'
  alias ddr4='find .  -maxdepth 4  -type d  | sed -e 's/^..//' | xargs ls -ldF --color'
  alias ddr5='find .  -maxdepth 5  -type d  | sed -e 's/^..//' | xargs ls -ldF --color'

  alias idea="idea.sh &"
  alias yourkit="${YOURKIT_HOME}/bin/profiler.sh &"

  # python abbreviations
  alias python=python3
fi #}

# sample 1-line usage
# isMac    && echo "Found Darwin"
# isLinux  && echo "Found Linux"

# Mac OSX config
if $(isMac) ; then #{
  # echo "Found Darwin (block)"
  echo "OSX is dumb!"  > /dev/null  # stupid bash can't handle an empty "then" part
  # sleep 3

  alias d='    ls -ldF'
  alias lal='  ls -alF'
  alias idea='echo "not implemented; start IDEA from dock" '

  path_prepend "/usr/local/Cellar/python/3.7.2_2/libexec/bin"

  function java8() {
    export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
    path_prepend ${JAVA_HOME}/bin
    java -version
  }
  function java11() {
    export JAVA_HOME=$(/usr/libexec/java_home -v 11)
    path_prepend ${JAVA_HOME}/bin
    java -version
  }
  function java12() {
    export JAVA_HOME=$(/usr/libexec/java_home -v 12)
    path_prepend ${JAVA_HOME}/bin
    java -version
  }
  function java13() {
    export JAVA_HOME=$(/usr/libexec/java_home -v 13)
    path_prepend ${JAVA_HOME}/bin
    java -version
  }

  java13 >& /dev/null

  export GOPATH=${HOME}/go
  path_prepend ${GOPATH}/bin

  unset HTTP_PROXY
  unset http_proxy
  unset HTTPS_PROXY
  unset https_proxy
  unset FTP_PROXY
  unset ftp_proxy
  unset NO_PROXY
  unset no_proxy


# export RUBY_HOME=/usr/local/Cellar/ruby/2.6.3  # Missing `bundle`, etc
  export RUBY_HOME=~/.rbenv/versions/2.6.4       ;  path_prepend ${RUBY_HOME}/bin  # this one works

fi #}

function graalvm() {
  export JAVA_HOME=/opt/graalvm
  path_prepend ${JAVA_HOME}/bin
  java -version
}

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

#  usage:   gittag v9.3.1   - create a tag
#           gittag          - display all tags
function gitg() {
  local tagStr=$1
  if [[ "$tagStr" == "" ]]; then
    git tag
  else
    git tag "$tagStr" -m"$tagStr"
  fi
}

# delete a tag from local and remote (origin)
function git-tag-delete() {
  local tagStr=$1
  local remoteStr=$2
  if [[ $# == 0 ]]; then
    echo ""
    echo "  usage:  git-tag-delete <tag> [<remote-repo-name>]"
    echo ""
    return;
  fi
  if [[ "$remoteStr" == "" ]]; then
    remoteStr="origin"
  fi
  echo "  deleting tag '$tagStr' from local and remote ($remoteStr) repos..."
  echo ""
  git tag  --delete            $tagStr
  git push --delete $remoteStr $tagStr
}

function git-branch-current() {  # returns the name of the current branch
  git rev-parse --abbrev-ref HEAD
}
function git-branch-root() {
  if [[ $1 = "-h" \
     || $1 = "--help" \
     || $# > 2 ]]; then
    echo "usage:  "
    echo "  git-branch-root                        # find common root of current branch and `master` branch"
    echo "  git-branch-root <branch-other>         # find common root of current branch and <branch-other> "
    echo "  git-branch-root <branch-1> <branch-2>  # find common root of <branch-1> and <branch-2> "
  elif [[ "$#" == "0" ]]; then
    eval "git-branch-root  master  $(git-branch-current)"
  elif [[ "$#" == "1" ]]; then
    eval "git-branch-root  $1      $(git-branch-current)"
  else
    rootSpec=$(git merge-base $1 $2  |  cut -c -10)
    echo "  ${rootSpec} "
    echo "    |-- $1"
    echo "    |-- $2"
  fi
}
function first() {
  echo "$1"
}
function git-branch-log() {
  git log --oneline $(first $(git-branch-root))..$(git-branch-current)
}
alias git-log-string='git log -S'  # search log for changes to a string
alias gitdg='git difftool --noprompt --extcmd="gvim -d --nofork -geometry 220x80+2000+40" '
# alias gitdg="git difftool --noprompt"
        # old version (doesn't work on mac):
        #   dg      = git difftool --no-prompt --extcmd='gvimdiff --nofork -geometry 180x50+20+40'


alias diffw="diff --ignore-all-space --ignore-blank-lines"

alias shx="chmod a+x *.sh *.bash *.csh *.zsh *.groovy *.clj"
alias kk="kill -9"


isMac    && alias pk="pkill -9 -i"
isLinux  && alias pk="pkill -9"

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
alias lr="  time (lein run)"
alias lcr=" time (lein do clean, run)"
alias lc="  time (lein clean)"
alias lt="  time (lein test)"
alias lta=" time (lein test :all)"
alias ltr=" time (lein test-refresh)"
alias lct=" time (lein do clean, test)"
alias lcta="time (lein do clean, test :all)"
alias lctr="time (lein do clean, test-refresh)"

alias lu="time (lein uberjar)"
# alias lcu="(lc; lu)"
alias lcu="time { lein do clean, uberjar; }"  # terminating `;` & space required by bash, but not zsh
alias laca="time {lein ancient check :all}"   # <= this works in zsh, but not bash


alias lcdoo="(lc; ldoo)"
alias ldoo="time lein doo chrome test once"  # phantomjs is deprecated, stuck at old React version
alias door="time lein doo chrome test "      # phantomjs is deprecated, stuck at old React version
alias lcdoor="(lc; door)"

alias rmt="rm -rf ./target"

function lanc() {  # Lein ANCient
  echo ""
  echo ""-----------------------------------------------------------------------------
  echo "project.clj:"
  echo ""
  lein ancient check           :all
  echo ""
  echo ""-----------------------------------------------------------------------------
  echo "profiles.clj:"
  echo ""
  lein ancient check-profiles  :all
  echo ""-----------------------------------------------------------------------------
  echo ""
}

# python env vars
export PYTHONDONTWRITEBYTECODE="enable"     # invaluable for avoiding stale cache errors
# python abbreviations
# alias python=python3
alias py2=python2
alias py3=python3
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
alias crashrm="sudo rm /var/crash/*"       # remove Ubuntu crash files that create annoying warnings
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

function ipaddr() {
  local result=$(ip route get 8.8.8.8 | awk '{print $NF; exit}' )         # 8.8.8.8 is google dns
  echo "${result}"
}
alias ipexternal="curl --silent http://checkip.amazonaws.com"
function ipinfo() {
  echo "local    IP  =>  $(ipaddr)"
  echo "external IP  =>  $(ipexternal)"
}

alias ipinfo="curl  -s http://ipinfo.io/ip"

#-----------------------------------------------------------------------------
# joyent
# alias gojoy="ssh ubuntu@165.225.137.241"
export TRITON_PROFILE="env"
export TRITON_URL="https://us-sw-1.api.joyent.com"
export TRITON_ACCOUNT="catalan42"
unset  TRITON_USER
export TRITON_KEY_ID="$(ssh-keygen -l -f $HOME/.ssh/id_rsa.pub | awk '{print $2}')"
unset  TRITON_TESTING
unset  TRITON_PROFILE
#-----------------------------------------------------------------------------


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

# GCP stuff
export gcp1=35.230.123.85

# lumanu
alias lum='cd ~/work/lumanu && . Envfile && cd ic'
export alan_host_1_name="ec2-54-149-36-244.us-west-2.compute.amazonaws.com"
export alan_host_1_ip="54.149.36.244"
alias ssh-alan-host-1="ssh -i /home/alan/.ssh/alan-keypair-1.pem ubuntu@${alan_host_1_name}"

# consent
# export authentication-service.service.host='https://authentication-service.dev.janusplatform.io'
# export DB_HOST=localhost
# export DB_USERNAME=postgres
# export JANUS_ENVIRONMENT=local
# export LOCAL_DB=t
# export USER_PREFERENCE_SERVICE_URL=https://user-preference-service.dev.janusplatform.io

# echo "common.bash - exit"
