#!/bin/bash
echo ".bashrc - enter"

if [[ $(uname -a) == *Darwin* ]]; then
  export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_11.jdk/Contents/Home"
  export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_65.jdk/Contents/Home"
fi

# baseline path
PATH=.:${HOME}/bin
PATH=$PATH:/usr/local/git/bin
PATH=$PATH:${JAVA_HOME}/bin
PATH=$PATH:/usr/local/bin:/usr/bin:/bin
PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
PATH=$PATH:/usr/local/opt:/opt/bin
PATH=$PATH:/opt/gsutil
PATH=$PATH:/bin/texbin

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

echo ".bashrc - exit"
