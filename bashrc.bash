#!/bin/bash
echo ".bashrc - enter"

# baseline path
PATH=.:${HOME}/bin:/opt/gsutil:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/bin/texbin

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
