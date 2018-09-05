#!/bin/zsh 

function dateTimeStr()  {
  echo $(date --iso-8601=seconds \ | sed -e'\''s/^\(.\{19\}\)\(.*\)/\1/'\'' | sed -e'\''s/-//g'\'' | sed -e'\''s/://g'\'' | sed -e'\''s/T/-/g'\' )
}

function homeStr() {
  echo  $(echo "${HOME}" | sed -e 's:\/:-:g' )
}

function backup-tar-name() {
  echo "$(dateTimeStr)-$(hostname)$(homeStr).tar"
}

echo "now   => $(dateTimeStr)"
echo "home  => $(homeStr)"
echo "name  => $(backup-tar-name)"

exit 1
tar --create --verbose  \
  --file "/media/alan/SeagateBackup/$(backup-tar-name)"  \
  --exclude-from ~/cool/bk/tar-excludes.txt  \
  ${HOME}

