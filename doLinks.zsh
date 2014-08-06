#!/bin/zsh
scriptName=$(basename $0)

usageAndExit() {
  cat <<EOF

  Usage:  cd <cool-dir>              # must first cd into ~/cool directory (or equiv)
          ${scriptName} [--force]

          Creates links symlinks for user config files pointing to files in ~/cool or
          equiv (e.g. ~/.zshrc -> ~/cool/.zshrc).  The --force option will delete any
          existing user config files when creating the symlinks.

EOF
exit 1
}

#************************************************************
# main program

if [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]] ; then
  usageAndExit
fi

forceFlg=""
if (( $# >=1 )) ; then
  if [[ "$1" == "--force" ]] ; then
    forceFlg="--force"
  else
    usageAndExit
  fi
fi

coolDir=$(pwd)
for ff in    .tmux.conf .ctags .vimrc .gvimrc \
             .cshrc .bashrc .bash_profile .alias.bash .zshrc \
             .gitconfig .gitignore 
do
  ln -sv ${forceFlg}    ${coolDir}/${ff}            ~/${ff}
done
ln -sv ${forceFlg}      ${coolDir}/profiles.clj     ~/.lein/profiles.clj    

