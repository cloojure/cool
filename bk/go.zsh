#!/bin/zsh 

tar --create --verbose --gzip  \
  --file /media/alan/SeagateBackup/20180905-brandy-home-alan.tar.bz2  \
  --exclude-from ~/cool/bk/tar-excludes.txt  \
  /home/alan

