#!/bin/tcsh
# echo "~/.cshrc - enter"   

set path =( . ${HOME}/bin )
set path =( $path /usr/local/git/bin )
set path =( $path /usr/local/bin  /usr/bin  /bin )
set path =( $path /usr/local/sbin /usr/sbin /sbin )
set path =( $path /usr/local/opt  /opt/bin )
set path =( $path /opt/gsutil )
set path =( $path /bin/texbin )

# This value of umask is CRUCIAL!  If not set properly (e.g. 007) Episys debug
# output files CANNOT BE CREATED!
umask 022

setenv  EDITOR            "gvim"

setenv JAVA_HOME       "/usr/java/latest"
setenv GROOVY_HOME     "/opt/groovy"
setenv CLOJURE_HOME    "~/.cljr"
setenv DATOMIC_HOME    "/opt/datomic"

# VIM_HOME must be placed last in the path so that vim's version of diff.exe
# doesn't preempt the normal Cygwin diff in /usr/bin.
### set path = ( $path    "$VIM_HOME" )

set path = ( $path    /home/alan/.local/bin )
set path = ( "$GROOVY_HOME/bin"         $path )
set path = ( "$JAVA_HOME/bin"  "$JAVA_HOME/jre/bin"       $path )
set path = ( "$DATOMIC_HOME/bin"        $path )
set path = ( "$CLOJURE_HOME/bin"        $path )

setenv CLASSPATH "~/classes"

# Set filename completion options
set autolist 
set color 
set colorcat

# set tcsh prompt
set ellipsis
set prompt = '%c04 > '

# If running tcsh, set up vi-style command-line editing
set isTCsh = ` echo $version | grep -i '\<tcsh\>' | wc -l `
if ( $isTCsh ) then
  bindkey -v
endif

# Always use egrep
alias grep  "\grep -E"  # same as deprecated 'egrep'

# Convience string for using egrep-style patterns with find. 
# Usage:  find <path> $findr <egrep-regex> ...
set findr = "-regextype posix-egrep -iregex "

alias pdirs       'find * -maxdepth 0 -type d '
alias pfiles      'find * -maxdepth 0 -type f '
alias d           "ls -ldF"
alias dd          'd `pdirs` '
alias hh          "history 99"

alias cshrc       "source  ~/.cshrc "
alias vicshrc     "gvim    ~/.cshrc "
alias vivimrc     "gvim    ~/.vimrc "

alias du          'du -m '
alias df          'df -m '
alias hh          "history 200"
alias wcl         "wc -l"
alias ssh         "ssh -X"

alias gvim        "\gvim  -geom '+900+20' "
alias cshrc       "source  ~/.cshrc "
alias gvt         "~/work/settings/gvt.csh "
alias gvd         "echo gvim -c 'winpos 5 5' -c 'winsize 170 50' "

alias gvt         "~/work/settings/gvt.csh "
alias gvd         "echo gvim -c 'winpos 5 5' -c 'winsize 170 50' "

alias up          "cd .."
alias up2         "cd ../.."
alias up3         "cd ../../.."
alias up4         "cd ../../../.."
alias up5         "cd ../../../../.."
alias up6         "cd ../../../../../.."

alias gits        "git status --short"
alias gitc        "git commit --allow-empty-message -m '' "
alias gitca       "git commit --allow-empty-message --all -m '' "
# alias gitdg       "git difftool --no-prompt --extcmd 'gvimdiff -geometry 180x50+20+40'  "
alias gitdg       "git difftool --no-prompt "

alias shx         "chmod a+x *.bash *.csh *.ksh *.groovy"
alias kk          "kill -9"
alias pk          "pkill -9"

# Temp convenience variables


# echo "~/.cshrc - exit"
