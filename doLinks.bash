#!/bin/bash
coolDir=$PWD
for ff in .tmux.conf .ctags .vimrc .gvimrc \
          .cshrc .bashrc .bash_profile .alias.bash .zshrc \
          .gitconfig .gitignore 
do
  ln -svf ${coolDir}/${ff} ~/${ff}
done
