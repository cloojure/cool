#!/bin/bash
echo ".zshrc - enter"

PATH=/usr/local/bin:/local/bin:/bin:/usr/local/sbin:/local/sbin:/sbin:/usr/local/opt

# set up vi command line editing mode
bindkey -v

# Get common bash/zsh aliases
source ~/.bash.alias

echo ".zshrc - exit"
