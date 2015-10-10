#!/bin/bash
# echo ".bashrc - enter"

# common bash/zsh aliases
source ~/.common.bash

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

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/alan/.gvm/bin/gvm-init.sh" ]] && source "/Users/alan/.gvm/bin/gvm-init.sh"

export NVM_DIR="/home/alan/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
