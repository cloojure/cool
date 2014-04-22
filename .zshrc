#!/bin/bash
echo ".zshrc - enter"

PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/opt

# set up vi command line editing mode
bindkey -v

# Get common bash/zsh aliases
source ~/.bash.alias

PS1='%30<..<%~ > '

echo ".zshrc - exit"
