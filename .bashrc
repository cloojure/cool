#!/bin/bash
echo ".bashrc - enter"

PATH=/usr/local/bin:/local/bin:/bin:/usr/local/sbin:/local/sbin:/sbin:/usr/local/opt

# set up vi command line editing mode
set -o vi  

# Get common bash/zsh aliases
source ~/.bash.alias

echo ".bashrc - exit"
