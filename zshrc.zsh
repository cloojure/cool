#!/bin/zsh
# echo ".zshrc - enter"

export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.history

export JAVA_HOME="/opt/java"
export GROOVY_HOME="/opt/groovy"
export DATOMIC_HOME="/opt/datomic"
export IDEA_HOME="/opt/idea"

if [[ $(uname -a) == *Darwin* ]]; then
  echo "Found Darwin OS"
  sleep 3
  # export DYLD_LIBRARY_PATH=/opt/oracle
  # export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk/Contents/Home"
  # export GROOVY_HOME="/opt/groovy"
fi

# baseline path
path=( . ${HOME}/bin )
path=( $path /opt/bin )
path=( $path ${JAVA_HOME}/bin )
path=( $path ${GROOVY_HOME}/bin )
path=( $path ${DATOMIC_HOME}/bin )
path=( $path ${IDEA_HOME}/bin )
path=( $path /usr/local/bin  /usr/bin  /bin )
path=( $path /usr/local/sbin /usr/sbin /sbin )
path=( $path /usr/local/opt  /opt/bin )
path=( $path /opt/gsutil )

# common bash/zsh aliases
source ~/.alias.bash

# vi command-line editing mode
bindkey -v

# use sensible globbing (like csh nonomatch)
setopt csh_null_glob

# set prompt string
PS1='%50<>> ..<%~ > '

# zsh-specific aliases
alias dosrc="source ~/.zshrc"


#---------------------------------------------------------------------------------------------------
alias gojoy="ssh ubuntu@165.225.137.241"


#---------------------------------------------------------------------------------------------------
# Old Oracle Stuff (Max OSX)
#
### export ORACLE_HOME=/usr/lib/oracle/12.1/client64
### export LD_LIBRARY_PATH=${ORACLE_HOME}/lib:/lib:/usr/lib
### path=( ${ORACLE_HOME}/bin $path )
### alias sqlplus_ot1_rx="sqlplus rxlogix/rxlogix123@ora-test-1.cksh17mdz5oo.us-west-1.rds.amazonaws.com:1521/ORCL"
### alias sqlplus_ot1_am="sqlplus argus_mart/rxlogix@ora-test-1.cksh17mdz5oo.us-west-1.rds.amazonaws.com:1521/ORCL"
### alias sqlplus_argus_mart="sqlplus mart_user/rxlogix@argus-mart-db01.eng.rxlogix.com:1521/pvram"
### alias sqlplus_pva_mart="sqlplus pva_app/rxlogix@argus-mart-db01.eng.rxlogix.com:1521/ARGUS_REPORTS"
#---------------------------------------------------------------------------------------------------


# echo ".zshrc - exit"

