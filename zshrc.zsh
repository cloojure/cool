#!/bin/zsh
# echo ".zshrc - enter"

export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.history

if [[ $(uname -a) == *Darwin* ]]; then
  export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk/Contents/Home"
  export GROOVY_HOME="GROOVY_HOME=/usr/local/opt/groovy/libexec"
  export DYLD_LIBRARY_PATH=/opt/oracle
fi
if [[ $(uname -a) == *Linux*.fc20.* ]]; then
  export JAVA_HOME="/usr/java/jdk1.8.0_11"
fi

# baseline path
path=( . ${HOME}/bin )
path=( $path /opt/bin )
path=( $path /usr/local/git/bin )
path=( $path /opt/java/bin )
path=( $path ${JAVA_HOME}/bin )
path=( $path /usr/local/bin  /usr/bin  /bin )
path=( $path /usr/local/sbin /usr/sbin /sbin )
path=( $path /usr/local/opt  /opt/bin )
path=( $path /opt/gsutil )
path=( $path /opt/oracle )
path=( $path /bin/texbin )
path=( $path /opt/homebrew-cask/Caskroom/pgadmin3/1.20.0/pgAdmin3.app/Contents/MacOS )

# #awt todo generalize this
path=( $path /usr/lib/postgresql/9.3/bin)

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

# echo ".zshrc - exit"

# aa=/home/alan/sone/endpoints/prototype/pedestal-service
bb=/home/alan/sone2/endpoints/prototype/pedestal-service
aa=/home/alan/vagrant/endpoints/prototype/pedestal-service

# export LD_LIBRARY_PATH=/lib:/usr/lib:/home/ubuntu/instantclient_12_1
export ORACLE_HOME=/usr/lib/oracle/12.1/client64
export LD_LIBRARY_PATH=${ORACLE_HOME}/lib:/lib:/usr/lib
path=( ${ORACLE_HOME}/bin $path )

alias sqldev="~/Applications/SQLDeveloper.app/Contents/MacOS/sqldeveloper.sh"

alan1="ubuntu@alan-1.eng.rxlogix.com"
alan_c38_1="ubuntu@alan-c38-1.eng.rxlogix.com"

alias psql_aws="psql --username=rxlogix --host=pg-test-1.cksh17mdz5oo.us-west-1.rds.amazonaws.com --dbname=postal"

alias sqlplus_ot1_rx="rxlogix/rxlogix123@ora-test-1.cksh17mdz5oo.us-west-1.rds.amazonaws.com:1521/ORCL"
alias sqlplus_ot1_am="argus_mart/rxlogix@ora-test-1.cksh17mdz5oo.us-west-1.rds.amazonaws.com:1521/ORCL"
