#!/bin/zsh
coolDir=$(pwd)
for ff in    .tmux.conf .ctags .vimrc .gvimrc \
             .cshrc .bashrc .bash_profile .alias.bash .zshrc \
             .gitconfig .gitignore 
do
  rm -f ~/${ff}
  ln -sv ${coolDir}/${ff} ~/${ff}
done
