#!/bin/bash
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

# Since OSX doesn't allow "ln -sv --force ...", we must use binary flags and
# remove any pre-existing files manually
forceFlg=false
if (( $# >= 1 )) ; then
  if [[ "$1" == "--force" ]] ; then
    forceFlg=true
  else
    usageAndExit
  fi
fi

# Create links to dot-files in home directory "~"
coolDir=$(pwd)
for ff in    .tmux.conf .ctags .vim .vimrc .gvimrc .ideavimrc \
             .cshrc .bashrc .bash_profile .common.bash .zshrc .zshenv \
             .psqlrc .gitconfig .gitignore  .zprint.edn
do
  if ${forceFlg} ; then
    rm -f ~/${ff}
  fi
  ln -sv ${coolDir}/${ff}  ~/${ff}
done

# Create links to lein profiles.clj
mkdir -p ~/.lein
if ${forceFlg} ; then
  rm -f ~/.lein/profiles.clj 
fi
sed -e"s%==user.home==%${HOME}%" profiles-tmpl.clj > profiles.clj
ln -sv ${coolDir}/profiles.clj      ~/.lein/profiles.clj

# Create links to lein profiles.clj
mkdir -p ~/.boot
if ${forceFlg} ; then
  rm -f ~/.boot/boot.properties
fi
ln -sv ${coolDir}/boot.properties  ~/.boot/boot.properties

# Create links to tools & utils in ~/bin
###   toolsDir=${coolDir}/tools
###   mkdir -p ~/bin
###   pushd ${toolsDir}
###     for ff in *
###     do
###       if ${forceFlg} ; then
###         rm -f ~/bin/${ff}
###       fi
###       ln -sv ${toolsDir}/${ff}  ~/bin/${ff}
###     done
###   popd

# Create links to tools & utils in ~/.ssh
### mkdir -p ~/.ssh
### if ${forceFlg} ; then
###   rm -f ~/.ssh/config
### fi
### ln -sv ${coolDir}/config.ssh ~/.ssh/config
### chmod --recursive go-rwx ~/.ssh 

