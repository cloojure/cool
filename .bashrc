#!/bin/bash
echo ".bashrc - enter"

PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/opt

# set up vi command line editing mode
set -o vi  

# Get common bash/zsh aliases
source ~/.bash.alias

# Make prompt look like:  ~/.../Trillian/src/trillian/io
PS1='\w > '
PROMPT_DIRTRIM=4

echo ".bashrc - exit"
