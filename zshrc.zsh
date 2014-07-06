#!/bin/zsh
echo ".zshrc - enter"

# baseline path
path=( . ${HOME}/bin )
path=( $path /usr/local/git/bin )
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
alias hh="history -99"
alias dosrc="source ~/.zshrc"

echo ".zshrc - exit"
JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
export JAVA_HOME
JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Home"
export JAVA_HOME

bb=~/slab/trillian
cc=~/slab2/trillian
