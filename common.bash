# echo "common.bash - enter"

function first() {
  echo $1
}
function rest() {
  shift
  echo "$@" 
}

function path_prepend() {
  local path_search_dir=$1
  export PATH="${path_search_dir}:${PATH}"
}
function path_append() {
  local path_search_dir=$1
  export PATH="${PATH}:${path_search_dir}"
}

export PATH=.
  path_prepend /bin
  path_prepend /usr/bin
  path_prepend /usr/local/bin
  path_prepend /usr/local/opt
  path_prepend /opt/bin
  path_prepend /opt/local/bin
  path_prepend ${HOME}/bin
  path_prepend ${HOME}/cool/bin
  path_prepend ${HOME}/opt/bin
# path_append /usr/local/sbin
# path_append /usr/sbin
# path_append /sbin

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
# sample 1-line usage:
#   isLinux  && echo "Found Linux"
#   isMac    && echo "Found Darwin"


if $(isLinux) ; then #{
  # echo "Found Linux"
  echo "Bash is dumb!" > /dev/null  # stupid bash can't handle an empty "then" part

  export JAVA_HOME="/opt/java"                                ; path_prepend ${JAVA_HOME}/bin
  export IDEA_HOME="/opt/idea"                                ; path_prepend ${IDEA_HOME}/bin
# export PGDATA="/var/edb/postgresql"
# export EDB_HOME="/opt/PostgreSQL/10"                        ; path_prepend ${EDB_HOME}/bin
# export YOURKIT_HOME="/opt/YourKit-JavaProfiler-2019.1"      ; path_prepend ${YOURKIT_HOME}/bin
# export DATOMIC_HOME="/opt/datomic"                          ; path_prepend ${DATOMIC_HOME}/bin
# export MAVEN_HOME="/opt/apache-maven"                       ; path_prepend ${MAVEN_HOME}/bin
# export PYTHON_PREFIX="${HOME}/.local/bin"                   ; path_prepend ${PYTHON_PREFIX}
# export POSTMAN_HOME="/opt/Postman"                          ; path_prepend ${POSTMAN_HOME}

  # extra cassandra stuff
  # export CQLSH_HOST=localhost  # without this cqlsh tries connecting to 172.17.42.1:9042 & crashes #todo
  # export CQLSH_PORT=9042

  # Maven stuff for ODL
  # export MAVEN_OPTS="-Xmx1048m"

  # path_prepend  /opt/solr/bin $path
    # ***** do not set SOLR_HOME *****
    # SOLR_HOME controls the location on disk of the conf & data dirs for a core,
    #   NOT the install location of the Solr binaries & libs


  function graalvm() {
    export JAVA_HOME=/opt/graalvm
    path_prepend ${JAVA_HOME}/bin
    java -version
  }

  function zulu13() {
    export JAVA_HOME=/opt/zulu
    path_prepend ${JAVA_HOME}/bin
    java  --version
  }

  function java8() {
    export JAVA_HOME=/opt/java8
    path_prepend "${JAVA_HOME}/bin"
    java  -version
  }
  function java11() {
    export JAVA_HOME=/opt/java11
    path_prepend "${JAVA_HOME}/bin"
    java  --version
  }

  function java14() {
    export JAVA_HOME=/opt/java14
    path_prepend "${JAVA_HOME}/bin"
    java  --version
  }

  java14  >& /dev/null  # ********** default java version to use **********


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

# Mac OSX config
if $(isMac) ; then #{
  # echo "Found Darwin"
  echo "OSX is dumb!"  > /dev/null  # stupid bash can't handle an empty "then" part
  # sleep 3

  path_append /usr/local/sbin
  path_append /usr/sbin
  path_append /sbin

  alias d='    ls -ldF'
  alias lal='  ls -alF'
  alias idea='echo "not implemented; start IDEA from dock" '


  function graalvm() {
    export JAVA_HOME=/opt/graalvm/Contents/Home
    export GRAALVM_HOME=${GRAALVM_HOME}  # not needed for Java/Clojure (just llvm/polyglot stuff)
    path_prepend ${JAVA_HOME}/bin
    java -version
  }

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
  function java14() {
    export JAVA_HOME=$(/usr/libexec/java_home -v 14)
    path_prepend ${JAVA_HOME}/bin
    java -version
  }

  function graalvm() {
    export JAVA_HOME=/opt/graalvm/Contents/Home
    path_prepend ${JAVA_HOME}/bin
    java -version
  }

  java14 >& /dev/null

fi #}

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
alias ldirs="find  * -maxdepth 0 -type d "                      # Local Dirs
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

if $(isMac) ; then #{
  function iso-date() {
    date "+%Y-%m-%d"
  }
  function iso-date-short() {
    date "+%Y%m%d"
  }
  function iso-time() {
    date "+%H:%M:%S"
  }
  function iso-time-short() {
    date "+%H%M%S"
  }
  function iso-date-time() {
    echo "$(iso-date)t$(iso-time)"
  }
  function iso-date-time-nice() {
    echo "$(iso-date) $(iso-time)"
  }
  function iso-date-time-str() {
    echo "$(iso-date-short)-$(iso-time-short)"
  }
fi #}

if $(isLinux) ; then #{
  # Return a timestamp string like "20161117-111307" (from  date --iso-8601=seconds => # "2016-11-17T11:13:07-08:00")
  alias dateTimeStr=" date --iso-8601=seconds | sed -e's/^\(.\{19\}\)\(.*\)/\1/' | sed -e's/-//g' | sed -e's/://g' | sed -e's/T/-/g' "
fi #}

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


alias lcdoo="(lc; ldoo)"
alias ldoo="time lein doo chrome test once"  # phantomjs is deprecated, stuck at old React version
alias door="time lein doo chrome test "      # phantomjs is deprecated, stuck at old React version
alias lcdoor="(lc; door)"

alias rmt="rm -rf ./target"

alias laca="lein ancient check :all"   # <= this works in zsh, but not bash
function lanc() {  # Lein ANCient
  echo ""
  echo ""-----------------------------------------------------------------------------
  echo "project.clj:"
  echo ""
  lein ancient check           :all  # lanc()
  echo ""
  echo ""-----------------------------------------------------------------------------
  echo "profiles.clj:"
  echo ""
  lein ancient check-profiles  :all  # lanc()
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
function mkpath() {
  mkdir -p "$1"
}
function mkdirs() {
  mkdir -p "$1"
}
function mkParents() {
  tgtFile=$1
  # echo $tgtFile
  tgtDir=${tgtFile%/*}
  # echo $tgtDir
  mkpath ${tgtDir}
}
function touchPath() {
  tgtFile=$1
  mkParents ${tgtFile}
  touch ${tgtFile}
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

# what your computer thinks its ip address is
function iplocal() {
  ip route get 8.8.8.8 | awk '{print $NF; exit}'    # 8.8.8.8 is google dns
}
# what the outside world thinks your ip address is
function ipexternal() {
  curl --silent http://checkip.amazonaws.com # or:  http://ipinfo.io/ip
}
function ipinfo() {
  echo "local    IP  =>  $(iplocal)"
  echo "external IP  =>  $(ipexternal)"
}

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

# echo "common.bash - exit"
