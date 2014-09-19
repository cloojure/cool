#!/bin/zsh
# echo ".zshrc - enter"

export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.history

if [[ $(uname -a) == *Darwin* ]]; then
  export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_11.jdk/Contents/Home"
  export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_65.jdk/Contents/Home"
fi
if [[ $(uname -a) == *Linux*.fc20.* ]]; then
  export JAVA_HOME="/usr/java/jdk1.8.0_11"
fi

# baseline path
path=( . ${HOME}/bin )
path=( $path /usr/local/git/bin )
path=( $path ${JAVA_HOME}/bin )
path=( $path /usr/local/bin  /usr/bin  /bin )
path=( $path /usr/local/sbin /usr/sbin /sbin )
path=( $path /usr/local/opt  /opt/bin )
path=( $path /opt/gsutil )
path=( $path /bin/texbin )

# common bash/zsh aliases
source ~/.alias.bash

# vi command-line editing mode
bindkey -v

# use sensible globbing (like csh nonomatch)
setopt csh_null_glob

# set prompt string
PS1='%30<..<%~ > '


# zsh-specific aliases
alias dosrc="source ~/.zshrc"

# echo ".zshrc - exit"
