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
for ff in    .tmux.conf .ctags .vimrc .gvimrc \
             .cshrc .bashrc .bash_profile .alias.bash .zshrc \
             .gitconfig .gitignore 
do
  if ${forceFlg} ; then
    rm -f ~/${ff}
  fi
  ln -sv ${coolDir}/${ff}  ~/${ff}
done

# Create links to lein profiles.clj
mkdir -p ~/.lein
if ${forceFlg} ; then
  rm -f ~/.lein/profiles.clj \
        ~/.lein/user.clj
fi
sed --expression="s%==user.home==%${coolDir}%" profiles-tmpl.clj > profiles.clj
ln -sv ${coolDir}/profiles.clj      ~/.lein/profiles.clj
ln -sv ${coolDir}/user.clj          ~/.lein/user.clj

# Create links to tools & utils in ~/bin
toolsDir=${coolDir}/tools
mkdir -p ~/bin
for ff in    lein lein-exec lein-exec-p gitdgn.csh
do
  if ${forceFlg} ; then
    rm -f ~/bin/${ff}
  fi
  ln -sv ${toolsDir}/${ff}  ~/bin/${ff}
done

