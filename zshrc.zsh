#!/bin/zsh
echo ".zshrc - enter"

# baseline path
path=( . ${HOME}/bin /usr/local/opt /usr/local/bin /usr/bin /bin /usr/local/sbin /usr/sbin /sbin )

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
