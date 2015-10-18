#!/bin/bash
# echo ".bashrc - enter"

# if [[ $(uname -a) == *Darwin* ]]; then
# if [[ $(uname -a) == *Linux*.fc20.* ]]; then
#   export JAVA_HOME="/usr/java/jdk1.8.0_11"
# fi

export JAVA_HOME=/opt/java

# baseline path
PATH=.:${HOME}/bin
PATH=$PATH:${JAVA_HOME}/bin
PATH=$PATH:/usr/local/bin:/usr/bin:/bin
PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
PATH=$PATH:/opt/bin

# common bash/zsh aliases
source ~/.alias.bash

# vi command-line editing mode
set -o vi  

# use sensible globbing (like csh nonomatch)
shopt -s nullglob

# set prompt string
PS1='\w > '
PROMPT_DIRTRIM=4

# bash-specific aliases
alias dosrc="source ~/.bashrc"

# echo ".bashrc - exit"
