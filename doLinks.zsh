#!/bin/zsh

forceFlg=""
if [[ "$1" == "--force" ]] ; then
  forceFlg="--force"
fi

coolDir=$(pwd)
for ff in    .tmux.conf .ctags .vimrc .gvimrc \
             .cshrc .bashrc .bash_profile .alias.bash .zshrc \
             .gitconfig .gitignore 
do
  ln -sv ${forceFlg}    ${coolDir}/${ff}            ~/${ff}
done
ln -sv ${forceFlg}      ${coolDir}/profiles.clj     ~/.lein/profiles.clj    

