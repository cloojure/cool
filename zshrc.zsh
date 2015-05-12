#!/bin/zsh
# echo ".zshrc - enter"

export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.history

export JAVA_HOME="/opt/java"
export GROOVY_HOME="/opt/groovy"
export GRAILS_HOME="/opt/grails"

if [[ $(uname -a) == *Darwin* ]]; then

  export DYLD_LIBRARY_PATH=/opt/oracle

# export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_31.jdk/Contents/Home"
  export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_75.jdk/Contents/Home"

# export GROOVY_HOME="/usr/local/opt/groovy/libexec"
# export GROOVY_HOME="/opt/groovy"
  export GROOVY_HOME=""

# export GRAILS_HOME="/opt/grails"
  export GRAILS_HOME=""
fi

# baseline path
path=( . ${HOME}/bin )
path=( $path /opt/bin )
path=( $path /usr/local/git/bin )
path=( $path /opt/java/bin )
path=( $path ${JAVA_HOME}/bin )
path=( $path ${GROOVY_HOME}/bin )
path=( $path ${GRAILS_HOME}/bin )
path=( $path /usr/local/bin  /usr/bin  /bin )
path=( $path /usr/local/sbin /usr/sbin /sbin )
path=( $path /usr/local/opt  /opt/bin )
path=( $path /opt/gsutil )
path=( $path /opt/oracle )
path=( $path /bin/texbin )
path=( $path /usr/local/mysql/bin )
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

srcs='{grails-app,src,test}'    # groovy source file top dirs
alan1="ubuntu@alan-1.eng.rxlogix.com"
alan_c38_1="ubuntu@alan-c38-1.eng.rxlogix.com"

pvax="ubuntu@52.24.170.46"
alias gopvax="ssh -i ~/.ssh/rxdev_merck ${pvax}"

alias psql_aws="psql --username=rxlogix --host=pg-test-1.cksh17mdz5oo.us-west-1.rds.amazonaws.com --dbname=postal"

alias sqlplus_ot1_rx="sqlplus rxlogix/rxlogix123@ora-test-1.cksh17mdz5oo.us-west-1.rds.amazonaws.com:1521/ORCL"
alias sqlplus_ot1_am="sqlplus argus_mart/rxlogix@ora-test-1.cksh17mdz5oo.us-west-1.rds.amazonaws.com:1521/ORCL"
alias sqlplus_argus_mart="sqlplus mart_user/rxlogix@argus-mart-db01.eng.rxlogix.com:1521/pvram"

alias sqlplus_pva_mart="sqlplus pva_app/rxlogix@argus-mart-db01.eng.rxlogix.com:1521/ARGUS_REPORTS"


#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/alan/.gvm/bin/gvm-init.sh" ]] && source "/Users/alan/.gvm/bin/gvm-init.sh"
