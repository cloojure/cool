#!/bin/zsh
# echo ".zshrc - enter"

# common bash/zsh aliases
source ~/.common.bash

export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.history

# vi command-line editing mode
bindkey -v

# use sensible globbing (like csh nonomatch)
setopt csh_null_glob

# set prompt string
PS1='%50<>> ..<%~ > '

# zsh-specific aliases
alias dosrc="source ~/.zshrc"


#---------------------------------------------------------------------------------------------------
alias gojoy="ssh ubuntu@165.225.137.241"

# from: https://github.com/creationix/nvm
source ~/.nvm/nvm.sh
# nvm install stable
# nvm use     stable

#---------------------------------------------------------------------------------------------------
# temp vars
aa=~/demo/pedestal/helloworld
bb=~/gh/pedestal/samples/hello-world

# echo ".zshrc - exit"
