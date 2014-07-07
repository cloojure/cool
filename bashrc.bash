#!/bin/bash
echo ".bashrc - enter"

# baseline path
PATH=.:${HOME}/bin
PATH=$PATH:/usr/local/git/bin
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
alias hh="history 99"
alias dosrc="source ~/.bashrc"

echo ".bashrc - exit"
