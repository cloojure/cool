#!/bin/zsh
echo ".zshrc - enter"

# baseline path
PATH=.:${HOME}/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/usr/local/opt

# common bash/zsh aliases
source ~/.bash.alias

# vi command-line editing mode
bindkey -v

# use sensible globbing (like csh nonomatch)
setopt csh_null_glob

# set prompt string
PS1='%30<..<%~ > '

echo ".zshrc - exit"
