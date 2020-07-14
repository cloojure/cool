#!/bin/zsh
# echo ".zshrc - enter"

# common bash/zsh aliases in  ~/.common.bash  are sourced from ~/.zshenv

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
alias dosrc="source ~/.zshenv ; source ~/.zshrc"

# echo ".zshrc - exit"
