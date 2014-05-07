#!/bin/tcsh
set coolDir = $cwd
foreach ff ( .tmux.conf .ctags .vimrc .gvimrc \
             .cshrc .bashrc .bash_profile .bash.alias .zshrc \
             .gitconfig .gitignore )
  rm -f ~/${ff}
  ln -sv ${coolDir}/${ff} ~/${ff}
end
